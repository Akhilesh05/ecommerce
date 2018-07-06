class RemoveFullNameFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :full_name, :string, limit: 100
  end
end
