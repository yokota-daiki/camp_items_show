require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user, email: 'test-1@example.com') }
  describe 'ユーザー作成ページへ遷移' do
    context 'すべてのフォームを入力' do
      it 'ユーザーの作成が成功する' do
        visit new_user_path
        fill_in "名前", with: "test"
        fill_in "メールアドレス", with: "test@example.com"
        fill_in "パスワード", with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button "登録"
        expect(current_path).to eq root_path
        expect(page).to have_content 'ユーザー登録が完了しました'
      end
    end

    context 'フォームを未入力' do
      it 'ユーザーの作成に失敗する' do
        visit new_user_path
        fill_in "名前", with: ""
        fill_in "メールアドレス", with: ""
        fill_in "パスワード", with: ''
        fill_in 'パスワード確認', with: ''
        click_button "登録"
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'パスワードは8文字以上で入力してください'
        expect(page).to have_content 'パスワード確認を入力してください'
        expect(page).to have_content '名前を入力してください'
        expect(page).to have_content 'メールアドレスを入力してください'
      end
    end

    context '既に登録してあるメールアドレスを入力' do
      it 'ユーザーの作成に失敗する' do
        visit new_user_path
        fill_in "名前", with: "test"
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button "登録"
        expect(page).to have_content 'ユーザー登録に失敗しました'
        expect(page).to have_content 'メールアドレスはすでに存在します'
      end
    end
  end
end
