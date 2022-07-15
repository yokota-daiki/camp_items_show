class Post < ApplicationRecord
  belongs_to :user

  validates :camp_field, presence: true
  validates :camped_date, presence: true
  validates :public, inclusion: [true, false]
end
