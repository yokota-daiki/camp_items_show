class SearchItemsController < ApplicationController

  def search
    @keyword = params[:keyword]
    @items = []
    if @keyword.present?
      @results = RakutenWebService::Ichiba::Product.search(keyword: @keyword, genreId: 101975)
      @results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
    end
  end

  def create
    item = Item.find_by(name: params[:item][:name])
    if item.blank? #Itemテーブルにitemが存在していない場合 必然的にMyitemテーブルには存在していない
      myitem = Item.create(item_params)
      current_user.add_item(myitem)
      redirect_to search_search_item_path, success: t('.success')
    elsif item.present? && current_user.myitem_items.exclude?(item) #Itemテーブルにitemが存在しており，Myitemテーブルに存在していない場合
      current_user.add_item(item)
      redirect_to search_search_item_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail') 
      render :search
    end
  end

  private

  def read(result)
    name = result["productName"]
    url = result["productUrlPC"]
    image_url = result["mediumImageUrl"]
    maker = result["makerName"]
    category = result["genreName"]
    {name: name, url: url, image_url: image_url, maker: maker, category: category}
  end
  
  def item_params
    params.require(:item).permit(:name, :url, :image_url, :maker, :category)
  end
end
