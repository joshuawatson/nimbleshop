window.NimbleshopSimply = window.NimbleshopSimply || {}

NimbleshopSimply.toggleBillingAddress = class ToggleBillingAddress
  constructor: ->
    @handleToggleCheckBox()
    $(document).on 'click', "#order_shipping_address_attributes_use_for_billing", =>
      @handleToggleCheckBox()

  handleToggleCheckBox: ->
    if $("#order_shipping_address_attributes_use_for_billing").is(':checked')
      $('#billing_well').hide()
    else
      $('#billing_well').show()


$ ->
  new NimbleshopSimply.toggleBillingAddress
