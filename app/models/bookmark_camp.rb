class BookmarkCamp < ApplicationRecord
  belongs_to :user
  belongs_to :camp_field

  validates :user_id, uniqueness: { scope: :camp_field_id }
end
