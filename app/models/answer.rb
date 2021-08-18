class Answer < ApplicationRecord
  belongs_to :question
  validate :validate_answer_count, on: :create
  scope :correct, -> { where(correct: true) }

  private

  def validate_answer_count
    @quesiton = self.question
    errors.add(:answer_count) if @quesiton.answers.count > 4
  end
end
