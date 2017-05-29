angular.module('HrApp')
    .controller('CalendarCtrl', function($scope, $http) {

    $scope.events = {};
    $scope.userId = {};
    
    $http.get('/users/index').
        success(function(data){
            $scope.userId = data.id;
            console.log($scope.userId);
        }).
        error(function(data) {
            console.log('Error!!!');
        });

    $http.get('/users/'+$scope.userId+'/schedules', {params: {start_date: '2017-05-29', end_date:'2017-05-30', user_id: $scope.user_Id}}).
    success(function(data){
        console.log(data);
        $scope.events = data;
    });

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
                        //title: 'Praca',
                        //start: $scope.events[0].work_date+$scope.events[0].start_hour.substr(11,19),
                        //end: $scope.events[0].work_date+$scope.events[0].end_hour.substr(11,19)
                    },
                    {
                        //title: 'Praca',
                        start: '2017-05-29T10:00:00',
                        end: '2017-05-29T16:00:00'
                    },
                
                ]                   
     
        });

    });
});

