class Country < ActiveRecord::Base
  attr_accessible :name

  has_many :units
  has_many :event_attributes
  has_many :events, :through => :event_attributes
end
