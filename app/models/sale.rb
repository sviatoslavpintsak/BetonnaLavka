class Sale < ApplicationRecord
    belongs_to :user
    belongs_to :product
    belongs_to :cart
end