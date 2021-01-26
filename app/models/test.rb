class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :question

  def self.get_titles_by_category(category)
    arr = []
    c_id = Category.where(title: category).order('title DESC').pluck(:id)
    c_id.each do |id|
      arr << Test.where(category_id: id).pluck(:title)
    end
    arr.flatten
  end
end
