require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  test "should fail to save without file" do
    product = create :product

    assert_no_difference 'Picture.count' do
      product.pictures.create
    end
  end

  test "attaching picture to a product" do
    product = create :product

    assert_difference 'product.pictures(true).size' do
      product.attach_picture('cookware.jpg', Rails.root.join('test', 'support', 'images', 'cookware.jpg'))
    end

    assert_no_difference 'Picture.count' do
      product.destroy
    end
  end
end

