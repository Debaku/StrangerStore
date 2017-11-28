class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.date :saleDate
      t.string :ammountSale
      t.string :float

      t.timestamps null: false
    end
  end
end
