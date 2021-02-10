class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validate :number_of_answers
  validates :title, presence: true


  def number_of_answers
    unless self.answers.size.between?(1,4)
      errors.add(:count_of_answers)
    end
  end
end
