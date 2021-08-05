module QuestionsHelper
  def question_header
    "Create new #{@test.title} question" if @question.new_record?
    "Edit new #{@question.test.title} question" if @question.persisted?
  end
end
