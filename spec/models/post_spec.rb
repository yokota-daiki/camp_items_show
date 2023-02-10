require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) }
  it '全ての属性が存在していたら有効である' do
    post = Post.new(
      user: user,
      camp_field: "test_camp_field",
      comment: "test_comment",
      camped_date: "002022-07-15"
    )

    expect(post).to be_valid
  end

  it 'キャンプ場とキャンプ日時が存在していないと無効である' do
    post = Post.new(
      user: user,
      camp_field: nil,
      comment: "test_comment",
      camped_date: nil
    )

    post.valid?
    expect(post.errors.full_messages).to include("訪れたキャンプ場を入力してください", "日付を入力してください")
  end

  it 'userが存在していないと無効である' do
    post = Post.new(
      user: nil,
      camp_field: "test_camp_field",
      comment: "test_comment",
      camped_date: "002022-07-15"
    )

    expect(post).to be_invalid
  end
end
