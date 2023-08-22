class Category < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true
end
