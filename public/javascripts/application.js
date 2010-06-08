// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){

  // remote links handler
  $('a[data-remote=true]').live('click', function() {
    return request({ url : this.href });
  });

});
