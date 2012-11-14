class Admin::ShipmentsController < AdminController

  before_filter :load_order!

  def create
    @shipment = @order.shipments.build params[:shipment]

    respond_to do |format|
      format.html do
        if @shipment.save
          @order.shipped
          redirect_to admin_order_path(@order)
        end
      end
    end
  end

  private

  def load_order!
    @order = Order.find_by_number! params[:order_id]
  end

end
