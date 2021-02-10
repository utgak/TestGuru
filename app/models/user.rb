class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests

  def passed_tests_by_level(level)
    Test.joins(:passed_tests).where(tests: {level: level}, passed_tests: {user_id: self.id})
  end
end
