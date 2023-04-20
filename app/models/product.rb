class Product < ApplicationRecord
    validates :price, numericality: {greater_than: 0}
    validate :valid_category

    has_one_attached :pics
    belongs_to :category

    private

  def valid_category
    errors.add(:category, "is not valid") unless Category.exists?(name: category.name)
  end
end
