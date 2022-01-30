require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:green_book)
    @title = "The Great Book #{rand(1000)}"
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post products_url,
           params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price,
                                title: @title } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test 'should show product' do
    get product_url(@product)
    assert_response :success
    assert_select 'div.title', @product.title
    # assert_select 'p div.title', @product.title # TODO: why does this fail?
    # assert_select 'p', @product.description
    # assert_select 'p', @product.image_url
    # assert_select 'p', @product.price
  end

  test 'should get edit' do
    get edit_product_url(@product)
    assert_response :success
  end

  test 'should update product' do
    patch product_url(@product),
          params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price,
                               title: @product.title } }
    assert_redirected_to product_url(@product)
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      @product.line_items.each { |line_item| line_item.destroy }
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end

  test "can't delete product in cart" do
    assert_difference('Product.count', 0) do
      delete product_url(products(:red_book))
    end

    assert_redirected_to products_url
  end
end
