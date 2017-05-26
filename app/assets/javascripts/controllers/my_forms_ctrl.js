angular.module('HrApp')
    .controller('myFormsCtrl', function($scope, $http, $filter) {
        
        $scope.user_id = {};
        $scope.forms = [];
        $scope.business_forms = [];
        $scope.holiday_forms = [];
        $scope.sick_forms = [];
        $scope.home_forms = [];

        $http.get("/users/index").
            success(function(data){
                $scope.user_id = data.id;
                console.log($scope.user_id);
            }).
            error(function(data) {
               console.log("Error!!!");
            });

        $http.get('/business_trip_forms').
            success(function(data) {
                $scope.business_forms = data;
                $scope.business_forms = $filter("filter")($scope.business_forms, {employee_id: $scope.user_id});                
               console.log($scope.business_form);
            }).
             error(function(data) {
                console.log("Error!!!");
            });


        $http.get('/holiday_forms').
            success(function(data) {
                $scope.holiday_forms = data;
                $scope.holiday_forms = $filter("filter")($scope.holiday_forms, {employee_id: "9"});                  
                console.log($scope.holiday_forms);
            }).
            error(function(data) {
                console.log("Error!!!");
            });

        $http.get('/sick_leave_forms').
            success(function(data) {
                $scope.sick_forms = data;
                $scope.sick_forms = $filter("filter")($scope.sick_forms, {employee_id: $scope.user_id});
                console.log($scope.sick_forms);
            }).
            error(function(data) {
                console.log("Error!!!");
            });

        $http.get('/homeoffice_forms').
            success(function(data) {
                $scope.home_forms = data;
                $scope.home_forms = $filter("filter")($scope.home_forms, {employee_id: $scope.user_id});
                console.log($scope.home_forms);
            }).
            error(function(data) {
                console.log("Error!!!");
            });

         $scope.forms =function(){
            $scope.forms = $scope.forms.concat($scope.business_forms, $scope.holiday_forms,
             $scope.sick_forms,$scope.home_forms);
         };
            
    });