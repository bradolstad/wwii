class Operation < ActiveRecord::Base
  attr_accessible :name, :old_id, :campaign_id, :start_date, :end_date

  belongs_to :campaign

  has_many :event_attributes
  has_many :events, :through => :event_attributes

  validates_presence_of :name
  validates_uniqueness_of :name

  def boundaries
    locations = self.events.collect { |event| {lat:event.lat,lng:event.lng} }
    return locations.uniq
  end
end
