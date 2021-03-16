class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :condition, presence: true
  validates :option, presence: true
  validates :img, presence: true
end
