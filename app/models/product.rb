class Product < ApplicationRecord
    validates :price, numericality: {greater_than: 0}
   

    has_one_attached :pics
    #belongs_to :category


end
