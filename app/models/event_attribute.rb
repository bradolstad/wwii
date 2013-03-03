class EventAttribute < ActiveRecord::Base
  belongs_to :event
  belongs_to :unit
  belongs_to :country
  belongs_to :operation
  # attr_accessible :title, :body
end
