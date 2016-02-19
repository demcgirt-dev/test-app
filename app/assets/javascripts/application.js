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
//= require velocity
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


$(function() {
  
  $(".rect").hover(function() {
    $("#bar1").delay(500)
              .velocity({ fill: "#A2DED0", stroke: "#141414" })
              .velocity({ x: "20", y: "50" });
    
    $("#bar2").delay(1500)
              .velocity({ fill: "#A2DED0", stroke: "#141414" });
    
    $("#bar3").delay(2500)
              .velocity({ fill: "#A2DED0", stroke: "#141414" });
              
    $("#bar4").delay(3500)
              .velocity({ fill: "#A2DED0", stroke: "#141414" });
  });
  
});

/*

  $(".bar1")
    .delay(500)
    .velocity({ fill: "#A2DED0", stroke: "#141414" });

*/
