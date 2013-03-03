class Event < ActiveRecord::Base
  attr_accessible :date, :name, :lat, :lng, :gmaps

  has_many :event_attributes
  has_many :operations, :through => :event_attributes
  has_many :units,  :through => :event_attributes
end
