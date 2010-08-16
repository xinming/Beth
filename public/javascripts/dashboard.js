$(document).ready(function() {
 //Setup toggle button
 var toggles = $("#sidebar ul li a.toggle");
 var i=0;
 for(i=0;i<toggles.length;i++) {
  $(toggles[i]).click( function() {
    var parent = $(this).parent();
    if(parent.hasClass("expanded")) {
      parent.children(".content").slideUp("fast", function() {
parent.toggleClass("expanded"); });
    } else {
      parent.children(".content").slideDown("fast");
      parent.toggleClass("expanded");
    }
    return false;
  });
 };

 //Setup close on click for notifications.
 var notifications = $("#notifications ul li");
 for (i=0; i<notifications.length;i++) {
   $(notifications[i]).click( function() {
     $(this).fadeOut("fast", function() {
       object = $(this);
       //If theres only one notification, remove the ul container as well.
       if( object.siblings().length == 0) {
         object.parent().remove();
       } else {
        object.remove();
       }});
   });
 };

});
