angular.module('HrApp')
    .controller('sickLeaveCtrl', function($scope, $http, $state) {

        $scope.sickLeave = {};

        $scope.sendSickLeave = function() {
            $http.post('/sick_leave_forms', $scope.sickLeave).
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