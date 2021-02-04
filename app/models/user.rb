class User < ApplicationRecord
  def passed_tests_by_level(level)
    Test.joins("INNER JOIN 'passed_tests' ON 'passed_tests'.test_id = 'tests'.id").where(tests: {level: level}, passed_tests: {user_id: self.id})
  end
end
