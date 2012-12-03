window.Nimbleshop = window.Nimbleshop || {}

Nimbleshop.editPaymentMethod = class EditPaymentMethod
  constructor: ->
    $(document).on 'click', '[data-behavior~=payment-method-edit-link]', ->
      $this = $(this)
      permalink = $this.data('payment-method-permalink')
      console.log permalink
      contentElem = $("[data-behavior~=payment-method-form-#{permalink}]")
      contentElem.parent().children().hide()
      contentElem.show()

new Nimbleshop.editPaymentMethod


Nimbleshop.selectFirstPaymentMethod = class SelectFirstPaymentMethod
  constructor: ->
    $('[data-behavior~=payment-method-edit-link]:first').trigger('click')

$ ->
  new Nimbleshop.selectFirstPaymentMethod
