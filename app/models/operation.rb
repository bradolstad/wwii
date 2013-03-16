class Operation < ActiveRecord::Base
  attr_accessible :name, :old_id, :campaign_id, :start_date, :end_date, :description, :active

  belongs_to :campaign

  has_many :events

  validates_presence_of :name
  validates_uniqueness_of :name

   def self.events?
    Operation.where(active:true).order('name asc')
  end

  def filtered_events(date=nil)
    @event_type = EventType.where(name:"Plane Crash").first
    if date
      date = DateTime.parse(date)
      return Event.includes(:unit,:country).where('operation_id = ? AND event_type_id != ? AND event_date = ?',self.id, @event_type.id, date)
    else
      return Event.includes(:unit,:country).where('operation_id = ? AND event_type_id != ?',self.id, @event_type.id).order('event_date asc')
    end
  end

  def units
    units = self.events.collect do |event|
      if event.unit.any?
        event.unit
      else
        nil
      end
    end
    return units.flatten.uniq.compact
  end

  def self.data
    data = Operation.events?.map do |operation|
      {
        :id => operation.id,
        :boundaries => operation.boundaries
      }
    end
    return data
  end

  def self.list
    operations = Operation.all.map do |operation|
      {:name=>'Operation ' + operation.name, :id=>operation.id}
    end
  end

  def date_formated(date_object)
    return date_object.strftime('%b %Y') unless date_object == nil
  end

  def boundaries
    locations = self.events.collect { |event| {lat:event.lat,lng:event.lng} }
    return locations.uniq
  end
end
