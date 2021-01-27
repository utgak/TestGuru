class User < ApplicationRecord
  has_many :test
  def get_passed_tests_by_level(level)
    PassedTest.joins(:test, :user).where(users: {id: self.id}, tests: {level: level})
  end
end
