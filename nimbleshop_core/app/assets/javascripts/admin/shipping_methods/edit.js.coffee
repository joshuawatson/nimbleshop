# this fuction handles anytime shipping cost is changed for a state.
# Also when shipment is enabled or disabled for a state.
$(document).on 'ajax:success', '.update-shipping', (event, result) ->
  $(event.target).parents("tr").replaceWith result.html

