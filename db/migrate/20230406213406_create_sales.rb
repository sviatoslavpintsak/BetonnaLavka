class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.date :date
      t.integer :user_id
      t.integer :products_id
      t.string :products_categorie
      t.string :products_product
      t.integer :products_price
      t.float :quantity

      t.timestamps
    end
  end
end
