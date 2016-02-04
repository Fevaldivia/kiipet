$(document).ready(function(){
  calendar();
  tabs();
});

$(document).on('page:load', function() {
  calendar();
  tabs();
});



var tabs = function(){
  $('#tabs-profile').tabs({
    activate: function(event, ui){
      $('#calendar').fullCalendar('render');
    }
  });
};

var calendar = function(){

    // page is now ready, initialize the calendar...

    var current_resource = function(state){
      if(window.location.href.match(/profiles\/(\d+)/)){
        var profiles = window.location.href.match(/profiles\/(\d+)/)[1];
        //var resources = '/profiles/'+profiles;
        var resources = '/calendars/'+profiles+'/bookings?state='+state;
        return resources;
      }else{
				if(window.location.href.match(/calendars\/(\d+)\/bookings/)){
					var profiles = window.location.href.match(/calendars\/(\d+)\/bookings/)[1];
					var resources = '/calendars/'+profiles+'/bookings?state='+state;
					return resources;
				};
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

			eventSources: [
        {
    		    url: ''+current_resource("available")+'',
            color: '#27ae60'
        },
        {
    		    url: ''+current_resource("taken")+'',
            color: '#c0392b'
   		 }
    ],
   		selectable: {
      month: false,
      agenda: true
   	}	,

    editable: false,
    eventStartEditable: false,
    eventDurationEditable: false
	 });

};
