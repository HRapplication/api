angular.module('HrApp')
    .controller('editScheduleCtrl', function($scope) {
        $scope.editSchedule= {
            employee: [
                {id: '1', name: 'Jacek Gąsior'},
                {id: '2', name: 'Wincenty Klich'},
                {id: '3', name: 'Druzjan Wątły'}
            ],
            start_date: '22/05/2017',
            end_date: '22/05/2017',
            start_time: '15:00',
            end_time: '17:00',
        };
    });