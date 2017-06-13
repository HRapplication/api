angular.module('HrApp')
    .controller('updateEmployeeCtrl', function($scope, $http, $state, $filter) {
       
        $scope.empList = {};
        $scope.employeeListFilt = [];
        $scope.updatedEmployeeId = {};
        $scope.updatedEmployee = {};
        $scope.updateResponse = {};

        $http.get('/employees').
            success(function(data) {
                $scope.empList = data;
                angular.forEach($scope.empList, function(value, key) {
                    if(value.name != null && value.surname != null && value.phone_number != null) {
                        $scope.employeeListFilt.push(value);
                    }
                });
            }).
            error(function(data) {
                concole.log('Error!!!');
            });


        $scope.selectEmployee = function() {
            $scope.updatedEmployee = $filter('filter')($scope.employeeListFilt, {id:$scope.updatedEmployeeId});
            $scope.updatedEmployee = $scope.updatedEmployee[0];
        };

        $scope.updateEmployee = function() {
            $http.patch('/employees/'+$scope.updatedEmployeeId, $scope.updatedEmployee).
                success(function(data) {
                    console.log('Udało się zauktualizować użytkownika.');
                    console.log(data);
                    showModal('#submitModal');
                }).
                error(function(data) {
                    console.log('Error!!!');
                    showModal('#errorModal');
                });
        };

        $scope.deleteEmployee = function() {
            $http.delete('/employees/'+$scope.updatedEmployee.user.id).
                success(function(data) {
                    console.log('Udało się usunąć użytkownika.');
                    console.log(data);
                    showModal('#deleteModal');
                }).
                error(function(data) {
                    console.log('Error!!!');
                    showModal('#deleteModalError');
                });
        };

        function showModal(modalId) {
            $(modalId).modal('show');
            $(modalId).on('hide.bs.modal', reloadView);
        }

        function reloadView() {
            $('body').removeClass('modal-open').css('padding-right', '');
            $('.modal-backdrop').remove();       
            $state.reload();
        }

    });