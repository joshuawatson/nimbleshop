module Nimbleshop
  module PaymentUtil
    extend self

    def billing_address_json(address)
      { address1: address.address1,
        city:     address.city,
        state:    address.state_name,
        country:  address.country_name,
        zip:      address.zipcode }
    end

    def shipping_address_json(address)
      { first_name: address.first_name,
        last_name:  address.last_name,
        address1:   address.address1,
        city:       address.city,
        state:      address.state_name,
        country:    address.country_name,
        zip:        address.zipcode }
    end

    def activemerchant_options(order)
      { billing_address: billing_address_json(order.final_billing_address), 
        shipping_address: shipping_address_json(order.shipping_address),
        order_id: order.number, 
        email: order.email }
    end
  end
end
