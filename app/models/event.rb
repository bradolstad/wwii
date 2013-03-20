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

  def gmaps4rails_infowindow
    "<h6>#{name}<br><small>#{date_formated}</small></h6><img src=\"/assets/#{flag_path}\" width=40 />"
  end

  def gmaps4rails_title
      return event_date.strftime("%b %e %Y") unless event_date.nil?
  end

  def gmaps4rails_marker_picture
    if self.unit.present? && self.unit.icon.present?
      path = self.unit.icon.path
      folder_path = path.split("_")
      size = folder_path.delete_at(-1).split(".")[0].to_i
      folder_path = "/assets/" + folder_path.join("_") + "/" + path
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
