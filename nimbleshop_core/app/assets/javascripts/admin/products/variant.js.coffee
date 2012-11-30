window.Nimbleshop = window.Nimbleshop || {}

Nimbleshop.manageVariants = class ManageVariants
  constructor: ->
    @initActions()

  addVariantRow: ->
    ###
        clone the first row and replace the name with currrent time
        product[variant_rows][0][] 
        to
        product[variant_rows][12121120][] 
        when time = 12121120
    ###
    
    newid   = new Date().getTime() 
    matcher = /(\[|_)\d+(\]|_)/g

    content = ($ ".variant tbody tr:first").clone()

    # clear all column values in the cloned row
    content.find('input').removeAttr('value')

    $('<tr/>').append content.html().replace(matcher, "$1#{newid}$2")

  addRow: =>
    ($ ".variant tbody").append @addVariantRow
    false

  addColumn: =>
    ###
        clone first column of each row
        and clear the current value
    ###
    for element in ($ ".variant tr")
      $element = ($ element)
      html = $element.find('td:first,th:first').clone()
      html.find('input').removeAttr('value')
      $($element.find('td,th').get(0)).before(html)
    false

  removeColumn: (event) =>
    $element = ($ event.target)
    # find index of the column delete event is triggered
    index = $element.parents("tr").find('a').index($element)

    for row in ($ ".variant tr")
      #delete the indexed column from each row
      $($(row).find('td,th').get(index)).remove()
    false

  removeRow: (event) =>
    ($ event.target).parents("tr").remove()
    false

  initActions: ->
    ($ "a[data-behaviour='product-variants-add-row']").click  @addRow 
    ($ "a[data-behaviour='product-variants-add-column']").click  @addColumn
    ($ "a[data-behaviour='product-variants-delete-column']").live 'click', @removeColumn
    ($ "a[data-behaviour='product-variants-delete-row']").live 'click', @removeRow

$ ->
  new Nimbleshop.manageVariants
