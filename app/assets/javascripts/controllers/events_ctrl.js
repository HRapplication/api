angular.module('HrApp')
    .controller('eventsCtrl', function($scope, $http) {

        $scope.events = {};

        $http.get('/events').
            success(function(data, status) {
                $scope.events = data;
                console.log(data);
                console.log("jupi, udało się!!!");
            }).
            error(function(data, status) {
                console.log("Error!!! " + status);
            });
        /*
        $scope.events = [
            {
                title: 'Wydarzenie 1',
                content: 'Minim eiusmod exercitation ad aliqua non aliqua ea. Cillum eiusmod dolor consequat elit pariatur culpa esse non fugiat amet et. Id dolor consequat dolore sit cupidatat eu sunt veniam consectetur aliqua velit. Laboris voluptate aliqua incididunt magna aliqua sint tempor Lorem sunt eu. Nulla ipsum eiusmod labore ex in. Velit consectetur occaecat nisi eiusmod laboris ex nisi et pariatur voluptate.'
            },
            {
                title: 'Wydarzenie 2',
                content: 'Minim eiusmod exercitation ad aliqua non aliqua ea. Cillum eiusmod dolor consequat elit pariatur culpa esse non fugiat amet et. Id dolor consequat dolore sit cupidatat eu sunt veniam consectetur aliqua velit. Laboris voluptate aliqua incididunt magna aliqua sint tempor Lorem sunt eu. Nulla ipsum eiusmod labore ex in. Velit consectetur occaecat nisi eiusmod laboris ex nisi et pariatur voluptate.'
            },
            {
                title: 'Wydarzenie 3',
                content: 'Minim eiusmod exercitation ad aliqua non aliqua ea. Cillum eiusmod dolor consequat elit pariatur culpa esse non fugiat amet et. Id dolor consequat dolore sit cupidatat eu sunt veniam consectetur aliqua velit. Laboris voluptate aliqua incididunt magna aliqua sint tempor Lorem sunt eu. Nulla ipsum eiusmod labore ex in. Velit consectetur occaecat nisi eiusmod laboris ex nisi et pariatur voluptate.'
            },
            {
                title: 'Wydarzenie 4',
                content: 'Minim eiusmod exercitation ad aliqua non aliqua ea. Cillum eiusmod dolor consequat elit pariatur culpa esse non fugiat amet et. Id dolor consequat dolore sit cupidatat eu sunt veniam consectetur aliqua velit. Laboris voluptate aliqua incididunt magna aliqua sint tempor Lorem sunt eu. Nulla ipsum eiusmod labore ex in. Velit consectetur occaecat nisi eiusmod laboris ex nisi et pariatur voluptate.'
            },
        ];*/
    });