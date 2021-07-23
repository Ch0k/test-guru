class User < ApplicationRecord
  def test_level(level)
    id = self.id
    Test.joins('JOIN user_tests ON user_tests.test_id = tests.id').where('tests.level like ?', level).where('user_tests.user_id like ?', id).pluck(:title)
  end
end
