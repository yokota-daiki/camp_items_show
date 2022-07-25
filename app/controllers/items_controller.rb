class ItemsController < ApplicationController
  
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

  def index
  end

  def new
  end

  def create
    
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
end
