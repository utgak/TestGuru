class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :validate_number_of_answers, on: :create

  scope :all_correct, -> { where(correct: true) }

  def validate_number_of_answers
    errors.add(:base) if question.answers.size > 3
  end
end
