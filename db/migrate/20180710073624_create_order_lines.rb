class CreateOrderLines < ActiveRecord::Migration[5.2]
  def change
    create_table :order_lines do |t| # rubocop:disable Rails/CreateTableWithTimestamps
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price, precision: 6, scale: 2
    end
  end
end
