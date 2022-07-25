class Item < ApplicationRecord
  has_many :myitems, dependent: :destroy
  has_many :myitem_users, through: :myitems, source: :user
end
