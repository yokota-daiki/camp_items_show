require 'rails_helper'

RSpec.describe User, type: :model do
  it '全ての属性が存在していれば有効である' do
    user = User.new(
      name: "test_name",
      email: "test_eamil@example.com",
      password: "test_password",
      password_confirmation: "test_password"
    )

    expect(user).to be_valid
  end

  it 'emailが存在していないと無効である' do
    user = User.new(
      name: nil,
      email: nil,
      password: "test_password",
      password_confirmation: "test_password"
    )

    user.valid?
    expect(user.errors.full_messages).to include("メールアドレスを入力してください")
  end

  it 'nameが存在していないと無効である' do
    user = User.new(
      name: nil,
      email: "test_eamil@example.com",
      password: "test_password",
      password_confirmation: "test_password"
    )

    user.valid?
    expect(user.errors.full_messages).to include("名前を入力してください")
  end

  it 'passwordが存在していないと無効である' do
    user = User.new(
      name: "test_name",
      email: "test_eamil@example.com",
      password: nil,
      password_confirmation: nil
    )

    user.valid?
    expect(user.errors.full_messages).to include("パスワードは8文字以上で入力してください", "パスワード確認を入力してください")
  end

  fit 'emailが既に存在している場合無効である' do
    User.create(
      name: "test_name1",
      email: "test_email@example.com",
      password: "password",
      password_confirmation: "password"
    )

    user = User.new(
      name: "test_name2",
      email: "test_email@example.com",
      password: "password",
      password_confirmation: "password"
    )

    user.valid?
    expect(user.errors.full_messages).to include("メールアドレスはすでに存在します")
  end
end
