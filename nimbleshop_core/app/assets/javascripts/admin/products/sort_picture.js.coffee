window.Nimbleshop = window.Nimbleshop || {}

Nimbleshop.sortPicture = class SortPicture
  constructor: ->
    $(".product_pictures").sortable(update: ->
      order = {}
      $(".product_pictures li").each (index, elem) ->
        order[index] = $(elem).attr("data-id")

      $("#product_pictures_order").attr "value", $.toJSON(order)
    ).disableSelection()


$ ->
  new Nimbleshop.sortPicture
