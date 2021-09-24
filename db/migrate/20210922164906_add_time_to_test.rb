class AddTimeToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer, :integer, null: true
  end
end
