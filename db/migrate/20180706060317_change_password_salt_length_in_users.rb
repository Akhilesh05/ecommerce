class ChangePasswordSaltLengthInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :password_salt, :string, limit: 36
  end
end
