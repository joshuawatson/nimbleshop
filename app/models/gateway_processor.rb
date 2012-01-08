class GatewayProcessor

  attr_reader :gateway

  def initialize(options = {})
    payment_method = PaymentMethod.find_by_permalink!(options.fetch(:payment_method_permalink))
    @gateway =  payment_method.gateway
  end

  def purchase(amount, creditcard, order)
    response = gateway.purchase(amount, creditcard)
    transaction_gid = gateway.get_transaction_id_for_purchase(response)
    save_cc_and_create_transaction_record!(transaction_gid, response, 'purchased', order, creditcard)
    transaction_gid
  end

  def authorize(amount, creditcard, order)
    response = gateway.authorize(amount, creditcard)
    transaction_gid = gateway.get_transaction_id_for_authorize(response)
    save_cc_and_create_transaction_record!(transaction_gid, response, 'authorized', order, creditcard)
    transaction_gid
  end

  def capture(amount, transaction)
    response = gateway.capture(amount, transaction.transaction_gid, {})
    transaction_gid = gateway.get_transaction_id_for_capture(response)
    update_transaction_record_and_add_another!(transaction, transaction_gid, response, 'captured')
    transaction_gid
  end

  private

  def update_transaction_record_and_add_another!(transaction, transaction_gid, response, status)
    if transaction_gid
      transaction.update_attributes!(active: false)
      CreditcardTransaction.create!(transaction_gid: transaction_gid,
                          params: response.params,
                          amount: transaction.amount,
                          creditcard_id: transaction.creditcard_id,
                          active: true,
                          status: status,
                          order_id: transaction.order_id,
                          parent_id: transaction.id)
    end
  end

  def save_cc_and_create_transaction_record!(transaction_gid, response, status, order, creditcard)
    if transaction_gid
      creditcard.save!
      CreditcardTransaction.create!(transaction_gid: transaction_gid,
                          params: response.params,
                          amount: order.total_amount,
                          creditcard_id: creditcard.id,
                          active: true,
                          status: status,
                          order_id: order.id)
    end
  end

end
