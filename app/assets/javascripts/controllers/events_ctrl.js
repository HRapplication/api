angular.module('HrApp')
    .controller('eventsCtrl', function($scope, $http) {

        $scope.events = {};

        $http.get('/events').
            success(function(data) {
                $scope.events = data;
            }).
            error(function(data) {
                console.log("Error!!!");
            });
    });