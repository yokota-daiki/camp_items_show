class SearchItemsController < ApplicationController
  def search
    @keyword = params[:keyword]
    @items = []
    if @keyword.present?
      @results = RakutenWebService::Ichiba::Product.search(keyword: @keyword, genreId: 101_975) # 楽天価格ナビ製品検索で渡されたkeywordを元に検索

      childe_categories = []
      @results.each do |result|
        childe_categories << result['genreId'] # 検索結果のアイテムのジャンルIDを配列に挿入
      end

      parent_categories = []
      childe_categories.each do |c|
        parent_categories << RakutenWebService::Ichiba::Genre[c] # アイテム検索で取得したアイテムのジャンルIDをそれぞれ楽天ジャンルAPI検索にかけて，配列に挿入
      end

      categories = []
      parent_categories.each do |p|
        categories << if p.parents[2].present?
                        p.parents[2]['genreName'] # 親のジャンルを取得
                      end
      end
      @results.zip(categories) do |result, c|
        item = Item.new(read(result, c))
        @items << item
      end
    end
  end

  private

  def read(result, c)
    name = result['productName']
    url = result['productUrlPC']
    image_url = result['mediumImageUrl']
    maker = result['makerName']
    category = c
    { name:, url:, image_url:, maker:, category: }
  end
end
