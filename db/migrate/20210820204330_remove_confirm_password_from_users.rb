class RemoveConfirmPasswordFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :confirm_password, :string
  end
end
