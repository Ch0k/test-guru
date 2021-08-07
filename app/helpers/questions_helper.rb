module QuestionsHelper
  def question_header
    if @question.new_record? 
      "Create new #{@test.title} question" 
    else 
      "Edit new #{@question.test.title} question"
    end
  end
end
