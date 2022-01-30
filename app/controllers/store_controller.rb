class StoreController < ApplicationController
  include IndexCounter
  def index
    increment_index_counter
    @products = Product.order(:title)
  end
end
