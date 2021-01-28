class Test < ApplicationRecord

  def self.get_titles_by_category(category)
    Test.joins("INNER JOIN 'categories' ON 'categories'.'id' = 'tests'.'category_id'").where(categories: {title: category}).order(:title).pluck(:title)
  end
end
