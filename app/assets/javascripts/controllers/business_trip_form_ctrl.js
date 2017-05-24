angular.module('HrApp')
    .controller('businessCtrl', function($scope, $http) {

        $scope.business = {};

        $scope.sendBusiness = function() {
            $http.post('/business_trip_forms', $scope.business).
            success(function(data) {
                console.log('Wysyłanie zakończone sukcesem.');
            }).
            error(function(data) {
                console.log('Error!!!');
            });
        };
    });