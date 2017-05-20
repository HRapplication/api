angular.module('HrApp').controller('eventCtrl', eventCtrl);

function eventCtrl($scope){
    
    $scope.eStartDate = '';
    $scope.eFinishDate = '';
    $scope.eStartTime = '';
    $scope.eFinishTime = '';

    $scope.eDescription = 'Witam!!!';

};