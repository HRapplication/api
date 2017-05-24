angular.module('HrApp')
    .controller('eventContCtrl', function($scope, $http) {

        $scope.event = {};

        $http.get('/events/4').
            success(function(data) {
                $scope.event = data;
            }).
            error(function(data) {
                console.log("Error!!! " );
            });
        
        $scope.eventEnlist = function() {
            $http.post('events/'+$scope.event.id+'/enlist').
                success(function(data) {
                    console.log(data);
                }).
                error(function(data) {
                    console.log('Nie udało się zapisać.');
                });
        };

        $scope.eventEnlistUndo = function() {
            $http.delete('events/'+$scope.event.id+'/enlist').
                success(function(data) {
                    console.log('Udało się wypisać');
                }).
                error(function(data) {
                    console.log('Nie udało się wypisać.');
                });
        };
        
        $scope.eventDelete = function() {
            $http.delete('events/'+$scope.event.id).
                success(function(data) {
                    console.log('Udało się usunąć');
                }).
                error(function(data) {
                    console.log('Nie udało się usunąć.');
                });
        };

        
    });

