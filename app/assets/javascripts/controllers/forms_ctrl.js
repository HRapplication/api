angular.module('HrApp') 
    .controller('formsCtrl', function($scope, $http) { 
         
        $scope.waiting_forms = [];
        $scope.rejected_forms = []; 
        $scope.accepted_forms = []; 
        $scope.waitingTitles = [];
    
 
        $http.get('/forms/combined', {params: {status: 'waiting'}}). 
            success(function(data) { 
                $scope.waiting_forms = data;                 
                console.log($scope.waiting_forms); 
                angular.forEach($scope.waiting_forms, viewTitle);
            }). 
             error(function(data) { 
                console.log("Error!!!"); 
            }); 

        $http.get('/forms/combined', {params: {status: 'rejected'}}). 
            success(function(data) { 
                $scope.rejected_forms = data;                 
                console.log($scope.rejected_forms); 
            }). 
             error(function(data) { 
                console.log("Error!!!"); 
            });

        $http.get('/forms/combined', {params: {status: 'accepted'}}). 
            success(function(data) { 
                $scope.accepted_forms = data;                 
                console.log($scope.accepted_forms); 
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
               $('.btn-group > .btn').eq(0).addClass('active'); 
               $("#waiting_forms").hide(); 
               $("#rejected_forms").show(); 
               $("#accepted_forms").hide();                 
           }; 
        $scope.showAccepted = function(clickEvent){ 
               $('.btn-group > .btn').removeClass('active'); 
               $('.btn-group > .btn').eq(0).addClass('active'); 
               $("#waiting_forms").hide(); 
               $("#rejected_forms").hide(); 
               $("#accepted_forms").show();                 
            }; 

        function viewTitle() {
            if(this.hasOwnProperty('care_type'))
            {
                $scope.title = 'Urlop zdrowotny';
                console.log($scope.title);
            }
        }
             
  });