class Event < ActiveRecord::Base
  attr_accessible :event_date, :name, :lat, :lng, :gmaps , :old_id, :unique_id, :address, :unit_id, :operation_id, :country_id, :event_type_id, :description

  belongs_to :unit
  belongs_to :operation
  belongs_to :country
  belongs_to :event_type

  validates_presence_of :name

  acts_as_gmappable :process_geocoding => :geocode?,:lat=>'lat', :lng=>'lng',:address => "address"

  def date_formated
    return event_date.strftime('%a, %b %e %Y') unless event_date.nil?
  end

  def geocode?
    if !lat.blank? && !lat.blank?
      false
    elsif (lat.blank? || lng.blank?) && !address.blank?
      true
    elsif address_changed?
      true
    else
      false
    end
  end

  def gmaps4rails_infowindow
    "<h6>#{name}<br><small>#{date_formated}</small></h6>"
  end

  def gmaps4rails_title
      return event_date.strftime("%b %e %Y") unless event_date.nil?
  end

end
