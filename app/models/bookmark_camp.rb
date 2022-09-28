class BookmarkCamp < ApplicationRecord
  belongs_to :user
  belongs_to :camp_field
end
