require 'rails_helper'

RSpec.describe Myitem, type: :model do
  let!(:myitem) { create(:myitem) }
  it 'user_idとitem_idが存在する場合有効である' do
    expect(myitem).to be_valid
  end 

  it 'user_idが存在しない場合無効である' do
    myitem.user = nil
    expect(myitem).to be_invalid
  end

  it 'item_idが存在しない場合無効である' do
    myitem.item = nil
    expect(myitem).to be_invalid
  end
end
