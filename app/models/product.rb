class Product < ApplicationRecord
  has_many :user_favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_one_attached :image
  accepts_nested_attributes_for :product_categories, allow_destroy: true

  validates :title, :price, :quantity_available, :price, :image, presence: true
  validates :quantity_available, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :title, length: { maximum: 50 }

  def self.ransackable_attributes(auth_object = nil)
    ["description", "title"]
  end
end
