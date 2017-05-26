angular.module('HrApp')
    .controller('schedulePreferenceCtrl', function($scope) {
        $scope.prefSchedule= {
            select: [
                {id: '1', name: 'Tak'},
                {id: '2', name: 'Nie'}
            ],
            start_date: '22/05/2017',
            end_date: '22/05/2017',
            start_time: '15:00',
            end_time: '17:00',
        };
    });