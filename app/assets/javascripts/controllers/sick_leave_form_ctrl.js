angular.module('HrApp')
    .controller('sickLeaveCtrl', function($scope, $http, $state) {

        $scope.sickLeave = {status: "waiting"};

        $scope.sendSickLeave = function() {
            $http.post('/sick_leave_forms', $scope.sickLeave).
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
            $(modalId).on('hide.bs.modal', reloadView);
        }

        function reloadView() {
            $('body').removeClass('modal-open').css('padding-right', '');
            $('.modal-backdrop').remove();       
            $state.reload();
        }

    });