module NimbleshopAuthorizedotnet
  class Billing < Billing::Base

    attr_reader :order

    def client
      NimbleshopAuthorizedotnet::Client.instance
    end

    def initialize(order)
      @order = order
    end

    private

    # TODO method should return an array with all errors
    # if the array size is zero then it means no error
    def do_authorize(options = {})
      options.symbolize_keys!
      options.assert_valid_keys(:creditcard)

      creditcard = options[:creditcard]

      return false unless valid_card?(creditcard)

      response = client.authorize(order.total_amount_in_cents, creditcard)
      record_transaction(response, 'authorized', card_number: creditcard.display_number)

      response.success?.tap do |success|
        if success
          order.update_attributes(payment_method: ::NimbleshopAuthorizedotnet::Authorizedotnet.first)
          order.authorize
        end
      end
    end

    def do_purchase(options = {})
      options.symbolize_keys!
      options.assert_valid_keys(:creditcard)

      creditcard = options[:creditcard]

      return false unless valid_card?(creditcard)

      response = client.purchase(order.total_amount_in_cents, creditcard)
      record_transaction(response, 'purchased', card_number: creditcard.display_number)

      response.success?.tap do |success|
        if success
          order.update_attributes(payment_method: NimbleshopAuthorizedotnet::Authorizedotnet.first)
          order.purchase
        end
      end
    end

    def do_capture(options = {})
      options.symbolize_keys!
      options.assert_valid_keys(:transaction_gid)
      tsx_id = options[:transaction_gid]

      response = client.capture(order.total_amount_in_cents, tsx_id, {})
      record_transaction(response, 'captured')

      response.success?.tap do |success|
        order.kapture if success
      end
    end

    # TODO How to ensure that the database operation after the transaction with Authorize.net
    # is indeed done
    def do_void(options = {})
      options.symbolize_keys!
      options.assert_valid_keys(:transaction_gid)
      transactiong_id = options[:transaction_gid]

      response = client.void(transactiong_id, {})
      record_transaction(response, 'voided')

      response.success?.tap do |success|
        order.void if success
      end
    end

    def do_refund(options = {})
      options.symbolize_keys!
      options.assert_valid_keys(:transaction_gid, :card_number)

      transaction_gid      = options[:transaction_gid]
      card_number = options[:card_number]

      response = client.refund(order.total_amount_in_cents, transactiong_id, card_number: card_number)
      record_transaction(response, 'refunded')

      response.success?.tap do |success|
        order.refund if success
      end

    end

    def record_transaction(response, operation, additional_options = {})
      options = { operation:          operation,
                  params:             response.params,
                  success:            response.success?,
                  additional_info:    additional_options,
                  transaction_gid:    response.authorization } # TODO is the transaction_gid  response.authorization. will it be
                                                               # response.capture in case of capture

      if response.success? # How about recording amount in failure case too. success key keeps track of which one was success and which one is failure
        options.update(amount: order.total_amount_in_cents)
      end

      order.payment_transactions.create(options)
    end

    def valid_card?(creditcard)
      creditcard && creditcard.valid?
    end
  end
end
