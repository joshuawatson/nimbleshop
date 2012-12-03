window.ManageVariants = class ManageVariants
  constructor: ->
    @initActions()

  clearAllInputFields: (content) ->
    # clear all column values in the cloned row
    content.find('input').removeAttr('value')

  cloneRow: (row, newId) ->
    @clearAllInputFields row

    ###
        clone the first row and replace the name with currrent time
        newId = 12121120
        product[variant_rows][0][] to product[variant_rows][12121120][] 
        product_variant_rows_0_ to product_variant_rows_12121120_
    ###
    
    regex = /(\[|_)\d+(\]|_)/g
    html  = row.html().replace(regex, "$1#{newId}$2")
    $("<tr>#{html}</tr>")

  addVariantRow: ->
    @cloneRow @firstRow().clone(), new Date().getTime()

  variantRoot: ->
    $(".variant")

  firstRow: ->
    $(@variantRoot().find('tbody tr:first'))

  addRow: =>
    $(@variantRoot().find('tbody')).
      append(@addVariantRow())

    @variantRoot().
      find(" tbody tr:last input:first").
      focus()

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
    ($ "a[data-behaviour='product-variants-add-row']").live  'click', @addRow 
    ($ "a[data-behaviour='product-variants-add-column']").live  'click', @addColumn
    ($ "a[data-behaviour='product-variants-delete-column']").live 'click', @removeColumn
    ($ "a[data-behaviour='product-variants-delete-row']").live 'click', @removeRow
$ ->
  new window.ManageVariants
