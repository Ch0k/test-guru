class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :author_tests, class_name: "Test", foreign_key: "author_id"

  def test_level(level)
    Test.joins('JOIN user_tests ON user_tests.test_id = tests.id').where('tests.level = ?', level).where('user_tests.user_id = ?', self.id).pluck(:title)
  end
end
