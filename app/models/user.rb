class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests
  has_many :author_tests, class_name: "Test", foreign_key: "author_id"
  validates :email, presence: true
  
  def test_level(level)
    tests.where(level: level).where('user_tests.user_id = ?', self.id).pluck(:title)
  end

  def user_test(test)
    user_tests.order(id: :desc).find_by(test_id: test.id)
  end
  
end
