// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
/*
  // remote links handler
  $('a[data-remote=true]').live('click', function() {
    return request({ url : this.href });
  });
*/
  $(document).keyup(function(event){
    switch(event.keyCode){
      case 48: value = "#rating_10"; break;
      case 49: value = "#rating_1"; break;
      case 50: value = "#rating_2"; break;
      case 51: value = "#rating_3"; break;
      case 52: value = "#rating_4"; break;
      case 53: value = "#rating_5"; break;
      case 54: value = "#rating_6"; break;
      case 55: value = "#rating_7"; break;
      case 56: value = "#rating_8"; break;
      case 57: value = "#rating_9"; break;
      case 37:
        value = "#previous_link";
        window.location = $(value).attr('href');
      break;
      case 39:
        value = "#next_link";
        window.location = $(value).attr('href');
      break;
      default: return;
    }
    $(value).click();
  });

});

