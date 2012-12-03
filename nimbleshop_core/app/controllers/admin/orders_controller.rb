class Admin::OrdersController < AdminController

  before_filter :load_order!, except: :index

  respond_to :html

  def capture_payment
    respond_to do |format|
      format.html do
        @order.payment_method.kapture! @order
        redirect_to admin_order_path(@order), notice: "Amount was successfully captured"
      end
    end
  end

  def purchase_payment
    respond_to do |format|
      format.html do
        @order.purchase!
        redirect_to admin_order_path(@order), notice: "Amount was successfully paid"
      end
    end
  end

  def index
    @orders = Order.order('id desc')
    respond_with @orders
  end

  def show
    if @order.shipments.any?
      @shipment = @order.shipments.first
    else
      @shipment = @order.shipments.build
      @shipment.notify_customer = 1
    end

    respond_with @order
  end

  private

  def load_order!
    @order = Order.find_by_number! params[:id]
  end

end
