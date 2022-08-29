require 'rails_helper'

RSpec.describe "Checklists", type: :system do
  let!(:user) { create(:user) }
  let!(:item_1) { create(:item) }
  let!(:myitem_1) { create(:myitem, user: user, item: item_1) }
  let!(:item_2) { create(:item) }
  let!(:myitem_2) { create(:myitem, user: user, item: item_2) }
  let!(:checklist) { create(:checklist, user: user) }
  let!(:checklist_item_1) { create(:checklist_item, checklist: checklist, item: item_1) }
  let!(:checklist_item_2) { create(:checklist_item, checklist: checklist, item: item_2) }
  before { login(user) }

  describe 'チェックリスト新規作成ページへ遷移' do
    context '登録したいアイテムにチェックを入れる' do
      it '正常にチェックリストが登録でき一覧に表示される' do
        visit new_checklist_path
        fill_in 'checklist[name]', with: 'テスト'
        check '_item_id_', match: :first
        click_on '登録'
        expect(current_path).to eq checklists_path
        expect(page).to have_content 'チェックリスト"テスト"を作成しました'
        within('.table') do
          expect(page).to have_content 'テスト'
        end
      end
    end

    context 'チェックリストの名前を未入力' do
      it 'チェックリストが作成されない' do
        visit new_checklist_path
        check '_item_id_', match: :first
        click_on '登録'
        expect(page).to have_content 'チェックリストは作成できませんでした'
      end
    end

    context 'アイテムに1つもチェックをつけない' do
      it 'チェックリストが作成されない' do
        visit new_checklist_path
        fill_in 'checklist[name]', with: 'テストチェックリスト'
        click_on '登録'
        expect(page).to have_content 'チェックリストは作成できませんでした'
      end
    end
  end

  describe 'チェックリスト一覧ページへ遷移' do
    it 'チェックリストに登録されたアイテム数が正常に表示される' do
      visit checklists_path
      expect(page).to have_content checklist.name
      within('.table') do
        expect(page).to have_content checklist.items.size
      end
    end

    it '正常にチェックリストが削除できる' do
      visit checklists_path
      click_on '削除'
      expect(page.accept_confirm).to eq '削除しますか'
      expect(current_path).to eq checklists_path
      expect(page).to have_content 'チェックリストを削除しました'
      expect(page).to_not have_content checklist.name
    end
  end

  describe 'チェックリスト編集ページへ遷移' do
    it 'チェックリストの編集が正常に行える' do
      visit edit_checklist_path(checklist)
      fill_in 'checklist[name]', with: '更新'
      uncheck '_item_id_', match: :first
      click_on '更新'
      expect(current_path).to eq checklists_path
      expect(page).to have_content 'チェックリストを更新しました'
      within('.table') do
        expect(page).to have_content '更新'
        expect(page).to have_content checklist.items.size
      end
    end
  end

end
