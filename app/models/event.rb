class Event < ActiveRecord::Base
  belongs_to :location
  belongs_to :campaign
  belongs_to :event_type
  attr_accessible :date, :name, :zoom_level
end
