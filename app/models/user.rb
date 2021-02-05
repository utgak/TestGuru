class User < ApplicationRecord
  belongs_to :test
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  def passed_tests_by_level(level)
    Test.joins("INNER JOIN 'passed_tests' ON 'passed_tests'.test_id = 'tests'.id").where(tests: {level: level}, passed_tests: {user_id: self.id})
  end
end
