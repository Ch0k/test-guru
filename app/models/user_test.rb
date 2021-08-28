class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :before_validation_set_first_question, on: :create
  before_validation :after_update_set_next_question, on: :update
  
  GOOD_RESULT_PROCENT = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def passed? 
    self.success_rate >= GOOD_RESULT_PROCENT
  end

  def success_rate
    (self.correct_questions_multiply_by_100)/self.test_questions_count
  end

  def correct_questions_multiply_by_100 
    self.correct_questions*100
  end

  def after_update_set_next_question
    self.current_question = next_question
  end

  def complited?
    current_question.nil?  
  end
  

  def test_questions_count
    test.questions.count
  end

  def question_number
    test.questions.index{|x| x.body == self.current_question.body } + 1
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end


  def correct_answer?(answer_ids) 
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  
end
