// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
/*
  // remote links handler
  $('a[data-remote=true]').live('click', function() {
    return request({ url : this.href });
  });
*/  
  $(document).keypress(function(event){
    switch(event.which){
      case 48: value = 10; break;
      case 49: value = 1; break;
      case 50: value = 2; break;
      case 51: value = 3; break;
      case 52: value = 4; break;
      case 53: value = 5; break;
      case 54: value = 6; break;
      case 55: value = 7; break;
      case 56: value = 8; break;
      case 57: value = 9; break;
      default: return;
    }
    link_id = "#rating_" + value;
    $(link_id).click();
  });

});
