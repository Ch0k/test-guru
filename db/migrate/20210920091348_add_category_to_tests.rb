class AddCategoryToTests < ActiveRecord::Migration[6.1]
  def change
    add_reference(:tests, :category, foreign_key: true, null: false)
  end
end
