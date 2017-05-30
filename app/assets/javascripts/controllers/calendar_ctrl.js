angular.module('HrApp')
    .controller('CalendarCtrl', function($scope, $http) {

    $scope.schedule = {};
    $scope.user = {};
    $scope.scheduleEvents = [];
    var today = new Date();
    var year = today.getFullYear();
    var startDay = year+'-01-01';
    var endDay = year+'-12-31'
    
    $http.get('/users/index').
        success(function(data){
            $scope.user = data;
            getSchedule($scope.user.id);
        }).
        error(function(data) {
            console.log('Error!!!');
        });

    function getSchedule(userId, date){
        $http.get('/users/'+userId+'/schedules', {params: {start_date: startDay, end_date: endDay, user_id:userId}}).
            success(function(data){
                $scope.schedule = data;
                console.log($scope.schedule);
                console.log($scope.schedule[0].work_date + $scope.schedule[0].start_hour.substr(10));
                angular.forEach($scope.schedule, function(value, key) {
                    $scope.scheduleEvents.push({start: value.work_date+value.start_hour.substr(10), end: value.work_date+value.end_hour.substr(10)});
                });
                calendarInit();
            }).
            error(function(data) {
                console.log('Error!!!');
            });
    }

       

    // page is now ready, initialize the calendar...
    function calendarInit(){
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
            events: $scope.scheduleEvents
        });
    }
    
    
});

