angular.module('HrApp')
    .controller('addOfferCtrl', function($scope, $http) {
        
        $scope.offer = {};

        $scope.addOffer = function() {

            $http.post('/offers', $scope.offer).
                success(function(data) {
                    console.log('Post się udał! ');
                    console.log(data);
                }).
                error(function(data) {
                    console.log('Error!!!!'); 
                });

        };
    });

