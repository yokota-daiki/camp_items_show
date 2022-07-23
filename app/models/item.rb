class Item < ApplicationRecord
  has_many :myitems, dependent: :destroy
end
