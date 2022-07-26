class ItemsController < ApplicationController

  def index
    @items = current_user.myitem_items
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, success: t('.success')
    else
      render :search
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :url, :image_url, :maker, :category)
  end
end
