class BookmarkCampsController < ApplicationController

  def create
    @camp_field = CampField.find_or_create_by(params_camp_field)
    current_user.add_bookmark(@camp_field)
  end

  def destroy
    @camp_field = current_user.bookmark_camps.find(params[:id]).camp_field
    current_user.delete_bookmark(@camp_field)
  end

  def index
    @bookmark_camps_fields = current_user.bookmark_camp_field
  end

  private

  def params_camp_field
    params.require(:camp_field).permit(:name, :latitude, :longitude, :address, :image)
  end
end
