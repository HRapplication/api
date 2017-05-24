angular.module('HrApp')
    .controller('sickLeaveCtrl', function($scope, $http) {

        $scope.sickLeave = {};

        $scope.sendSickLeave = function() {
            $http.post('/sick_leave_forms', $scope.sickLeave).
            success(function(data) {
                console.log('Wysyłanie zakończone sukcesem.');
            }).
            error(function(data) {
                console.log('Error!!!');
            });
        };

        

    });