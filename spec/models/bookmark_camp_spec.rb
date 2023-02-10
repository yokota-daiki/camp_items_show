require 'rails_helper'

RSpec.describe BookmarkCamp, type: :model do
  let!(:bookmark_camp) { create(:bookmark_camp) }
  it 'user_idとcamp_field_idが存在する場合有効である' do
    expect(bookmark_camp).to be_valid
  end

  it 'user_idが存在しない場合無効である' do
    bookmark_camp.user = nil
    expect(bookmark_camp).to be_invalid
  end
  
  it 'camp_field_idが存在しない場合無効である' do
    bookmark_camp.camp_field = nil
    expect(bookmark_camp).to be_invalid
  end

  it 'user_idとcamp_field_idが重複する場合無効である' do
    other_bookmark_camp = BookmarkCamp.new(
      user: bookmark_camp.user,
      camp_field: bookmark_camp.camp_field
    )

    expect(other_bookmark_camp).to be_invalid
    expect(other_bookmark_camp.errors[:user_id]).to include("はすでに存在します")
  end
end
