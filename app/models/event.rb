class Event < ActiveRecord::Base
  attr_accessible :event_date, :name, :lat, :lng, :gmaps , :old_id, :unique_id, :address, :unit_id, :operation_id, :country_id, :event_type_id, :description

  belongs_to :unit
  belongs_to :operation
  belongs_to :country
  belongs_to :event_type

  validates_presence_of :name

  acts_as_gmappable :process_geocoding => :geocode?,:lat=>'lat', :lng=>'lng',:address => "address"

  def date_formated
    if self.event_date.present?
      return event_date.strftime('%a, %b %e %Y')
    else
      return ""
    end
  end

  def flag_path
    if self.country.present?
      country.flag_path
    elsif self.unit.present? && self.unit.country.present?
      unit.country.flag_path
    else
      nil
    end
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
     return {lng: lat, lng: lng} unless lat.nil? || lng.nil?
   end

  def gmaps4rails_infowindow
    "<div class=\"gwindow\"><h5>#{name}</h5><h6>on #{date_formated}</h6><p><img src=\"/assets/#{flag_path}\" width=40 class=\"flag\" align=\"left\"/><a href=\"/units/#{self.unit.id}\">#{self.unit.name}</a><br><a href=\"/operations/#{self.operation.id unless self.operation.nil?}\">#{'Operation ' + self.operation.name unless self.operation.nil?}</a></p></div>"
  end

  def gmaps4rails_title
      return event_date.strftime("%b %e %Y") unless event_date.nil?
  end

  def gmaps4rails_marker_picture
    if self.unit.present? && self.unit.icon.present?
      path = self.unit.icon.path
      folder_path = path.split("_")
      size = folder_path.delete_at(-1).split(".")[0].to_i
      folder_path = "/assets/" + path
      {
        "picture" => folder_path,
        "width" => size,
        "height" => size,
        "marker_anchor" => [ size/2, size]
      }
    else
      {
        "picture" => "/assets/allies_infantry/allies_infantry_24.png",
        "width" => 24,
        "height" => 24,
        "marker_anchor" => [ 12, 24]
      }
    end
  end

end
