require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let(:general) { create(:user, :general) }
  let(:admin) { create(:user, :admin) }

  describe '未ログイン' do
    context 'フォームを正常に入力' do
      it 'ログインできる' do
        visit login_path
        fill_in 'メールアドレス', with: general.email
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button 'ログイン'
        expect(current_path).to eq root_path
        expect(page).to have_content 'ログインしました'
      end
    end

    context 'フォーム未入力' do
      it 'ログインができない' do
        visit login_path
        fill_in 'メールアドレス', with: ""
        fill_in 'パスワード', with: ''
        fill_in 'パスワード確認', with: ''
        click_button 'ログイン'
        expect(current_path).to eq login_path
        expect(page).to have_content 'ログインに失敗しました'
      end
    end

    context 'キャンプ場検索ページへ遷移' do
      it '正常に遷移できる' do
        visit search_camps_path
        expect(current_path).to eq search_camps_path
      end
    end

    context 'キャンプ場検索ページ以外へ遷移' do
      it 'ログインページへ遷移される' do
        visit items_path
        expect(current_path).to eq login_path
        expect(page).to have_content 'ログインしてください'
        visit checklists_path
        expect(current_path).to eq login_path
        expect(page).to have_content 'ログインしてください'
        visit posts_path
        expect(current_path).to eq login_path
        expect(page).to have_content 'ログインしてください'
      end
    end
  end

  describe '一般ユーザーでログイン後' do
    before { login(general) }
    context 'ログアウトを実行' do
      it 'ログアウトが完了する' do
        click_link 'ログアウト'
        expect(page.accept_confirm).to eq 'ログアウトしますか'
        expect(current_path).to eq root_path
        expect(page).to have_content 'ログアウトしました'
      end
    end

    context '管理者ページへ遷移' do
      it 'topページへ遷移される' do
        visit admin_users_path
        expect(current_path).to eq root_path
        expect(page).to have_content '権限がありません'
        visit admin_items_path
        expect(current_path).to eq root_path
        expect(page).to have_content '権限がありません'
        visit admin_posts_path
        expect(current_path).to eq root_path
        expect(page).to have_content '権限がありません'
      end
    end
  end

  describe '管理者でログイン' do
    before { login(admin) }
    context '管理者ページへ遷移' do
      it '正常に遷移される' do
        visit admin_users_path
        expect(current_path).to eq admin_users_path
        visit admin_items_path
        expect(current_path).to eq admin_items_path
        visit admin_posts_path
        expect(current_path).to eq admin_posts_path
      end
    end
  end
end
