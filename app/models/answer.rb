class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :number_of_answers

  scope :all_correct, -> { where(correct: true )}

  def number_of_answers
    unless question.answers.size.between?(1,4)
      errors.add(:count_of_answers)
    end
  end
end
