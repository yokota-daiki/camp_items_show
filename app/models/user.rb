class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :posts,      dependent: :destroy
  has_many :checklists, dependent: :destroy
  has_many :myitems,    dependent: :destroy
  has_many :myitem_items, through: :myitems, source: :item

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  enum role: { generl: 0, admin: 1 }

  def item_added?(item)
    item_id = Item.find_by(name: item.name)
    myitem_items.include?(item_id)
  end

  def add_myitem(item)
    myitem_items << item
  end

  def delete_myitem(item)
    myitems.delete(item)
  end
end
