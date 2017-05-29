angular.module('HrApp') 
    .controller('formsCtrl', function($scope, $http, $filter) { 
         
        $scope.waiting_forms = [];
        $scope.rejected_forms = []; 
        $scope.accepted_forms = []; 
        $scope.wSickForms = [];
        
    
 
        $http.get('/forms/combined', {params: {status: 'waiting'}}). 
            success(function(data) { 
                $scope.waiting_forms = data;                 
                console.log($scope.waiting_forms); 
                angular.forEach($scope.waiting_forms, function(value, key) {
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
                });
                console.log($scope.wSickForms);
            }). 
             error(function(data) { 
                console.log("Error!!!"); 
            }); 

        $http.get('/forms/combined', {params: {status: 'rejected'}}). 
            success(function(data) { 
                $scope.rejected_forms = data;                 
                console.log($scope.rejected_forms);
                angular.forEach($scope.rejected_forms, function(value, key) {
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
                }); 
            }). 
             error(function(data) { 
                console.log("Error!!!"); 
            });

        $http.get('/forms/combined', {params: {status: 'accepted'}}). 
            success(function(data) { 
                $scope.accepted_forms = data;                 
                console.log($scope.accepted_forms);
                angular.forEach($scope.accepted_forms, function(value, key) {
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
                });
                
            }). 
             error(function(data) { 
                console.log("Error!!!"); 
            });        
 
        $scope.showWaiting = function(){ 
               $('.btn-group > .btn').removeClass('active'); 
               $('.btn-group > .btn').eq(0).addClass('active'); 
               $("#waiting_forms").show(); 
               $("#rejected_forms").hide(); 
               $("#accepted_forms").hide();  
           };  
        $scope.showRejected = function(clickEvent){ 
               $('.btn-group > .btn').removeClass('active'); 
               $('.btn-group > .btn').eq(1).addClass('active'); 
               $("#waiting_forms").hide(); 
               $("#rejected_forms").show(); 
               $("#accepted_forms").hide();                 
           }; 
        $scope.showAccepted = function(clickEvent){ 
               $('.btn-group > .btn').removeClass('active'); 
               $('.btn-group > .btn').eq(2).addClass('active'); 
               $("#waiting_forms").hide(); 
               $("#rejected_forms").hide(); 
               $("#accepted_forms").show();                 
            }; 

        /*function viewTitle() {

            var titles = [];

            for(i=0; i<this.length; i++){
                if(this[i].name=="leave_sick_form"){
                    titles[i] = 'Urlop zdrowotny';
                    console.log(titles[i]);
                }
            }

            return titles;
        }*/
             
  });