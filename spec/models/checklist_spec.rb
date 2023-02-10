require 'rails_helper'

RSpec.describe Checklist, type: :model do
  let!(:user) { create(:user) }
  it '全ての属性が存在していたら有効である' do
    checklist = Checklist.new(
      name: "test_checklist",
      user: user
    )

    expect(checklist).to be_valid
  end

  it 'チェックリスト名が存在していないと無効である' do
    checklist = Checklist.new(
      name: nil,
      user: user
    )

    checklist.valid?
    expect(checklist.errors.full_messages).to include("チェックリスト名を入力してください")
  end

  it 'userが存在していないと無効である' do
    checklist = Checklist.new(
      name: "test_checklist",
      user: nil
    )

    expect(checklist).to be_invalid
  end
end
