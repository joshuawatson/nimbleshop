window.Nimbleshop = window.Nimbleshop || {}

Nimbleshop.shipItems = class ShipItems
  constructor: ->
  $(document).on 'click', '[data-behavior~=ship-items]', ->
    $(this).hide()
    $('[data-behavior~=ship-items-box]').show()
    false


new Nimbleshop.shipItems


Nimbleshop.cancelShipItems = class CancelShipItems
  constructor: ->
    $(document).on 'click', '[data-behavior~=ship-items-cancel]', ->
      $('[data-behavior~=ship-items]').show()
      $('[data-behavior~=ship-items-box]').hide()
      false

new Nimbleshop.cancelShipItems
