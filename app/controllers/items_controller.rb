class ItemsController < ApplicationController
  
  def search
    @keyword = params[:keyword]
    if @keyword.present?
      @items = RakutenWebService::Ichiba::Item.search(keyword: @keyword)
      #results.each do |result|
        #item = Item.new(read(result))
        #@items << item
      #end
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
    name = result["itemName"]
    url = result["itemUrl"]
    image_url = result["smallImageUrls"]
    {
      name: "name",
      url: "url",
      image_url: "image_url"
    }
  end
end
