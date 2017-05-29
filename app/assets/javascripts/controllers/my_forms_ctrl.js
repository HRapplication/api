angular.module('HrApp') 
    .controller('myFormsCtrl', function($scope, $http, $filter) { 
         
        $scope.forms = [];
      
       
         $http.get('/forms/user_combined', {params: {status: 'waiting'}} || {params: {status: 'rejected'}} || {params: {status: 'accepted'}}  ). 
            success(function(data) { 
                $scope.forms = data;                 
                console.log($scope.forms); 
                angular.forEach($scope.forms, function(value, key) {
                    if(value.name == 'sick_leave_form'){
                        value.newName = 'Urlop zdrowotny';
                    }
                    else if(value.name == 'business_trip_form'){
                        value.newName = 'Delegacja';
                    }
                    else if(value.name == 'holiday_form'){
                        value.newName = 'Urlop';
                    }
                    else if(value.name == 'homeoffice_form'){
                        value.newName = 'Praca zdalna';
                    }
                    if(value.status == 'waiting'){
                        value.newStatus = 'Oczekujący';
                    }
                    if(value.status == 'rejected'){
                        value.newStatus = 'Niezaakceptowany';
                    }
                    if(value.status == 'accepted'){
                        value.newStatus = 'Zaakceptowany';
                    }
                });
            }). 
             error(function(data) { 
                console.log("Error!!!"); 
            }); 
             
    }); 

  