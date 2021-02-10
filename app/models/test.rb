class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests

  validate :uniqueness_of_the_test
  validates :title, presence: true
  validates :level, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0}

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, ->(category) { joins(:category).where(categories: {title: category})}

  def self.titles_by_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end

  def uniqueness_of_the_test
    if Test.where(title: title).size > 1 and Test.where(level: level).size > 1
      errors.add(:uniqueness_error, 'a tests with the same name and level already exist')
    end
  end
end
