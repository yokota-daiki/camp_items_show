require 'rails_helper'

RSpec.describe CampField, type: :model do
  it '全ての属性が存在する場合有効である' do
    camp_field = CampField.new(
      name: "test_camp",
      latitude: 123,
      longitude: 123,
      address: "test_address",
      image: "test_image"
    )

    expect(camp_field).to be_valid
  end

  it 'キャンプ場名が重複する場合無効である' do
    CampField.create(
      name: "test_camp",
      latitude: 123,
      longitude: 123,
      address: "test_address",
      image: "test_image"
    )

    camp_field = CampField.new(
      name: "test_camp"
    )

    expect(camp_field).to be_invalid
    expect(camp_field.errors[:name]).to include("はすでに存在します")
  end
end
