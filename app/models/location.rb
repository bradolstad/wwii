class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name

  has_many :events

  acts_as_gmappable

  def gmaps4rails_address
  "#{self.latitude}, #{self.longitude}"
end

end
