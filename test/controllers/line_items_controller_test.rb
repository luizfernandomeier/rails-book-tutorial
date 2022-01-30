require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test 'should get index' do
    get line_items_url
    assert_response :success
  end

  test 'should get new' do
    get new_line_item_url
    assert_response :success
  end

  test 'should create line_item' do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id }
    end

    cart = Cart.find(a = session[:cart_id])
    assert_redirected_to cart

    follow_redirect!

    assert_select 'h2', 'Your Pragmatic Cart'
    assert_select 'td', 'Programming Ruby 1.9'
  end

  test 'should show line_item' do
    get line_item_url(@line_item)
    assert_response :success
  end

  test 'should get edit' do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test 'should update line_item' do
    patch line_item_url(@line_item),
          params: { line_item: { product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test 'should destroy line_item' do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end

  test 'should create 1 line item with quantity of 2' do
    assert_difference('LineItem.count', 1) do
      post line_items_url, params: { product_id: products(:ruby).id }
      post line_items_url, params: { product_id: products(:ruby).id }
    end
    LineItem.last(1).each do |line_item|
      assert_equal 2, line_item.quantity
    end
  end

  test 'should create 2 line items with quantity of 1' do
    assert_difference('LineItem.count', 2) do
      post line_items_url, params: { product_id: products(:ruby).id }
      post line_items_url, params: { product_id: products(:green_book).id }
    end
    LineItem.last(2).each do |line_item|
      assert_equal 1, line_item.quantity
    end
  end
end
