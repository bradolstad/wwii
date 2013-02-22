class EventType < ActiveRecord::Base
  belongs_to :icon
  attr_accessible :name
end
