class Operation < ActiveRecord::Base
  attr_accessible :name, :old_id, :campaign_id, :start_date, :end_date, :description

  belongs_to :campaign

  has_many :events

  validates_presence_of :name
  validates_uniqueness_of :name

   def self.events?
    operations = Operation.order('name asc').map do |operation|
      if operation.events.count > 0
        operation
      end
    end
    return operations.compact
  end

  def filtered_events
    @event_type = EventType.where(name:"Plane Crash").first
    return Event.where('operation_id = ? AND event_type_id != ?',self.id, @event_type.id)
  end

  def units
    units = self.events.collect do |event|
      if event.unit
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

  def date_formated(date_object)
    return date_object.strftime('%b %Y') unless date_object == nil
  end

  def boundaries
    locations = self.events.collect { |event| {lat:event.lat,lng:event.lng} }
    return locations.uniq
  end
end
