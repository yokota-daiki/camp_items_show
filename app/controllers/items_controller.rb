class ItemsController < ApplicationController
  def index
    @items = current_user.myitem_items.with_attached_image.order(created_at: :desc).page(params[:page]).per(8)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      current_user.add_myitem(@item)
      redirect_to items_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def select_category
    params[:category] = Item.categories.values if params[:category].blank?
    @selected_category = params[:category]
    @items = current_user.myitem_items.where(category: @selected_category)
  end

  private

  def item_params
    params.require(:item).permit(:name, :maker, :category, :image)
  end
end
