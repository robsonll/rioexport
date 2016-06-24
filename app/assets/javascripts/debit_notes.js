(function() {
  $(document).on('change', '#customers_select', function(evt) {
    return $.ajax('/debit_note/update_sales', {
      type: 'GET',
      dataType: 'script',
      data: {
        customer_id: $("#customers_select option:selected").val()
      },
      success: function(data) {
        return console.log(data);
      },
      error: function(jqXHR, textStatus, errorThrown, data) {
        return console.log("AJAX Error: " + textStatus);
      }
    });
  });

}).call(this);