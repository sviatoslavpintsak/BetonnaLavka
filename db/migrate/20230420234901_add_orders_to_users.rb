class AddOrdersToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :orders, :string
  end
end
