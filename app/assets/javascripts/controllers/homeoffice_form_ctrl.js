angular.module('HrApp')
    .controller('homeOfficeCtrl', function($scope, $http, $state) {

        $scope.homeOffice = {};

        $scope.sendHomeOffice = function() {
            $http.post('/homeoffice_forms', $scope.homeOffice).
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