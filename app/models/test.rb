class Test < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :level,
  message: "should happen once per level" }
  
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  scope :easy, -> {where(level: 0..1)}
  scope :normal, -> {where(level: 2..4)}
  scope :hard, -> {where(level: 5..Float::INFINITY)}
  validates :level, numericality: { only_integer: true }
  validate :validate_level_not_positive
  scope :list_category,-> (category) {joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ? ', category).order(title: :desc).pluck(:title)}
  
  private

  def validate_level_not_positive
    errors.add(:level) if level.to_i < 0
  end
  #def self.list_category(category)
   # Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = ? ', category).order(title: :desc).pluck(:title)
  #end
end
