class MyitemsController < ApplicationController
  def create
    myitem = Item.find_or_create_by(name: params[:item][:name])
    current_user.add_myitem(myitem) if current_user.myitem_items.exclude?(myitem)
    redirect_to items_path, success: t('.success')
  end

  def destroy
    item = current_user.myitem_items.find(params[:id]).myitems
    current_user.delete_myitem(item)
    redirect_to items_path, success: t('.success')
  end

  private

  def item_params
    params.require(:item).permit(:name, :url, :image_url, :maker, :category)
  end
end
