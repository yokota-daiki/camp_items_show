require 'rails_helper'

RSpec.describe "BookmarkCmapFields", type: :system do
  let(:user) { create(:user) }
  let!(:camp_field) { create(:camp_field) }
  let!(:bookmark_camp_field) { create(:bookmark_camp, user:, camp_field:) }
  before { login(user) }

  describe 'キャンプ場検索ページへ' do
    context '行きたいキャンプ場リストボタンを押下' do
      it 'ボタンが選択済みに変わる' do
        visit search_camps_path
        fill_in 'keyword', with: '洪庵キャンプ場'
        click_on 'button'
        click_on '行きたいリストに追加する', match: :first
        expect(page).to have_content '追加しました'
      end
    end
  end

  describe '行きたいキャンプ場リストへ遷移' do
    it '登録したキャンプ場が表示される' do
      visit bookmark_camps_path
      expect(page).to have_content '洪庵キャンプ場'
    end

    it '登録したキャンプ場を正常に削除できる' do
      visit bookmark_camps_path
      click_on "delete-btn-#{bookmark_camp_field.id}"
      expect(page).to_not have_content camp_field.name
    end
  end
end
