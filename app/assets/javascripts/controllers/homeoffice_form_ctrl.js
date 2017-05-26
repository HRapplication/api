angular.module('HrApp')
    .controller('homeOfficeCtrl', function($scope, $http, $state) {

        $scope.homeOffice = {};

        $scope.sendHomeOffice = function() {
            $http.post('/homeoffice_forms', $scope.homeOffice).
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