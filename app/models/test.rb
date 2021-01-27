class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :question

  def self.get_titles_by_category(category)
    Test.joins(:category).where(categories: {title: category}).order(:title).pluck(:title)
  end
end
