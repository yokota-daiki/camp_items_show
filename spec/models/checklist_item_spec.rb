require 'rails_helper'

RSpec.describe ChecklistItem, type: :model do
  let!(:checklist_item) { create(:checklist_item)  }
  it '全ての属性が存在する場合有効である' do
    expect(checklist_item).to be_valid
  end

  it 'checklistが存在しない場合無効である' do
    checklist_item.checklist = nil
    expect(checklist_item).to be_invalid
  end

  it 'itemが存在しない場合無効である' do
    checklist_item.item = nil
    expect(checklist_item).to be_invalid
  end

  it 'checklist_idとitem_idが重複したら無効である' do
    other_checklist_item = ChecklistItem.new(
      checklist: checklist_item.checklist,
      item: checklist_item.item
    )

    expect(other_checklist_item).to be_invalid
    expect(other_checklist_item.errors[:checklist_id]).to include("はすでに存在します")
  end
end
