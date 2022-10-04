require 'rails_helper'

RSpec.describe 'SearchCamps', type: :system do
  describe 'キャンプ場検索ページへ遷移' do
    context 'キャンプ場検索' do
      it '正常に検索できる' do
        visit search_camps_path
        fill_in 'keyword', with: '北海道'
        find('.fa-magnifying-glass').click
        within('.table') do
          expect(page).to have_content 'キャンプ場'
        end
      end
    end
  end
end
