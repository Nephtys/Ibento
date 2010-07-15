class GeoMap < ActiveRecord::Base
  has_many :events
  validates :address, :width, :zoom, :presence => true

  private

  before_save {|geo_map| geo_map.link = get_link(geo_map)}

  def get_link(geo_map)
    address_uri = URI.escape(geo_map.address)
    link = "http://maps.google.com/maps/api/staticmap?center="
    link += address_uri
    link += "&markers=color:yellow|"
    link += address_uri
    link += "&zoom="+geo_map.zoom.to_s+"&size="+geo_map.width.to_s+"x"+geo_map.width.to_s
    link += "&maptype=roadmap&sensor=false"
    return link
  end
end
