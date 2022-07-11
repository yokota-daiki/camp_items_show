class User < ApplicationRecord

  validates :user, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true

  enum role: { generl: 0, admin: 1 }
end
