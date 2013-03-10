class Operation < ActiveRecord::Base
  attr_accessible :name, :old_id, :campaign_id, :start_date, :end_date

  belongs_to :campaign

  has_many :event_attributes
  has_many :events, :through => :event_attributes

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.events?
    operations = Operation.all.map do |operation|
      if operation.events.count > 0
        operation
      end
    end
    return operations.compact
  end

  def self.data
    data = Operation.events?.map do |operation|
      {
        :id => operation.id,
        :name => operation.name,
        :start_date => operation.start_date,
        :end_date => operation.end_date,
        :boundaries => operation.boundaries
      }
    end
    return data
  end

  def boundaries
    locations = self.events.collect { |event| {lat:event.lat,lng:event.lng} }
    return locations.uniq
  end
end
