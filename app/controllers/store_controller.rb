class StoreController < ApplicationController
  include IndexCounter
  include CurrentCart
  before_action :set_cart
  def index
    increment_index_counter
    @products = Product.order(:title)
  end
end
