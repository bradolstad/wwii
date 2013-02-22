class Location < ActiveRecord::Base
  attr_accessible :lattitude, :longitude, :name
  has_many :events
end
