(function() {
  $("#sales_notselected").empty().append("<%= escape_javascript(render(:partial => @sales)) %>");

}).call(this);