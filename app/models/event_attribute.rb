class EventAttribute < ActiveRecord::Base
  attr_accessible :event_id, :unit_id, :country_id, :operation_id

  belongs_to :event
  belongs_to :unit
  belongs_to :country
  belongs_to :operation
end
