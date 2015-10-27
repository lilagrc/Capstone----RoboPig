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


// keep track of how many feeding there are. If number increases, update num_feedings heading, and flash now message confirmation pet fed.
// ajax could hit url of check_db for values of request OR check for increased feedings.

$(function() {
    setTimeout(poll, 20000);
  });


function poll(){
  var url = "check_db"
  var old_count = $(".num_feedings").html()

  console.log(old_count)

    $.ajax(url, {
      type: "GET",
      success: function (data) {
        var new_count = data.num;
        console.log(new_count);

        if (new_count > old_count) {
          $(".num_feedings").replaceWith(new_count);
          alert("Your pet has been fed!");
        }

        setTimeout(poll, 20000);
      }
    })
  }


