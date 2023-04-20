class Cart < ApplicationRecord
    attribute :quantity, :integer, default: 1
    attribute :order_session, :integer, default: 1 

    
    has_many :user
end
