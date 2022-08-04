class SearchCampsController < ApplicationController
  skip_before_action :require_login


  def search
    @camp_fields = []
    keyword = params[:keyword]
    if keyword.present?
      client = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
      results = client.spots_by_query(params[:keyword], types: 'campground', detail: true, radius: 200000)
      results.each do |result|
        camp_field = CampField.new(read(result))
        @camp_fields << camp_field
      end
      gon.campLat = @camp_fields.map(&:lat)
      gon.campLng = @camp_fields.map(&:lng)
    else
      render :search
    end
    #byebug
    #results = Geocoder.search(params[:keyword])
    #@latlng = results.first.coordinates
  end

  private
  
  def read(result)
    name = result["name"]
    lat = result["lat"]
    lng = result["lng"]
    address = result["formatted_address"]
    {name: name, lat: lat, lng: lng, address: address}
  end

end
