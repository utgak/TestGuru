class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :time_limit_in_minutes, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :title, presence: true
  validates :level, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, ->(category) { joins(:category).where(categories: { title: category }) }

  def self.titles_by_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
