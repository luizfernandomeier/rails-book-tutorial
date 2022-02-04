class StoreController < ApplicationController
  include IndexCounter
  include CurrentCart
  skip_before_action :authorize
  before_action :set_cart
  def index
    increment_index_counter
    @products = Product.order(:title)
  end
end
