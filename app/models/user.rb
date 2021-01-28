class User < ApplicationRecord
  def get_passed_tests_by_level(level)
    PassedTest.joins("INNER JOIN 'tests' ON 'tests'.'id' = 'passed_tests'.'test_id' INNER JOIN 'users' ON 'users'.'id' = 'passed_tests'.'user_id'")
    .where(users: {id: self.id}, tests: {level: level})
  end
end
