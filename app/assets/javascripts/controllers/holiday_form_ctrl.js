angular.module('HrApp')
    .controller('holidayCtrl', function($scope, $http, $state) {

        $scope.holiday = {status: "waiting"};

        $scope.sendHoliday = function() {

            var holidayToSend = {};            
                
            console.log($scope.holiday.start_date.toString().substr(4,11));
            console.log($scope.holiday.end_date.toString().substr(4,11));

            holidayToSend.start_date = $scope.holiday.start_date.toString().substr(4,11);
            holidayToSend.end_date = $scope.holiday.end_date.toString().substr(4,11);
            holidayToSend.comment = $scope.holiday.comment;
            holidayToSend.holiday_type = $scope.holiday.holiday_type;
            holidayToSend.status = $scope.holiday.status;

            $http.post('/holiday_forms', holidayToSend).
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