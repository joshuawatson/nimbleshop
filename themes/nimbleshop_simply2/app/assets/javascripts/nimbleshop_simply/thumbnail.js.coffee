window.NimbleshopSimply = window.NimbleshopSimply || {}

# mouse enter on thumbnail displays the image on the product show page
NimbleshopSimply.showThumbnail = class ShowThumbnail
  constructor: ->
    $(document).on 'mouseenter', '[data-behavior~=product-image-thumbnail]', ->
      $this = $(this)
      itemIndex = $(".thumb").index($this) + 1
      $(".thumbnails li:nth-child(" + itemIndex + ")").show().siblings().hide()
      false

new NimbleshopSimply.showThumbnail
