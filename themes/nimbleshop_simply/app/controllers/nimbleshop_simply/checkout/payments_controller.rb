module NimbleshopSimply
  class Checkout::PaymentsController < SimplyController

    before_filter :verify_current_order, :set_show_shipping_billing_address, :set_contact_email

    force_ssl if: :ssl_configured?

    def new
      @page_sub_title = 'All payments are secure and encrypted. We never store your credit card information.'
      @creditcard = Creditcard.new
      @show_shipping_and_tax_info = true unless current_order.has_digital_goods?
      @payment_methods = PaymentMethod.enabled.ascending
      render text: 'No payment method has been setup. Please setup atleast one payment method.' if PaymentMethod.count == 0
    end

    def ssl_configured?
      PaymentMethod.all.find { |i| i.use_ssl? }
    end

    private

    def set_show_shipping_billing_address
      @show_shipping_billing_address = true
    end

    def set_contact_email
      @show_contact_email = true
    end

  end
end
