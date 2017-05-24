angular.module('HrApp')
    .controller('editEmployeeCtrl', function($scope) {
        $scope.editEmployee= {
            model1: null,
            model2: null,
            employee: [
                {name: 'Jacek', surname: 'Gąsior'},
                {name: 'Wincenty', surname: 'Klich'},
                {name: 'Druzjan', surname: 'Wątły'}
            ],
        };
    });