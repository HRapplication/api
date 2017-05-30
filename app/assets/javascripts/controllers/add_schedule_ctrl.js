angular.module('HrApp')
    .controller('addScheduleCtrl', function($scope, $http, $state) {

        $scope.employeesList = {};
        $scope.selectedEmployeeId = null;

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

        $scope.week = [$scope.monday, $scope.tuesday, $scope.wednesday, $scope.thursday, $scope.friday, $scope.saturday, $scope.sunday];

        $http.get('/employees').
            success(function(data) {
                $scope.employeesList = data;
            }).
            error(function(data) {
                concole.log('Error!!!');
            });
        
        $scope.sendSchedule = function() {
            
            console.log($scope.selectedEmployeeId);
            var flag = 0;

            for(var i=0; i<$scope.week.length; i++){
                sendScheduleDay($scope.week[i], $scope.selectedEmployeeId);
            }
            
            for(var i=0; i<$scope.week.length; i++){
                if($scope.week[i].start_hour == null && $scope.week[i].end_hour == null && $scope.week[i].work_date == null) {
                    flag++;
                }
            }
            console.log(flag);
            if(flag==7){
                showModal('#hintModal')
            } else {
                showModal('#submitModal');
            }

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

        function sendScheduleDay(scheduleDay, empId) {
            
            if(scheduleDay.start_hour == null && scheduleDay.end_hour == null && scheduleDay.work_date == null) {
                return;
            } else {
                scheduleDay.user_id = empId;
                $http.post('/users/'+empId+'/schedules', scheduleDay).
                    success(function(data) {
                        console.log('Dzień pracy przesłany pomyślnie.');
                        console.log(data);
                    }).
                    error(function(data) {
                        console.log('Error!!!');
                        showModal('#errorModal');
                    });
            }
        }

    });
    