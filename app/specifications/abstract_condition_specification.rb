class AbstractConditionSpecification
  def initialize(option, test_passage)
    @option = option
    @test_passage = test_passage
    @user = @test_passage.user
  end

  def satisfies?
    raise "#{__method__} undefined for #{self.class}"
  end
end