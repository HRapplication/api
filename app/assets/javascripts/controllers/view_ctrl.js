angular.module('HrApp')
    .controller('viewCtrl', function($scope, $http, $filter) {
    
        var crtUser = {};
        var empls = {};    
       

        $http.get('/users/index').
            success(function(data) {
                crtUser = data;
                getEmpls(crtUser);
            }).
            error(function(data) {
                console.log('Error!!!');
            });
        
        function getEmpls(user){
            $http.get('/employees').
                success(function(data) {
                    empls = data;
                    user = $filter('filter')(empls, {id:user.id});
                    user = user[0];
                    
                    if(user.position == 'hr'){
                        $('.hr-only').removeClass('hr-only');
                    }
                }).
                error(function(data) {
                    concole.log('Error!!!');
                });
            }
        
    });