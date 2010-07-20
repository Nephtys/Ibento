class GeoMap < ActiveRecord::Base
  has_one :event
  validates :address, :presence => true

  private

  before_save {|geo_map| process_values(geo_map)}

  def event_id
    event.id
  end

  def process_values(geo_map)
    self.width ||= 300
    self.zoom ||= 16
    set_link(geo_map)
  end

  def set_link(geo_map)
    address_uri = URI.escape(geo_map.address)
    link = "http://maps.google.com/maps/api/staticmap?center="
    link += address_uri
    link += "&markers=color:yellow|"
    link += address_uri
    link += "&zoom="+geo_map.zoom.to_s+"&size="+geo_map.width.to_s+"x"+geo_map.width.to_s
    link += "&maptype=roadmap&sensor=false"
    self.link = link
  end
end
