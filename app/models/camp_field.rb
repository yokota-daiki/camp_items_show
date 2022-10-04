class CampField < ApplicationRecord
  has_many :bookmark_camps, dependent: :destroy

  validates :name, uniqueness: true
end
