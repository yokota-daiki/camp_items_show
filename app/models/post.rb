class Post < ApplicationRecord
  belongs_to :user

  validates :camp_field, presence: true
  validates :camped_date, presence: true
  validates :public, inclusion: [true, false]

  has_many_attached :images

  def comment_over?
    self.comment.length > 60
  end
end
