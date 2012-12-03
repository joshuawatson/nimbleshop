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
