angular.module('HrApp')
    .controller('businessCtrl', function($scope, $http, $state) {

        $scope.business = {status: "waiting"};

        $scope.sendBusiness = function() {

            var businessToSend = {};            
                
            console.log($scope.business.start_date.toString().substr(4,11));
            console.log($scope.business.end_date.toString().substr(4,11));

            businessToSend.start_date = $scope.business.start_date.toString().substr(4,11);
            businessToSend.end_date = $scope.business.end_date.toString().substr(4,11);
            businessToSend.transport = $scope.business.transport;
            businessToSend.company = $scope.business.company;
            businessToSend.status = $scope.business.status;

            $http.post('/business_trip_forms', businessToSend).
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