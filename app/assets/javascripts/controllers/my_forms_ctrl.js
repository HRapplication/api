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

  