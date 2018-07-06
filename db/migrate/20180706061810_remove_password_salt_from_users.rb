class RemovePasswordSaltFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password_salt, :string, limit: 36
  end
end
