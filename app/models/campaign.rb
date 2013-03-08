class Campaign < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :event_attributes
  has_many :events, :through => :event_attributes
  has_many :operations

  validates_presence_of :name
  validates_uniqueness_of :name
end
