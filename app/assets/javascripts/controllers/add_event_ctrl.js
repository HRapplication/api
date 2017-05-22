
angular.module('HrApp')
    .controller('addEventCtrl', function($scope) {
        $scope.event= {
            title: '',
            content: 'Świetne wydarzenie! Przyjdźcie, a nie pożałujecie! :-)',
            start_date: '22/05/2017',
            end_date: '22/05/2017',
            start_time: '15:00',
            end_time: '17:00',
        };
    });