class CombineItemsInCart < ActiveRecord::Migration[6.1]
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        next unless quantity > 1

        cart.line_items.where(product_id: product_id).delete_all
        item = cart.line_items.build(product_id: product_id)
        item.quantity = quantity
        item.save!
      end
    end
  end

  def down
    Cart.all.each do |cart|
      cart.line_items.each do |line_item|
        next unless line_item.quantity > 1

        line_item.delete
        line_item.quantity.times do
          cart.line_items.build(product_id: line_item.product_id).save!
        end
      end
    end
  end
end
