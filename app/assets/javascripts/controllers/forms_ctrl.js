angular.module('HrApp')
    .controller('formsCtrl', function($scope, $http) {
        
        $scope.business_forms = [];
        $scope.holiday_forms = [];
        $scope.sick_forms = [];
        $scope.home_forms = [];


        $http.get('/business_trip_forms').
            success(function(data) {
                $scope.business_forms = data;                
                console.log($scope.business_form);
            }).
             error(function(data) {
                console.log("Error!!!");
            });


        $http.get('/holiday_forms').
            success(function(data) {
                $scope.holiday_forms = data;                 
                console.log($scope.holiday_forms);
            }).
            error(function(data) {
                console.log("Error!!!");
            });

        $http.get('/sick_leave_forms').
            success(function(data) {
                $scope.sick_forms = data;
                console.log($scope.sick_forms);
            }).
            error(function(data) {
                console.log("Error!!!");
            });

        $http.get('/homeoffice_forms').
            success(function(data) {
                $scope.home_forms = data;
                console.log($scope.home_forms);
            }).
            error(function(data) {
                console.log("Error!!!");
            });

            $scope.showHoliday = function(clickEvent){
                $('.btn-group > .btn').removeClass('active');
                $('.btn-group > .btn').eq(0).addClass('active');

                $("#holiday_form").show();
                $("#business_form").hide();
                $("#sick_form").hide();
                $("#home_form").hide();
            }; 

            $scope.showBusiness = function(){
                $('.btn-group > .btn').removeClass('active');
                $('.btn-group > .btn').eq(3).addClass('active');

                $("#holiday_form").hide();
                $("#business_form").show();
                $("#sick_form").hide();
                $("#home_form").hide();
            };

            $scope.showSick = function(){
                $('.btn-group > .btn').removeClass('active');
                $('.btn-group > .btn').eq(1).addClass('active');

                $("#holiday_form").hide();
                $("#business_form").hide();
                $("#sick_form").show();
                $("#home_form").hide();
            };

            $scope.showHome = function(){
                $('.btn-group > .btn').removeClass('active');
                $('.btn-group > .btn').eq(2).addClass('active');

                $("#holiday_form").hide();
                $("#business_form").hide();
                $("#sick_form").hide();
                $("#home_form").show();
            };
            
    });