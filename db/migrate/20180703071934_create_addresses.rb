# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :full_name, limit: 100
      t.string :line1
      t.string :line2
      t.string :zip_code, limit: 20
      t.string :city, limit: 50
      t.string :country, limit: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
