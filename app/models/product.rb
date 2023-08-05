class Product < ApplicationRecord
  has_many :user_favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :product_categories, dependent: :destroy
end
