angular.module('HrApp')
    .controller('profileCtrl', function($scope, $http, $filter, $state) {

        $scope.user = {};
        $scope.employees = {};

        $http.get('/users/index').
            success(function(data) {
                $scope.user = data;
                console.log($scope.user);
            }).
            error(function(data) {
                console.log('Error!!!');
            });
        
        $http.get('/employees').
            success(function(data) {
                $scope.employees = data;
                console.log($scope.employees);
            }).
            error(function(data) {
                concole.log('Error!!!');
            });

        $scope.updateUser = function() {

           // $scope.user.address_attributes.address = $scope.user.details.address.address;

            $http.patch('/employees/'+$scope.user.employee_id, $scope.user).
                success(function(data) {
                    console.log('Wysyłanie zakończone sukcesem.');
                    console.log(data);
                    showModal('#submitModal');
                }).
                error(function(data) {
                    console.log('Error!!!');
                    showModal('#errorModal');
                });
                
        };

        function showModal(modalId) {
            $(modalId).modal('show');
        }

    });