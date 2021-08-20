class AddQuestionToUserTests < ActiveRecord::Migration[6.1]
  def change
    add_reference(:user_tests, :current_question, foreign_key: {to_table: :questions})
    add_column :user_tests, :correct_questions, :integer, default: 0
    add_timestamps(:user_tests, null: true)
  end
end
