module Conditions
  class AllTestsWithCategory < AbstractConditionSpecification
    def satisfies?
      user_tests = @user.test_passages.map{|tp| tp.test if tp.success? && tp.test.category.title == @option}
      category_tests = Test.tests_by_category(@option).to_a
      count_badges = @user.badges.where(condition: 'All with category', option: @option).count

      count_badges.times do #delete copies
        for i in 0..category_tests.count do
          user_tests.delete_at(user_tests.index(category_tests[i])) if user_tests.index(category_tests[i])
        end
      end

      user_tests.uniq.sort == category_tests.sort
    end
  end
end
