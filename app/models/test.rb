class Test < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests, dependent: :destroy

  def self.titles_by_category(category)
    Test.joins("INNER JOIN 'categories' ON 'categories'.'id' = 'tests'.'category_id'").where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
