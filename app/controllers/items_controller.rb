class ItemsController < ApplicationController

  def index
    @items = current_user.myitem_items
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      current_user.add_item(@item)
      redirect_to items_path, success: t('.success')
    else
      render :search
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :maker, :category, :image)
  end
end
