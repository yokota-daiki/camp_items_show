require 'rails_helper'

RSpec.describe 'Items', type: :system do
  let(:user) { create(:user) }
  let!(:tent_item) { create(:item, :tent) }
  let!(:bedding_item) { create(:item, :bedding) }
  let!(:light_item) { create(:item, :light) }
  let!(:myitem_tent) { create(:myitem, user:, item: tent_item) }
  let!(:myitem_bed) { create(:myitem, user:, item: bedding_item) }
  let!(:myitem_light) { create(:myitem, user:, item: light_item) }
  before { login(user) }

  describe 'アイテム検索ページへ遷移' do
    context 'アイテム検索フォームにランタンと入力' do
      it '登録ボタンを押すとマイアイテム一覧に表示される' do
        visit search_items_path
        fill_in 'keyword', with: 'ランタン'
        find('.fa-magnifying-glass').click
        expect(page).to have_content 'ランタン'
        within('.content') do
          click_on '登録', match: :first
        end
        expect(page).to have_content 'アイテムを登録しました'
        within('.item-contents') do
          expect(page).to have_content 'ライト'
        end
      end
    end
  end

  describe 'アイテム手動登録ページへ遷移' do
    context 'フォームを入力' do
      it 'アイテムの登録ができる' do
        visit new_item_path
        fill_in 'アイテム名', with: 'テストアイテム'
        fill_in 'メーカー', with: 'テストメーカー'
        select 'チェア・テーブル', from: 'カテゴリー'
        click_button '登録'
        expect(current_path).to eq items_path
        expect(page).to have_content 'アイテムを登録しました'
        within('.item-contents') do
          expect(page).to have_content 'テストアイテム'
          expect(page).to have_content 'チェア・テーブル'
        end
      end
    end

    context 'フォーム未入力' do
      it 'アイテム登録ができない' do
        visit new_item_path
        click_button '登録'
        expect(page).to have_content 'アイテムが登録できませんでした'
      end
    end
  end

  describe 'アイテム一覧ページへ遷移' do
    it 'アイテムのソートができる' do
      visit items_path
      select 'テント・タープ'
      click_on 'ソート'
      within('.item-contents') do
        expect(page).to have_content 'テント・タープ'
        expect(page).to_not have_content 'ライト・ランタン'
      end
    end

    it 'アイテムの削除ができる' do
      visit items_path
      click_on '削除', match: :first
      expect(page.accept_confirm).to eq '削除しますか'
      expect(current_path).to eq items_path
      expect(page).to have_content 'アイテムを削除しました'
      within('.item-contents') do
        expect(page).to_not have_content 'ライト・ランタン'
      end
    end
  end
end
