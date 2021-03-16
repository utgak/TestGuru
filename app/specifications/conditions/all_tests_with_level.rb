module Conditions
  class AllTestsWithLevel < AbstractConditionSpecification
    def satisfies?
      level = @option.to_i
      user_tests = @user.test_passages.joins(:test).where(tests: {level: level}).map{ |tp| tp.test if tp.success? }
      level_tests = Test.where(level: level).to_a
      count_badges = @user.badges.where(condition: 'All with level', option: level).count

      count_badges.times do #delete copies
        for i in 0..level_tests.count do
          user_tests.delete_at(user_tests.index(level_tests[i])) if user_tests.index(level_tests[i])
        end
      end

      user_tests.uniq.sort == level_tests.sort
    end
  end
end
