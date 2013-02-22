class Event < ActiveRecord::Base
  attr_accessible :date, :name, :zoom_level

  belongs_to :location
  belongs_to :campaign
  belongs_to :event_type

  has_many :company_events
  has_many :companies, :through => :company_events
end
