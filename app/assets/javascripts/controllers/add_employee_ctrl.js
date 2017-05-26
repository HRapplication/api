angular.module('HrApp')
    .controller('addEmployeeCtrl', function($scope, $http, $state) {

        $scope.newEmployee = {};
        $scope.newEmpResponse = {};

        $scope.addEmployee = function() {
            $http.post('/employees', $scope.newEmployee).
                success(function(data)             {
                    console.log('Udało się utworzyć użytkownika.');
                    console.log(data);
                    $scope.newEmpResponse = data;
                    $('#submitModal').modal('show');
                }).
                error(function(data) {
                    console.log('Error!!!');
                });
        };

        $scope.reloadView = function() {
            $('body').removeClass('modal-open').css('padding-right', '');
            $('.modal-backdrop').remove();       
            $state.reload();
        };
        
    });