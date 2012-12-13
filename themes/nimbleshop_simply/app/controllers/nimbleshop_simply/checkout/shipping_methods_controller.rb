module NimbleshopSimply
  class Checkout::ShippingMethodsController < SimplyController

    before_filter :verify_current_order, :load_shipping_methods, :set_show_shipping_billing_address, :set_contact_email

    def new
      render
    end

    def update
      if params[:order].present? && params[:order].keys.include?('shipping_method_id')
        current_order.update_attributes(shipping_method_id: params[:order][:shipping_method_id])
        redirect_to  new_checkout_payment_path
      else
        current_order.errors.add(:base, 'Please select a shipping method')
        render action: :new
      end
    end

    def load_shipping_methods
      @shipping_methods = Array.wrap(current_order.available_shipping_methods)
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
