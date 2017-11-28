class CreateSalexcomms < ActiveRecord::Migration
  def change
    create_table :salexcomms do |t|
      t.integer :quanxcomm
      t.float :subtotal

      t.timestamps null: false
    end
  end
end
