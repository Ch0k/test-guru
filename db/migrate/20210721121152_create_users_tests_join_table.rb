class CreateUsersTestsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tests do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :test, foreign_key: true
    end
  end
end
