require 'digest/sha1'

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  def passed_tests_by_level(level)
    User.joins(:tests).where(tests: { level: level }, test_passages: { user: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
