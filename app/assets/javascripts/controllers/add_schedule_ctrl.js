angular.module('HrApp')
    .controller('addScheduleCtrl', function($scope, $http, $state) {

        $scope.employeesList = {};
        $scope.selectedEmployeeId = null;
        $scope.empListFilter = [];

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
                angular.forEach($scope.employeesList, function(value, key) {
                    if(value.name != null && value.surname != null && value.phone_number != null) {
                        $scope.empListFilter.push(value);
                    }
                });
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
            
            var scheduleDayToSend = {};

            if(scheduleDay.start_hour == null && scheduleDay.end_hour == null && scheduleDay.work_date == null) {
                return;
            } else {
                scheduleDay.user_id = empId;
                console.log(scheduleDay.work_date.toString().substr(4,11));
                console.log(scheduleDay.start_hour.toString().substr(16,5));

                scheduleDayToSend.work_date = scheduleDay.work_date.toString().substr(4,11);
                scheduleDayToSend.start_hour = scheduleDay.start_hour.toString().substr(16,5);
                scheduleDayToSend.end_hour = scheduleDay.end_hour.toString().substr(16,5);
                scheduleDayToSend.is_weekend = scheduleDay.is_weekend;
                scheduleDayToSend.user_id = empId;

                console.log(scheduleDayToSend.start_hour, scheduleDayToSend.end_hour);

                $http.post('/users/'+empId+'/schedules', scheduleDayToSend).
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
    