angular.module('HrApp')
    .controller('CalendarCtrl', function($scope) {
        $(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
         header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,      
      events: [
                                {
                                    title: 'Praca',
                                    start: '2017-05-29T07:00:00',
                                    end: '2017-05-29T16:00:00'
                                },
                                {
                                    title: 'Praca',
                                    start: '2017-05-30T12:00:00',
                                    end: '2017-05-30T16:00:00'
                                },
                                {
                                    title: 'Praca',
                                    start: '2017-05-31T07:00:00',
                                    end: '2017-05-31T16:00:00'
                                },
                                
                           
                            ]                   
     
        });

    });
});

