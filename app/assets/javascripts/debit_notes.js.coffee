# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
# code source: https://kernelgarden.wordpress.com/category/rails/

#$ ->
  $(document).on 'change', '#debit_note_customer_id', (evt) ->
    $.ajax '/debit_note/update_sales',
      type: 'GET'
      dataType: 'script'
      data: { 
          customer_id: $("#debit_note_customer_id option:selected").val() 
      }
      success: (data) ->    
         console.log(data)        
      error: (jqXHR, textStatus, errorThrown, data) ->
         console.log("AJAX Error: #{textStatus}")
        
