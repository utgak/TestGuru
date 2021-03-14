class BadgeService
  def initialize(user)
    @user = user
  end

  def new_badges
    badge_ids = []
    Badge.all.each do |badge|
      case badge.condition
      when 'On the first try'
        badge_ids << badge.id if on_the_first_try(badge.option)
      when 'All with category'
        badge_ids << badge.id if all_with_category(badge.option)
      when 'All with level'
        badge_ids << badge.id if all_with_level(badge.option)
      end
    end
    badge_ids
  end

  private

  def on_the_first_try(test_title)
    test_passages = @user.test_passages.joins(:test).where(user: @user, tests: {title: test_title})
    test_passages.count == 1 && test_passages.first.success?
  end

  def all_with_category(category)
    user_tests = @user.test_passages.joins(:test).where(tests: {category: Category.where(title: category)}).map{|tp| tp.test if tp.success?}
    category_tests = Test.tests_by_category(category)
    count = @user.badges.where(condition: 'All with category').count
    count.times do
      user_tests - category_tests
    end
    user_tests.uniq.sort == category_tests.sort
  end

  def all_with_level(level)
    level = level.to_i
    user_tests = @user.test_passages.joins(:test).where(tests: {level: level}).map{ |tp| tp.test if tp.success? }
    level_tests = Test.where(level: level)
    count_badges = @user.badges.where(condition: 'All with level').count
    count_badges.times do
      user_tests - level_tests
    end
    user_tests.uniq.sort == level_tests.sort
  end
end
