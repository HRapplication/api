angular.module('HrApp')
    .controller('homeOfficeCtrl', function($scope, $http) {

        $scope.homeOffice = {};

        $scope.sendHomeOffice = function() {
            $http.post('/homeoffice_forms', $scope.homeOffice).
            success(function(data) {
                console.log('Wysyłanie zakończone sukcesem.');
            }).
            error(function(data) {
                console.log('Error!!!');
            });
        };
    });