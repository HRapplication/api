angular.module('HrApp')
    .controller('sickLeaveCtrl', function($scope, $http, $state) {

        $scope.sickLeave = {status: "waiting"};

        $scope.sendSickLeave = function() {

            var sickLeaveToSend = {};            
                
            console.log($scope.sickLeave.start_date.toString().substr(4,11));
            console.log($scope.sickLeave.end_date.toString().substr(4,11));

            sickLeaveToSend.start_date = $scope.sickLeave.start_date.toString().substr(4,11);
            sickLeaveToSend.end_date = $scope.sickLeave.end_date.toString().substr(4,11);
            sickLeaveToSend.care_type = $scope.sickLeave.care_type;
            sickLeaveToSend.status = $scope.sickLeave.status;


            $http.post('/sick_leave_forms', sickLeaveToSend).
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