class Event < ActiveRecord::Base
  attr_accessible :event_date, :name, :lat, :lng, :gmaps , :old_id, :unique_id, :address, :unit_id, :operation_id, :country_id, :event_type_id, :description

  belongs_to :unit
  belongs_to :operation
  belongs_to :country
  belongs_to :event_type

  validates_presence_of :name, :event_date

  acts_as_gmappable :process_geocoding => :geocode?,:lat=>'lat', :lng=>'lng',:address => "address"

  scope :no_planes, lambda { where("event_type_id != ?",EventType.find_by_name("Plane Crash").id).order('event_date asc')}

  scope :with_dates, lambda { where("event_date IS NOT null")}

  def date_formated
    (event_date.strftime('%a, %b %e %Y') unless event_date.nil?) || ""
  end

  def flag_path
      (country.flag_path unless country.nil?) || (unit.country.flag_path unless unit.nil? || unit.country.nil?) || nil
  end

  def calculate_country
    self.unit.country || self.country
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

  def location
     return {lat: lat, lng: lng} unless lat.nil? || lng.nil?
  end

  def gmaps4rails_title
      return event_date.strftime("%b %e %Y") unless event_date.nil?
  end

  def marker_picture
    if self.unit.present? && self.unit.icon.present?
      path = self.unit.icon.path
      folder_path = path.split("_")
      size = folder_path.delete_at(-1).split(".")[0].to_i
      folder_path = "/assets/" + path
      {
        :picture => folder_path,
        :width => size,
        :height => size,
        :marker_anchor => [ size/2, size]
      }
    else
      {
        :picture => "/assets/allies_infantry/allies_infantry_24.png",
        :width => 24,
        :height => 24,
        :marker_anchor => [ 12, 24]
      }
    end
  end

end
