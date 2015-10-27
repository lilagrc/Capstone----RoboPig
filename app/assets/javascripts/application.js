// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function() {
   $("#feed_button").click(function(event) {
     event.preventDefault();

      var button = $(this);
      var formTag = button.parent('form');
      var url = formTag.attr('action');
      var method = formTag.attr('method');
      console.log(button);
      console.log(formTag);
      console.log(url);

    $.ajax(url, {
      type: method,
      success: function (data) {
      }
    });
  });
});


$(function() {
   $("#schedule_button").click(function(event) {
     event.preventDefault();

      var button = $(this);
      var formTag = button.parent('form');
      var url = formTag.attr('action');
      var method = formTag.attr('method');

    $.ajax(url, {
      type: method,
      datatype:'html',
      success: function (data) {

      var form = $(".schedule_form")


      if (form.hasClass("added")) {
        form.empty();
        form.removeClass("added");
      } else {
        form.append(data);
        form.addClass( "added" );
      }
      }
    });
  });
});







// $(function(){
//   if ($("#container").length > 0) {
//     setTimeout(updateAlerts, 10000);
//   }


//
//   }

// })

// function updateAlerts() {
//   $.getScript("/")
//   setTimeout(updateAlerts, 10000);
// }

// function updateFeedcount () {


// }

