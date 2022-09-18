class SearchItemsController < ApplicationController
  def search
    @keyword = params[:keyword]
    if @keyword.present?
      @results = RakutenWebService::Ichiba::Product.search(keyword: @keyword, genreId: 101_975) # 楽天価格ナビ製品検索で渡されたkeywordを元に検索

      childe_categories = @results.map do |result| #検索結果のアイテムのジャンルIDを配列を作成
        result['genreId'] 
      end

      parent_categories = childe_categories.map do |childe_category| #アイテム検索で取得したアイテムのジャンルIDをそれぞれ楽天ジャンルAPI検索にかけて，配列を作成
        RakutenWebService::Ichiba::Genre[childe_category] 
      end

      categories = parent_categories.map do |parent_category|
        parent_category.parents[2]['genreName'] if parent_category.parents[2].present? # 親のジャンルを取得
      end

      @items = @results.zip(categories) do |result, category|
        item = Item.new(read(result, category))
      end
    end
  end

  private

  def read(result, category)
    name = result['productName']
    url = result['productUrlPC']
    image_url = result['mediumImageUrl']
    maker = result['makerName']
    category = category
    { name:, url:, image_url:, maker:, category: }
  end
end
