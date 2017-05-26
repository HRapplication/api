angular.module('HrApp')
    .controller('businessCtrl', function($scope, $http, $state) {

        $scope.business = {};

        $scope.sendBusiness = function() {
            $http.post('/business_trip_forms', $scope.business).
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