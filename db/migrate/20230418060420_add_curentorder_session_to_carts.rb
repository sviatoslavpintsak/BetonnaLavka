class AddCurentorderSessionToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :order_session, :integer
  end
end
