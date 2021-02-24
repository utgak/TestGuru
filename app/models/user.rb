class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :login, presence: true

  def passed_tests_by_level(level)
    User.joins(:tests).where(tests: { level: level }, test_passages: { user: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
