class Item < ApplicationRecord
  has_many :myitems, dependent: :destroy
  has_many :myitem_users, through: :myitems, source: :user
  has_many :checklist_items, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :url }

  has_one_attached :image
end
