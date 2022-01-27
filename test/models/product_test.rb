require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products # this is added automatically, but I have put it here for clarity

  test 'product attributes must not be empty' do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  def new_product
    Product.new(
      title: 'My Book Title',
      description: 'yyy',
      price: 1,
      image_url: 'rails.png'
    )
  end

  test 'product price must be positive' do
    product = new_product

    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 1
    assert product.valid?
    assert_empty product.errors[:price]
  end

  test 'image url' do
    ok = %w[7apps.jpg ridocker.jpg]
    bad = %w[something.else 7apps.jpg.bmp]

    ok.each do |name|
      product = new_product
      product.image_url = name
      assert product.valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      product = new_product
      product.image_url = name
      assert product.invalid?, "#{name} shouldn't be valid"
    end
  end

  test 'product is not valid without a unique title' do
    product = new_product
    product.title = products(:ruby).title
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end
end
