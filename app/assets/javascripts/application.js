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
  
  $(".svg").click(function() {
    
    $("#bar1").velocity({ y: "42.2", height: 7}, [1, 1], 4000 );
              
    $("#bar2").velocity({ y: "36.4", height: 17}, [1, 1], 4000 );
            
    $("#bar3").velocity({ y: "27.4", height: 32}, [1, 1], 4000 );
              
    $("#bar4").velocity({ y: "53.1", height: 6}, [1, 1], 4000 );
    
    $("#graph").delay(2000).velocity({ rotateZ: "4deg" }).velocity("reverse", {delay: 150})
               .velocity({ rotateZ: "4deg" }).velocity("reverse", { delay: 150 });
               
    $("#Layer_1").velocity({ rotateZ: "360deg" }, 1500);
               
  });
  
});

