class Event < ActiveRecord::Base
  attr_accessible :date, :name, :lat, :lng, :gmaps , :old_id, :unique_id

  has_many :event_attributes
  has_many :operations, :through => :event_attributes
  has_many :units,  :through => :event_attributes
end
