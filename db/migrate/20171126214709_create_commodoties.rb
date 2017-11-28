class CreateCommodoties < ActiveRecord::Migration
  def change
    create_table :commodoties do |t|
      t.string :name
      t.string :description
      t.float :cost
      t.float :price
      t.integer :quantity
      t.integer :quantitySold

      t.timestamps null: false
    end
  end
end
