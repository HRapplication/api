angular.module('HrApp')
    .controller('formsCtrl', function($scope, $http, $filter, $state) {
         
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
                        if(value.care_type == "self"){
                            value.careType = "Opieka zdrowotna: własna"
                        }
                        else if(value.care_type == "child"){
                            value.careType = "Opieka zdrowotna: rodzicielska"
                        }
                    }
                    else if(value.name == 'business_trip_form'){
                        value.newName = 'Delegacja';
                        if(value.company){
                            value.companyPrint = "Firma: "+value.company
                        }
                        if(value.transport){
                            value.transportPrint = "Forma transportu: "+value.transport
                        }
                    }
                    else if(value.name == 'holiday_form'){
                        value.newName = 'Urlop';
                        if(value.holiday_type == "military"){
                            value.holidayType = "Typ urlopu: Służba wojskowa"
                        }
                        else if(value.holiday_type == "compensation_for_overtime"){
                            value.holidayType = "Typ urlopu: Urlop za nadgodziny"
                        }
                        else if(value.holiday_type == "justified_paid_not"){
                            value.holidayType = "Typ urlopu: Bezpłatny"
                        }
                        else if(value.holiday_type == "parental"){
                            value.holidayType = "Typ urlopu: Opiekuńczy"
                        }
                        else if(value.holiday_type == "blood_donation"){
                            value.holidayType = "Typ urlopu: Krwiodawstwo"
                        }
                        else if(value.holiday_type == "training"){
                            value.holidayType = "Typ urlopu: Szkolenie"
                        }
                        if(value.comment){
                            value.commentPrint = "Komentarz: "+value.comment
                        }
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
                        if(value.care_type == "self"){
                            value.careType = "Opieka zdrowotna: własna"
                        }
                        else if(value.care_type == "child"){
                            value.careType = "Opieka zdrowotna: rodzicielska"
                        }
                    }
                    else if(value.name == 'business_trip_form'){
                        value.newName = 'Delegacja';
                        if(value.company){
                            value.companyPrint = "Firma: "+value.company
                        }
                        if(value.transport){
                            value.transportPrint = "Forma transportu: "+value.transport
                        }
                    }
                    else if(value.name == 'holiday_form'){
                        value.newName = 'Urlop';
                        if(value.holiday_type == "military"){
                            value.holidayType = "Typ urlopu: Służba wojskowa"
                        }
                        else if(value.holiday_type == "compensation_for_overtime"){
                            value.holidayType = "Typ urlopu: Urlop za nadgodziny"
                        }
                        else if(value.holiday_type == "justified_paid_not"){
                            value.holidayType = "Typ urlopu: Bezpłatny"
                        }
                        else if(value.holiday_type == "parental"){
                            value.holidayType = "Typ urlopu: Opiekuńczy"
                        }
                        else if(value.holiday_type == "blood_donation"){
                            value.holidayType = "Typ urlopu: Krwiodawstwo"
                        }
                        else if(value.holiday_type == "training"){
                            value.holidayType = "Typ urlopu: Szkolenie"
                        }
                        if(value.comment){
                            value.commentPrint = "Komentarz: "+value.comment
                        }
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
                        if(value.care_type == "self"){
                            value.careType = "Opieka zdrowotna: własna"
                        }
                        else if(value.care_type == "child"){
                            value.careType = "Opieka zdrowotna: rodzicielska"
                        }
                    }
                    else if(value.name == 'business_trip_form'){
                        value.newName = 'Delegacja';
                        if(value.company){
                            value.companyPrint = "Firma: "+value.company
                        }
                        if(value.transport){
                            value.transportPrint = "Forma transportu: "+value.transport
                        }
                    }
                    else if(value.name == 'holiday_form'){
                        value.newName = 'Urlop';
                        if(value.holiday_type == "military"){
                            value.holidayType = "Typ urlopu: Służba wojskowa"
                        }
                        else if(value.holiday_type == "compensation_for_overtime"){
                            value.holidayType = "Typ urlopu: Urlop za nadgodziny"
                        }
                        else if(value.holiday_type == "justified_paid_not"){
                            value.holidayType = "Typ urlopu: Bezpłatny"
                        }
                        else if(value.holiday_type == "parental"){
                            value.holidayType = "Typ urlopu: Opiekuńczy"
                        }
                        else if(value.holiday_type == "blood_donation"){
                            value.holidayType = "Typ urlopu: Krwiodawstwo"
                        }
                        else if(value.holiday_type == "training"){
                            value.holidayType = "Typ urlopu: Szkolenie"
                        }
                        if(value.comment){
                            value.commentPrint = "Komentarz: "+value.comment
                        }
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
 
        $scope.acceptBtn = function(form){
            form.status = "accepted";
 
            if(form.name == 'business_trip_form') {                            
                console.log(form); 
                $http.patch('/business_trip_forms/'+form.id, form).
                    success(function(data){
                        console.log(data);
                        showModal('#submitModal');
                    });
            }
            else if(form.name == 'holiday_form'){
                console.log(form); 
                $http.patch('/holiday_forms/'+form.id, form).
                    success(function(data){
                        console.log(data);
                        showModal('#submitModal');
                    });
            }
            else if(form.name == 'homeoffice_form'){
                console.log(form); 
                $http.patch('/homeoffice_forms/'+form.id, form).
                    success(function(data){
                        console.log(data);
                        showModal('#submitModal');
                    });
            }
            else if(form.name == 'sick_leave_form'){
                console.log(form); 
                $http.patch('/sick_leave_forms/'+form.id, form).
                    success(function(data){
                        console.log(data);
                        showModal('#submitModal');
                    });
            }
 
        };
        $scope.rejectBtn = function(form){
            form.status = "rejected"

            if(form.name == 'business_trip_form') {                            
                console.log(form); 
                $http.patch('/business_trip_forms/'+form.id, form).
                    success(function(data){
                        console.log(data);
                        showModal('#submitModal');
                    });
            }
            else if(form.name == 'holiday_form'){
                console.log(form); 
                $http.patch('/holiday_forms/'+form.id, form).
                    success(function(data){
                        console.log(data);
                        showModal('#submitModal');
                    });
            }
            else if(form.name == 'homeoffice_form'){
                console.log(form); 
                $http.patch('/homeoffice_forms/'+form.id, form).
                    success(function(data){
                        console.log(data);
                        showModal('#submitModal');
                    });
            }
            else if(form.name == 'sick_leave_form'){
                console.log(form); 
                $http.patch('/sick_leave_forms/'+form.id, form).
                    success(function(data){
                        console.log(data);
                        showModal('#submitModal');
                    });
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
 
  });