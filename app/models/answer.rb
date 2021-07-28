class Answer < ApplicationRecord
  belongs_to :question
  validate :validate_answer_count
  scope :correct, -> { where(correct: true) }

  private

  def validate_answer_count
    errors.add(:answer_count) if self.question.answers.count > 4
  end
end
