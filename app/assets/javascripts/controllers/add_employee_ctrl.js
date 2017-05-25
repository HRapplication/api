angular.module('HrApp')
    .controller('addEmployeeCtrl', function($scope, $http) {

        $scope.newEmployee = {};

        $scope.addEmployee = function() {
            $http.post('/employees', $scope.newEmployee).
                success(function(data) {
                    console.log('Udało się utworzyć użytkownika.');
                    console.log(data);
                }).
                error(function(data) {
                    console.log('Error!!!');
                });
        };
        
    });