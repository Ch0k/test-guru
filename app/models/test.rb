class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests
  has_many :questions, dependent: :destroy
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, uniqueness: { scope: :level,
  message: "should happen once per level" }
  scope :easy, -> {where(level: 0..1)}
  scope :normal, -> {where(level: 2..4)}
  scope :hard, -> {where(level: 5..Float::INFINITY)}
  scope :list_category,-> (category) {joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ? ', category)}

  def self.list_category_order_title(category)
    Test.list_category(category).order(title: :desc).pluck(:title)
  end

end
