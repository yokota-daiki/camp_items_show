class MyitemsController < ApplicationController

  def create
    item = Item.find_by(name: params[:item][:name])
    if item.blank? #Itemテーブルにitemが存在していない場合 必然的にMyitemテーブルには存在していない
      myitem = Item.create(item_params)
      current_user.add_item(myitem)
      redirect_to search_items_path, success: t('.success')
    elsif item.present? && current_user.myitem_items.exclude?(item) #Itemテーブルにitemが存在しており，Myitemテーブルに存在していない場合
      current_user.add_item(item)
      redirect_to search_items_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail') 
      render 'search_item'
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :url, :image_url, :maker, :category)
  end
end
