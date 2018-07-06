class AddMobileNumberToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :mobile_number, :string, limit: 8
  end
end
