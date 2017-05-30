angular.module('HrApp')
    .controller('profileCtrl', function($scope, $http, $filter, $state) {

        $scope.user = {};
        $scope.employees = {};
        $scope.currentUser = {};
        

        $http.get('/users/index').
            success(function(data) {
                $scope.user = data;
            }).
            error(function(data) {
                console.log('Error!!!');
            });
        
        $http.get('/employees').
            success(function(data) {
                $scope.employees = data;
                console.log($scope.employees);
                $scope.currentUser = $filter('filter')($scope.employees, {id:$scope.user.id});
                $scope.currentUser = $scope.currentUser[0];
            }).
            error(function(data) {
                concole.log('Error!!!');
            });

        $scope.updateCrtUser = function() {

            $http.patch('/update_user', $scope.currentUser).
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