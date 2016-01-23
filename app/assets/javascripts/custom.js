$(document).ready(function(){
  calendar();
  tabs();
});

$(document).on('page:load', function() {
  calendar();
  tabs();
});



var tabs = function(){
  alert(9);
  $('#tabs-profile').tabs({
    activate: function(event, ui){
      $('#calendar').fullCalendar('render');
    }
  });
};

var calendar = function(){

    // page is now ready, initialize the calendar...

    var current_resource = function(){
      if(window.location.href.match(/profiles\/(\d+)/)){
        var profiles = window.location.href.match(/profiles\/(\d+)/)[1];
        var resources = '/profiles/'+profiles;
        return resources;
      }else{
        var profiles = window.location.href.match(/calendars\/(\d+)\/bookings/)[1];
        var resources = '/calendars/'+profiles+'/bookings';
        return resources;
      };
    };

    var today_or_later = function(){
      var check = $('#calendar').fullCalendar('getDate');
      var today = new Date();
      if(check < today) {
        return false;
      } else {
        return true;
      };
    };

    $('#calendar').fullCalendar({
        header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},

			eventSources: [{
    		url: ''+current_resource()+'',
   		}],

   		selectable: {
      month: false,
      agenda: true
   	}	,

    editable: true,
    eventStartEditable: true,
    eventDurationEditable: true,

    eventDrop: function(booking) {
      var length = (booking.end-booking.start)/(3600000);

        function updateEvent(booking) {
              $.ajax(
                ''+current_resource()+''+booking.id,
                { 'type': 'PATCH',

                  data: { booking: {
                           start_time: "" + booking.start,
                           length: length
                         } }
                }
              );
          };

        updateEvent(booking);

      }
    ,

    eventResize: function(booking) {
      var length = (booking.end-booking.start)/(3600000);

        function updateEvent(booking) {
              $.ajax(
                ''+current_resource()+''+booking.id,
                { 'type': 'PATCH',

                  data: { booking: {
                           start_time: "" + booking.start,
                           length: length
                         } }
                }
              );
          };

        updateEvent(booking);

      }
    ,

   	dayClick: function(date, allDay, jsEvent, view) {
      if (view.name === "month") {
        alert(view.name);
        //$('#calendar').fullCalendar('gotoDate', date);
        //$('#calendar').fullCalendar('changeView', 'agendaDay');
      }
    }
    ,

 		select: function(start, end, allDay) {
      if (window.location.href.match(/new/)) {
        if(today_or_later()) {
        	var length = (end-start)/(3600000);

          $('#calendar').fullCalendar('renderEvent',
            {
              start: start,
              end: end,
              allDay: false
            }
          );

          jQuery.post(
            ''+current_resource()+'',

            { booking: {
              start_time: start,
              length: length,

          	} }
          );

    	    } else {
            // alert("help!");
        }
      }
    }

	});

};
