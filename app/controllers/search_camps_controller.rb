class SearchCampsController < ApplicationController
  skip_before_action :require_login


  def search
    @camp_fields = []
    keyword = params[:keyword]
    
    if keyword.present?
      client = GooglePlaces::Client.new(ENV['GOOGLE_API_KEY'])
      results = client.spots_by_query(keyword, language: 'ja', types: 'campground' )
      
      results.each do |result|
        camp_field = CampField.new(read(result))
        @camp_fields << camp_field
      end
      gon.campLat = @camp_fields.map(&:latitude)
      gon.campLng = @camp_fields.map(&:longitude)
      gon.campname = @camp_fields.map(&:name)
    else
      render :search
    end
  end

  private
  
  def read(result)
    name = result["name"]
    latitude = result["lat"]
    longitude = result["lng"]
    address = result["formatted_address"]
    photo_reference = result["photos"][0]&.photo_reference
    image = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=#{ENV['GOOGLE_API_KEY']}"
    {name: name, latitude: latitude, longitude: longitude, address: address, image: image}
  end

end
