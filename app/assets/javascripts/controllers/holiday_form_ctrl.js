angular.module('HrApp')
    .controller('holidayCtrl', function($scope, $http) {

        $scope.holiday = {};

        $scope.sendHoliday = function() {
            $http.post('/holiday_forms', $scope.holiday).
            success(function(data) {
                console.log('Wysyłanie zakończone sukcesem.');
            }).
            error(function(data) {
                console.log('Error!!!');
            });
        };
    });