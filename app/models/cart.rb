class Cart < ApplicationRecord
  has_many: line_items, dependent: :destroy # if cart is destroyed, rails will aldo destroy the line items
end
