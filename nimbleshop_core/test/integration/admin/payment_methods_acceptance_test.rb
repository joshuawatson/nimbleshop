require "test_helper"

class PaymentMethodsAcceptanceTest < ActionDispatch::IntegrationTest

  test "page should come up fine when no payment method is configured" do
    PaymentMethod.delete_all
    visit admin_path
    click_link 'Payment methods'

    assert page.has_content?("You have not setup any payment method. User wil not be able to make payment")
  end

end

class PaymentMethodsControllerTest < ActionController::TestCase

  tests Admin::PaymentMethodsController

  test "disabling a payment method" do
    payment_method = PaymentMethod.first
    assert payment_method.enabled

    put :disable, id: payment_method.permalink

    assert_response :redirect
    refute payment_method.reload.enabled
  end

  test "enabling a payment method" do
    payment_method = PaymentMethod.first.tap {|r| r.update_attributes! enabled: false }

    put :enable, id: payment_method.permalink

    assert_response :redirect
    assert payment_method.reload.enabled
  end
end
