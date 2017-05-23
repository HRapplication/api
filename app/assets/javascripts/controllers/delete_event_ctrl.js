angular.module('HrApp')
    .controller('delEventsCtrl', function($scope, $http) {
        
        $scope.events = {};

        $http.get('/events').
            success(function(data, status) {
                $scope.events = data;
                console.log(data);
                console.log("jupi, udało się!!!");
            }).
            error(function(data, status) {
                console.log("Error!!! " + status);
            });

        $scope.deleteEvent = function() {

            $http.delete('/events/{id}').
                success(function(data, status) {
                    console.log(data);
                    console.log("jupi, udało się!!!");
                }).
                error(function(data, status) {
                    console.log("Error!!! " + status);
                })            

        }

    });
