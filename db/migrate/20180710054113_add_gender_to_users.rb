class AddGenderToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string, limit: 1
  end
end
