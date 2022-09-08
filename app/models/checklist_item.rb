class ChecklistItem < ApplicationRecord
  belongs_to :checklist
  belongs_to :item

  validates :checklist_id, uniqueness: { scope: [:item_id] }
end
