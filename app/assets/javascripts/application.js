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


/*  A page can't be manipulated safely until the document is "ready." -> $(document).ready()
    jQuery detects this state of readiness for you. 
    This top level funct only runs once pg Document Object Model (DOM) is ready for JS to execute. */ 
$(function() {
  
  blink(); //Called by the page DOM 

  /* function which animates the blinking effect of the image */
  function blink() {
    $(".eyes").velocity({ ry: 0 })
              .velocity("reverse", { delay: 50 })
              .delay(3000)
              .animate({ width:""}, 0, 0, blink); //blink param calls the func when animation completes
  }
  
  /* button click func that animates the svg image  */
  $(".animate").click(function() {
   
   /* animate the chart tilt 5 times */ 
    var i;
    
    for (i = 0; i <= 4; i++) {
      $("#graph").velocity({ rotateZ: "4deg" }).velocity("reverse", { delay: 150 });
    }
    
    /* animate the side shift 3 times */
    var k;
  
    for (k = 0; k <= 2; k++) {
      $("#Layer_1").velocity({ translateX: "50px" }, 500);
      $("#Layer_1").velocity({ translateX: "-50px" }, 500);
    }
               
    //$("#Layer_1").velocity({ rotateZ: "360deg" }, 1500);
    $("#Layer_1").velocity({ translateX: "0px" }, 1000); //reset the background shift to initial
    
  });
  
  /* mouse hover func which animates the svg image when hovered, reverses animation when not */
  $(".svg").hover(function() {
    
    /* animate the bar graphs */
    $("#bar1").velocity({ y: "42.2", height: 7}, [1, 1], 3000 );
    $("#bar2").velocity({ y: "36.4", height: 17}, [1, 1], 3000 );
    $("#bar3").velocity({ y: "27.4", height: 32}, [1, 1], 3000 );
    $("#bar4").velocity({ y: "53.1", height: 6}, [1, 1], 3000 );
    
  }, function() {
    
    /* when svg not hovered, remove the bar animation effects */
    $("#bar1").velocity("reverse", { delay: 150 });
    $("#bar2").velocity("reverse", { delay: 150 });
    $("#bar3").velocity("reverse", { delay: 150 });
    $("#bar4").velocity("reverse", { delay: 150 });
    
  });
  
});
