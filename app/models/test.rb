class Test < ApplicationRecord
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category
  has_many :questions
  belongs_to :user  

  def self.list_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ? ', category).order(title: :desc).pluck(:title)
  end
end
