
angular.module('HrApp')
    .controller('addEventCtrl', function($scope, $http) {
        
        $scope.event = {};

        $scope.addEvent = function() {

            $http.post('/events', $scope.event).
                success(function(data) {
                    console.log('Post się udał! ');
                    console.log(data);
                }).
                error(function(data) {
                    console.log('Error!!!!'); 
                })
                
        }

    });

