class Questions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.integer :test_id, null: false
      t.timestamps
    end
  end
end
