class AddFirstNameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :first_name, :string, limit: 50
  end
end
