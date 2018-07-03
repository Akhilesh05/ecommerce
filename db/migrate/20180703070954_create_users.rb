class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50
      t.string :nic_number, limit: 14
      t.string :passport_country_number, limit: 20
      t.string :nationality, limit: 2
      t.string :mobile_number, limit: 8
      t.string :email, limit: 100
      t.string :password_digest, limit: 128
      t.string :password_salt, limit: 64

      t.timestamps
    end
    add_index :users, :nic_number, unique: true
    add_index :users, :passport_country_number, unique: true
    add_index :users, :mobile_number
    add_index :users, :email, unique: true
  end
end
