angular.module('HrApp')
    .controller('CalendarCtrl', function($scope, $http) {

    $scope.schedule = {};
    $scope.user = {};
    var today = new Date();
    var year = today.getFullYear();
    var start = year+'-01-01';
    var end = year+'-12-31'
    
    $http.get('/users/index').
        success(function(data){
            $scope.user = data;
            getSchedule($scope.user.id);
        }).
        error(function(data) {
            console.log('Error!!!');
        });

    function getSchedule(userId, date){
        $http.get('/users/'+userId+'/schedules', {params: {start_date: start, end_date: end, user_id:userId}}).
            success(function(data){
                $scope.schedule = data;
                console.log($scope.schedule);
            }).
            error(function(data) {
                console.log('Error!!!');
            });
    }

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
                        start: start,
                        end: end
                    },
                    {
                        title: 'Praca',
                        start: '2017-05-25T22:44:00Z',
                        end: '2017-05-25T01:44:00Z'
                    }
                ]                   
    });
    //fullCalendar
    });
});

