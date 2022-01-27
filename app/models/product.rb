class Product < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: { with: /[.]((gif)|(jpe?g)|(png))\z/i }
end
