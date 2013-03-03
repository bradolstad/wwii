class Country < ActiveRecord::Base
  attr_accessible :name, :old_id

  has_many :units
  has_many :event_attributes
  has_many :events, :through => :event_attributes
end
