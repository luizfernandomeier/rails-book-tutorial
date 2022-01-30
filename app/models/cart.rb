class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy # if cart is destroyed, rails will aldo destroy the line items

  def add_product(product)
    # find_by() method is a streamlined version of the where() method
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    line_items.sum { |item| item.total_price }
  end
end
