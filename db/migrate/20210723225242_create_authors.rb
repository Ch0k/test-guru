class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.references :test_id, null: false, foreign_key: true
      t.references :user_id, null: false, foreign_key: true
    end
  end
end
