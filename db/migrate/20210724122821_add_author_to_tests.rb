class AddAuthorToTests < ActiveRecord::Migration[6.1]
  def change
    #add_column :tests, :author, :integer
    #add_foreign_key :tests, :users, column: :author
    #add_index :tests, :author
    add_reference(:tests, :author, foreign_key: {to_table: :users})
  end
end
