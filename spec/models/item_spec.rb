require 'rails_helper'

RSpec.describe Item, type: :model do
  it '全ての属性が存在していれば有効である' do
    item = Item.new(
      name: "test_item",
      url: "test_url",
      maker: "test_maker",
      category: "tent"
    )

    expect(item).to be_valid
  end

  it 'アイテム名が存在していないと無効である' do
    item = Item.new(
      name: nil
    )

    item.valid?
    expect(item.errors.full_messages).to include("アイテム名を入力してください")
  end
end
