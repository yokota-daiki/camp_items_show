require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:general) { create(:user, :general) }
  let(:admin) { create(:user, :admin) }
  let!(:post) { create(:post, user: general) }
  let!(:public_post) { create(:post, :public, user: general) }
  let!(:private_post) { create(:post, :private, user: general) }
  
  describe '一般ユーザーでログイン' do
    before { login(general) }
    context 'フォームすべて入力' do
      before do
        visit new_post_path
        fill_in '訪れたキャンプ場', with: 'テスト'
        fill_in '日付', with: '002022-08-01'
        fill_in 'コメント', with: 'テスト'
      end
      it '画像を選択し新規投稿が正常にできる' do
        attach_file('post[images][]', "spec/fixtures/images/test_image.JPG")
        choose 'post_public_true'
        click_button '投稿'
        expect(current_path).to eq posts_path
        expect(page).to have_content '投稿しました'
        expect(page).to have_content general.posts[0].camp_field
        expect(page).to have_content general.posts[0].camped_date
        expect(page).to have_content general.posts[0].comment
        expect(page).to have_selector("img[src$='test_image.JPG']")
      end

      it '画像選択しない場合デフォルト画像になっている' do
        choose 'post_public_true'
        click_button '投稿'
        expect(current_path).to eq posts_path
        expect(page).to have_content '投稿しました'
        expect(page).to have_selector("img[src$='default_campimage-feb561964ad9a2d1ec9a7d742051579ea2bfdc8222b1e48c41ae5d41c841bc13.JPG']")
      end 
    end

    context 'フォームが未入力' do
      it '投稿ができない' do
        visit new_post_path
        click_button '投稿'
        expect(page).to have_content '投稿に失敗しました'
        expect(page).to have_content '訪れたキャンプ場を入力してください'
        expect(page).to have_content '日付を入力してください'
      end
    end

    context '投稿を編集' do
      it '正常に編集ができる' do
        visit edit_post_path(post)
        fill_in '訪れたキャンプ場', with: 'テストキャンプ場'
        click_button '投稿'
        expect(current_path).to eq posts_path
        expect(page).to have_content 'テストキャンプ場'
        expect(page).to have_content '編集しました'
      end
    end

    it '投稿が削除できる' do
      visit posts_path
      first('.fa-trash-can').click
      expect(page.accept_confirm).to eq '削除しますか'
      expect(page).to have_content '削除しました'
      expect(page).to_not have_content post
    end

    context '投稿を公開するに設定' do
      it 'みんなのキャンプに投稿が表示される' do
        visit root_path
        find('#open-btn').click
        expect(page).to have_content public_post.camp_field
      end
    end

    context '投稿を非公開に設定' do
      it 'みんなのキャンプに表示されない' do
        visit root_path
        find('#open-btn').click
        expect(page).to_not have_content private_post.camp_field
      end
    end
  end

  describe '管理者でログイン' do
    before { login(admin) }
    it 'すべての投稿が表示される' do
      visit admin_posts_path
      expect(page).to have_content post.camp_field
      expect(page).to have_content public_post.camp_field
      expect(page).to have_content private_post.camp_field
    end
  end
end
