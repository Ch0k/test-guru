class AddCompitedToUserTests < ActiveRecord::Migration[6.1]
  def change
    add_column :user_tests, :complited, :boolean, default: false
  end
end
