$(document).on("page:load", function(){
   // page is now ready, initialize the calendar...
    $('#calendar').fullCalendar({
      dayClick: function() {
      alert('has hecho click en un dia');
    }
  });
});

