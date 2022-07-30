class Checklist < ApplicationRecord
  belongs_to :user
  has_many :checklist_items, dependent: :destroy
  has_many :items, through: :checklist_items, source: :item

  validates :name, presence: true
end
