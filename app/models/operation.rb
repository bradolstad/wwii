class Operation < ActiveRecord::Base
  attr_accessible :name, :old_id, :campaign_id, :start_date, :end_date, :description, :active

  belongs_to :campaign

  has_many :events

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.events?
    Operation.where(active:true).order('name asc')
  end

  def filtered(min=nil,max=nil)
    if min.nil? && max.nil?
      self.events.includes(:unit,:country).no_planes.order('event_date asc')
    elsif min.nil?
      self.events.includes(:unit,:country).no_planes.where("event_date <= ?",max).order('event_date asc')
    elsif max.nil?
      self.events.includes(:unit,:country).no_planes.where("event_date >= ?",min).order('event_date asc')
    else
      self.events.includes(:unit,:country).no_planes.where("event_date between ? and ? ",min,max).order('event_date asc')
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

  def first_date
    events.no_planes.first.event_date.beginning_of_day || start_date.beginning_of_day || Date.parse('1940-01-01')
  end

  def last_date
    events.no_planes.last.event_date.end_of_day || end_date.end_of_day || Date.parse('1949-12-31')
  end

  def boundaries
    locations = self.events.collect { |event| event.location }
    return locations.uniq
  end
end
