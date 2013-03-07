class Event < ActiveRecord::Base
  attr_accessible :event_date, :name, :lat, :lng, :gmaps , :old_id, :unique_id

  has_many :event_attributes
  has_many :operations, :through => :event_attributes
  has_many :units,  :through => :event_attributes

  acts_as_gmappable

  def latitude
    return self.lat
  end

  def longitude
    return self.lng
  end

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street}, #{self.city}, #{self.country}"
  end

end
