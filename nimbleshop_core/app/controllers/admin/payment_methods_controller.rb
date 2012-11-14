class Admin::PaymentMethodsController < AdminController

  before_filter :load_payment_methods

  def index
    @disabled_payment_methods = PaymentMethod.disabled.ascending

    respond_to do |format|
      format.html do

        if PaymentMethod.count == 0
          flash.now[:error] = 'You have not setup any payment method. User wil not be able to make payment'
        end
      end
    end
  end

  def enable
    @payment_method.update_attributes! enabled: true
    respond_to do |format|
      format.html { redirect_to  action: :index, notice: "Payment method #{@payment_method.name} has been enabled" }
    end
  end

  def disable
    @payment_method.update_attributes! enabled: false
    respond_to do |format|
      format.html { redirect_to  action: :index, notic: "Payment method #{@payment_method.name} has been disabled" }
    end
  end

  private

  def load_payment_methods
    @payment_methods = PaymentMethod.enabled.ascending
  end

  def load_payment_method
    @payment_method = PaymentMethod.find_by_permalink! params[:id]
  end

end
