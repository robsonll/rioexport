# code source: https://kernelgarden.wordpress.com/category/rails/

$("#s").empty()
  .append("<%= escape_javascript(render(:partial => @sales)) %>")