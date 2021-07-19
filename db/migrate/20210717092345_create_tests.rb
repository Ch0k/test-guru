class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :category_id, null: false
      t.integer :level, null: false, default: 3
      t.timestamps
    end
  end
end
