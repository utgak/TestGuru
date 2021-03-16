module Conditions
  class FirstTimeCondition < AbstractConditionSpecification
    def satisfies?
      @test_passages = @user.test_passages.joins(:test).where(user: @user, tests: {title: @option})
      @test_passages.count == 1 && @test_passages.first.success?
    end
  end
end
