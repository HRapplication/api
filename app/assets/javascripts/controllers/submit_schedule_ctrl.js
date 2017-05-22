angular.module('HrApp')
    .controller('submitScheduleCtrl', function($scope) {
        $scope.submitSchedule= {
            employee: [
                {id: '1', name: 'Jacek Gąsior'},
                {id: '2', name: 'Wincenty Klich'},
                {id: '3', name: 'Druzjan Wątły'}
            ],
        };
    });