module UserTestsHelper
  def passed? 
    if (@user_test.correct_questions_multiply_by_100)/@user_test.test_questions_count > 85
      true
    end
  end
  def success_rate
    (@user_test.correct_questions_multiply_by_100)/@user_test.test_questions_count
  end
end
