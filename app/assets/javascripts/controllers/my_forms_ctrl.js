angular.module('HrApp') 
    .controller('myFormsCtrl', function($scope, $http, $filter) { 
         
        $scope.forms = [];  
 
         
        $http.get('/forms/user_combined'). 
            success(function(data) { 
                $scope.forms = data;  
               console.log($scope.forms); 
            }). 
             error(function(data) { 
                console.log("Error!!!"); 
            }); 
               
             
    }); 

