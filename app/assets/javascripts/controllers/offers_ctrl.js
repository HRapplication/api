angular.module('HrApp')
    .controller('offersCtrl', function($scope, $http) {

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

        $http.get('/offers', {params: {is_available: false}}).
            success(function(data) {
                $scope.disavailableOffers = data;
                angular.forEach($scope.disavailableOffers, function(value, key) {
                    if(value.is_available == false){
                        value.isAvailable = 'Oferta niedostępna';
                    }
                });                
            }).
            error(function(data) {
                console.log("Error!!!");
            });

  
        $scope.changeState = function(offer){         
            if(offer.is_available == true) {
                offer.is_available = false;
                console.log(offer); 
                $http.patch('/offers/'+offer.id, offer).
                    success(function(data){
                        console.log(data);
                        showModal('#submitModal');
                    });
            }
            else if(offer.is_available == false) {
                offer.is_available = true;
                console.log(offer); 
                $http.patch('/offers/'+offer.id, offer).
                    success(function(data){
                        console.log(data);
                        showModal('#submitModal');
                    });
            }
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