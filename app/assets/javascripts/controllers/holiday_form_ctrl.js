angular.module('HrApp')
    .controller('holidayCtrl', function($scope, $http, $state) {

        $scope.holiday = {status: "waiting"};

        $scope.sendHoliday = function() {
            $http.post('/holiday_forms', $scope.holiday).
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