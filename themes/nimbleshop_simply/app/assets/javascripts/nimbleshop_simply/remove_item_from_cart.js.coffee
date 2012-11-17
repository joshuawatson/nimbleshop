window.NimbleshopSimply = window.NimbleshopSimply || {}

NimbleshopSimply.removeItemsFromCart = class RemoveItemsFromCart
  constructor: ->
    $(document).on 'click', '[data-behavior~=remove-item-from-cart]', ->
      $this = $(this)
      permalink = $this.data("permalink")
      $("#updates_" + permalink).val 0
      $("#cartform").submit()
      false

new NimbleshopSimply.removeItemsFromCart
