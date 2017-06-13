angular.module('HrApp')
    .controller('allOffersCtrl', function($scope, $http) {

        $scope.availableOffers = {};
        $scope.disavailableOffers = {};


        $http.get('/offers', {params: {is_available: true}}).
            success(function(data) {
                $scope.availableOffers = data;
                angular.forEach($scope.availableOffers, function(value, key) {
                    if(value.is_available == true){
                        value.isAvailable = 'Oferta dostępna';
                    }
                });                
            }).
            error(function(data) {
                console.log("Error!!!");
            });

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