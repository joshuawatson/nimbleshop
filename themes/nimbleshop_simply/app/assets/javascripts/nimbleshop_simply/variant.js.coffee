window.manageVariants = class Variant
  constructor: ->
    @initData()
    @initEvents()

  initEvents: ->
    ($ '.variant-selectors').
        live('change', @updateProductPrice).
        trigger('change')

  initData: ->
    @price =  $('#product-price').data().price
    @labels = $('.variant-selectors').map (i, selectField) -> 
      $(selectField).data().name

    @variants       = [] 
    @variantsArray  = []

    $('.variants-info').map (i, element) => 
      variant = $(element).data()
      @variants.push(variant)
      inner = $.makeArray(@labels.map (k, inner) -> variant[inner])
      @variantsArray.push(inner)

  updateProductPrice: =>
    if variant = @matchingVariant()
      @updateCheckoutButton(variant)
    else
      @disableCheckout()

  matchingVariant: ->
    current = @currentVariantCombination()
    index = 0
    for variant in @variantsArray
      match = true
      for c in current
        match = (variant.indexOf(c) != -1) if match
      return @variants[index] if match
      index++
    null

  disableCheckout: ->
    $('#product-price').
        html 'not available'
    $('#variant').removeAttr('value')
    $("#buy").hide()

  updateCheckoutButton: (variant) ->
    $('#product-price').
        html accounting.formatMoney(@price + variant.price)
    $('#variant').attr('value', variant.id)
    $("#buy").show()

  currentVariantCombination: ->
    $('.variant-selectors').map (i, e) -> $(e).attr('value')
$ ->
  new window.manageVariants()
