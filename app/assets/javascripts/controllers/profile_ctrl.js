
angular.module('HrApp')
    .controller('profileCtrl', function($scope, $http) {

        $scope.user = {};

        $http.get('/users/index').
            success(function(data, status) {
                $scope.user = data;
            }).
            error(function(data, status) {
                console.log('Error!!! ' + status);
            });
        
        $scope.person = {
            name: 'Example',
            surname: 'Prince',
            id: 21371004,
            email: 'example@heroku.com',
            position: 'HR',
            phone_number: '546 454 545',
            address_attributes: {
                address: 'Example 15/4',
                city: 'Kraków',
                country: 'Poland',
                postcode: '64-456'
            }
        };
    });