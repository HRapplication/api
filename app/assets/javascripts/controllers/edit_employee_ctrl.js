angular.module('HrApp')
    .controller('editEmployeeCtrl', function($scope, $http, $state) {
       
        $scope.editEmployee= {
            model1: null,
            model2: null,
            employee: [
                {name: 'Jacek', surname: 'Gąsior'},
                {name: 'Wincenty', surname: 'Klich'},
                {name: 'Druzjan', surname: 'Wątły'}
            ],
        };

        $scope.employees = {};
        $scope.updatedEmployee = {};
        $scope.updateResponse = {};

      //  $scope.updatedEmployee = $filter('filter')($scope.employees, {id:$scope.user.id});
       //         $scope.updatedEmployee = $scope.updatedEmployee[0];

        $http.get('/employees').
            success(function(data) {
                $scope.employees = data;
                console.log($scope.employees);
            }).
            error(function(data) {
                concole.log('Error!!!');
            });

        $scope.updateEmployee = function() {
            $http.patch('/update_user', $scope.updatedEmployee).
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
            $http.delete('/employees/'+$scope.updatedEmployee.employee_id).
                success(function(data) {
                    console.log('Udało się usunąć użytkownika.');
                    console.log(data);
                    showModal('#deleteModal');
                }).
                error(function(data) {
                    console.log('Error!!!');
                    showModal('#errorModal');
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