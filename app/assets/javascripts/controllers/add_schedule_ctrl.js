angular.module('HrApp')
    .controller('addScheduleCtrl', function($scope, $http, $state) {
        
        $scope.employeesList = {};
        $scope.selectedEmployeeId;

        $scope.monday = {};
        $scope.monday.is_weekend = false;

        $scope.tuesday = {};
        $scope.tuesday.is_weekend = false;

        $scope.wednesday = {};
        $scope.wednesday.is_weekend = false;

        $scope.thursday = {};
        $scope.thursday.is_weekend = false;

        $scope.friday = {};
        $scope.friday.is_weekend = false;
        
        $scope.saturday = {};
        $scope.saturday.is_weekend = true;

        $scope.sunday = {};
        $scope.sunday.is_weekend = true;

        $http.get('/employees').
            success(function(data) {
                $scope.employeesList = data;
            }).
            error(function(data) {
                concole.log('Error!!!');
            });
        
        $scope.sendSchedule = function() {
            
            console.log($scope.selectedEmployeeId);
            showModal('#submitModal');

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