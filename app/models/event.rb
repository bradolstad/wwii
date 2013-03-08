class Event < ActiveRecord::Base
  attr_accessible :event_date, :name, :lat, :lng, :gmaps , :old_id, :unique_id, :address

  has_many :event_attributes
  has_many :operations, :through => :event_attributes
  has_many :units,  :through => :event_attributes

  acts_as_gmappable :process_geocoding => :geocode?,:lat=>'lat', :lng=>'lng',:address => "address"

  def date_formated
    return event_date.strftime('%a, %b %e %Y') unless event_date.nil?
  end

  def geocode?
    (!address.blank? && (lat.blank? || lng.blank?)) || address_changed?
  end

  def gmaps4rails_infowindow
    "<h4>#{name}<br>
      <small>#{date_formated}</small>
    </h4>"
  end

end
