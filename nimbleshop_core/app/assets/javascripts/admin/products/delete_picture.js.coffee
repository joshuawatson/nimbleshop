window.Nimbleshop = window.Nimbleshop || {}

Nimbleshop.deletePicture = class DeletePicture
  constructor: ->
    $(document).on 'click', '[data-behavior~=delete-product-picture]', ->
      $("#delete_picture_" + $(this).attr("data-action-id")).trigger "click"
      $(this).parent().parent().hide "fast"
      false

new Nimbleshop.deletePicture
