class EventType < ActiveRecord::Base
  attr_accessible :name

  belongs_to :icon
end
