class BadgeService

  CONDITIONS = {
    'On the first try' => Conditions::FirstTimeCondition,
    'All with category' => Conditions::AllTestsWithCategory,
    'All with level' => Conditions::AllTestsWithLevel
  }

  def initialize(test_passage)
    @test_passage = test_passage
  end


  def new_badges
    Badge.where(option: @test_passage.test.title).or(Badge.where(option: @test_passage.test.level)).find_each do |badge|
      condition = CONDITIONS[badge.condition].new(badge.option, @test_passage)
      add_badge(badge) if condition.satisfies?
    end
  end

  private

  def add_badge(badge)
    @test_passage.user.badges << badge
  end
end
