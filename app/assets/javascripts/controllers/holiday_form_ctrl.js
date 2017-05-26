angular.module('HrApp')
    .controller('holidayCtrl', function($scope, $http, $state) {

        $scope.holiday = {};

        $scope.sendHoliday = function() {
            $http.post('/holiday_forms', $scope.holiday).
            success(function(data) {
                console.log('Wysyłanie zakończone sukcesem.');
                console.log(data);
                $('#submitModal').modal('show');   
            }).
            error(function(data) {
                console.log('Error!!!');
                $('#errorModal').modal('show');  
            });
        };

        $scope.reloadView = function() {
            $('body').removeClass('modal-open').css('padding-right', '');
            $('.modal-backdrop').remove();       
            $state.reload();
        };

    });