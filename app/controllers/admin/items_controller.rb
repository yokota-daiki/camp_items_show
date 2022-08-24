class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: %i[destroy]

  def index
    @items = Item.with_attached_image.all
  end

  def destroy
    @item.destroy!
    redirect_to admin_items_path, success: t('.success')
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
