#= require admin/products/variant

describe "ManageVariants", ->
  row     = null
  variant = new ManageVariants()

  beforeEach ->
    loadFixtures 'manage-variants.html'

  describe "#clearAllInputFields", ->
    beforeEach ->
      row = $(".variant tbody tr:first")
      variant.clearAllInputFields(row)

    it "clear input value", ->
      for input in row.find(":input")
        expect($(input).val()).toBe('')

  describe "#firstRow", ->
    row = ($ ".variant tbody tr:first")

    it "finds the element", ->
      expect(variant.firstRow().attr('id'))
        .toBe(row.attr('id'))

  beforeEach ->
    row = ($ ".variant tbody tr:first").clone()

  describe "#cloneRow", ->
    result = firstRow = null
    beforeEach ->
      result    = $(variant.cloneRow(row, 122))
      firstRow  = result.find('input:first')

    it "replace name", ->
      expect(firstRow.attr('name'))
        .toBe('product[variant_rows][122][]')

    it "replace id", ->
      expect(firstRow.attr('id'))
        .toBe('product_variant_rows_122_')

  describe "add row event", ->
    count = null
    beforeEach ->
      count = $(".variant tbody tr").length
      ($ "a[data-behaviour='product-variants-add-row']").
        trigger('click')

    it "should add new row with all the columns", ->
      expect($(".variant tbody tr").length).toBe(count + 1) 

    it "focus to first column of the first column", ->
      expect($(".variant tbody tr:last input:first")).toBeFocused()

  describe "remove row event", ->
    firstRow = null
    beforeEach ->
      firstRow = $(".variant tbody tr:first")

      firstRow.
        find("a[data-behaviour='product-variants-delete-row']").
        trigger('click')

    it "should remove the variant row", ->
      newFirstRowId = $(".variant tbody tr:first input").attr('id')
      expect(firstRow.find(':input').attr('id')).not.toBe(newFirstRowId)
