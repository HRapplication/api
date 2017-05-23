
angular.module('HrApp')
    .controller('addEventCtrl', function($scope, $http) {
        
        $scope.event = {};

        $scope.addEvent = function() {

            console.log("hey, i'm submitted!!!!");
            
            console.log($scope.event);

            $http.post('/events', $scope.event).
                success(function(data, status) {
                    console.log('Post się udał! ' + status);
                }).
                error(function(data, status) {
                    console.log('Error!!!! ' + status); 
                })
                
        }

/*
        $scope.event= {
            title: '',
            content: 'Świetne wydarzenie! Przyjdźcie, a nie pożałujecie! :-)',
            start_date: '',
            end_date: '',
            start_time: '15:00',
            end_time: '17:00',
        };*/
    });

