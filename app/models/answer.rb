class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true

  scope :all_correct, -> { where(correct: true )}
end
