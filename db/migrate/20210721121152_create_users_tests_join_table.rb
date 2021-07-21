class CreateUsersTestsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tests, id: false do |t|
      t.belongs_to :user
      t.belongs_to :test
    end
  end
end
