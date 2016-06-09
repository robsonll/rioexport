# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  $(document).on 'change', '#customers_select', (evt) ->
    $.ajax 'update_sales',
      type: 'GET',
      dataType: 'json',
      data: { customer_id: $("#customers_select option:selected").val() },
      success: (data) ->    
         console.log(data)        
      error: (jqXHR, textStatus, errorThrown, data) ->
         console.log("AJAX Error: #{textStatus}")
        
        