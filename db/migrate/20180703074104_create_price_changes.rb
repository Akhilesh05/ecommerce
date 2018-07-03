class CreatePriceChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :price_changes do |t|
      t.references :product, foreign_key: true
      t.decimal :value

      t.timestamps
    end
  end
end
