class Sale < ApplicationRecord
    belongs_to :user
    
    
    def self.create_from_cart_items(user, carts)
        # Extract product ids and prices from cart items
        product_ids = carts.pluck(:product_id)
        prod_price = carts.pluck(:products_price)
        subtotal = carts.plunk(:subtotal)
        # Calculate total
        total = 0
        carts.each do |carts|
          total += carts.subtotal
        end
    
        # Create new sale record
        Sale.create!(
          user: user,
          product_ids: product_ids,
          prod_price: prod_price,
          subtotal: subtotal,
          total: total
        )
      end
end
