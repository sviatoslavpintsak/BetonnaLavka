class Cart < ApplicationRecord
    attribute :quantity, :integer, default: 1

    belongs_to :product

    def subtotal
        puts "Product price: #{product.price}"
       subtotal = products.price * quantity
    end
end
