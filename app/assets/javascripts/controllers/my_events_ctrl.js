angular.module('HrApp')
    .controller('myEventsCtrl', function($scope, $http) {

        $scope.events = {};

        $http.get('/user_events').
            success(function(data) {
                $scope.events = data;                
            }).
            error(function(data) {
                console.log("Error!!!");
            });

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