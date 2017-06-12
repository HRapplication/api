
angular.module('HrApp')
    .controller('addEventCtrl', function($scope, $http) {
        
        $scope.event = {};

        $scope.addEvent = function() {

            var eventToSend = {};            
                
            console.log($scope.event.duedate.toString().substr(4,11));            

            eventToSend.duedate = $scope.event.duedate.toString().substr(4,11);            
            eventToSend.content = $scope.event.content;
            eventToSend.spots = $scope.event.spots;
            eventToSend.place = $scope.event.place;
            eventToSend.title = $scope.event.title;

            $http.post('/events', eventToSend).
                success(function(data) {
                    console.log('Post się udał! ');
                    console.log(data);
                }).
                error(function(data) {
                    console.log('Error!!!!'); 
                });

        };
    });

