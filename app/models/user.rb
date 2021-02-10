class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests

  validates :login, presence: true

  def passed_tests_by_level(level)
    User.joins(:tests).where(tests: {level: level}, passed_tests: {user: id})
  end
end
