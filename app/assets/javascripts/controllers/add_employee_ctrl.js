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
                    showModal('#submitModal');
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