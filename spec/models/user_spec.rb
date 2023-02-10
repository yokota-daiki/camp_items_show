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

  it 'emailが既に存在している場合無効である' do
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

  it 'passwordが8文字未満の場合無効である' do
    user = User.new(
      name: "test_name",
      email: "test@example.com",
      password: "1" * 7,
      password_confirmation: "1" * 7
    )

    expect(user).to be_invalid
    expect(user.errors[:password]).to include("は8文字以上で入力してください")
  end

  it 'nameが256文字以上の場合無効である' do
    user = User.new(
      name: "1" * 256,
      email: "test@example.com",
      password: "password",
      password_confirmation: "password"
    )

    expect(user).to be_invalid
    expect(user.errors[:name]).to include("は255文字以内で入力してください")
  end
end
