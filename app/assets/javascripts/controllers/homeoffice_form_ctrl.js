angular.module('HrApp')
    .controller('homeOfficeCtrl', function($scope, $http, $state) {

        $scope.homeOffice = {status: "waiting"};

        $scope.sendHomeOffice = function() {

            var homeOfficeToSend = {};            
                
            console.log($scope.homeOffice.start_date.toString().substr(4,11));
            console.log($scope.homeOffice.end_date.toString().substr(4,11));

            homeOfficeToSend.start_date = $scope.homeOffice.start_date.toString().substr(4,11);
            homeOfficeToSend.end_date = $scope.homeOffice.end_date.toString().substr(4,11);
            homeOfficeToSend.status = $scope.homeOffice.status;

            $http.post('/homeoffice_forms', homeOfficeToSend).
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