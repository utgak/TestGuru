class User < ApplicationRecord
  has_many :test
  def get_passed_tests_by_level(level)
    arr = []
    PassedTest.where(test_id: Test.where(level: level), user_id: self.id).pluck(:test_id).each do | id |
      arr << Test.find(id).title
    end
    arr
  end
end
