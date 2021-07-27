class Question < ApplicationRecord
  validates :body, presence: true
  belongs_to :test
  has_many :answers
  validate :validate_answer_count

  private

  def validate_answer_count
    errors.add(:answer_count) if self.answers.count == 1..4
  end
end
