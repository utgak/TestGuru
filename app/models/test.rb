class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :user
  belongs_to :category

  def self.titles_by_category(category)
    Test.joins("INNER JOIN 'categories' ON 'categories'.'id' = 'tests'.'category_id'").where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
