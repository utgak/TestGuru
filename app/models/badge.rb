class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :condition, presence: true
  validates :option, presence: true
  validates :img, presence: true

  CONDITIONS = ['On the first try', 'All with category', 'All with level']

  def self.new_badges(user)
    badges = []
    Badge.all.each do |badge|
      if badge.condition == 'On the first try'
        badges << badge if self.on_the_first_try(user, badge.option)
      end

      if badge.condition == 'All with category'
        badges << badge if self.all_with_category(user, badge.option)
      end

      if badge.condition == 'All with level'
        badges << badge if self.all_with_level(user, badge.option)
      end
    end
    badges
  end

  def self.on_the_first_try(user, test_title)
    test_passages = TestPassage.joins(:test).where(user: user, tests: {title: test_title})
    test_passages.count == 1 && test_passages.first.success?
  end

  def self.all_with_category(user, category)
    user_tests = user.test_passages.joins(:test).where(tests: {category: Category.where(title: category)}).map{|tp| tp.test if tp.success?}
    category_tests = Test.tests_by_category(category)
    count = user.badges.where(condition: 'All with category').count
    count.times do
      user_tests - category_tests
    end
    user_tests.uniq.sort == category_tests.sort
  end

  def self.all_with_level(user, level)
    level = level.to_i
    user_tests = user.test_passages.joins(:test).where(tests: {level: level}).map{ |tp| tp.test if tp.success? }
    level_tests = Test.where(level: level)
    count_badges = user.badges.where(condition: 'All with level').count
    count_badges.times do
      user_tests - level_tests
    end
    user_tests.uniq.sort == level_tests
  end
end
