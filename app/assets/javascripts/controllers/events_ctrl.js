angular.module('HrApp')
    .controller('eventsCtrl', function($scope, $http, $state) {

        $scope.events = {};

        $http.get('/events').
            success(function(data) {
                $scope.events = data;                
            }).
            error(function(data) {
                console.log("Error!!!");
            });

        $scope.eventEnlist = function(event) {
            console.log(event);
            $http.post('/events/'+event.id+'/enlist/',event).
                success(function(data) {
                    console.log('Zapisano.');
                    console.log(data);
                    showModal('#submitModal');
                }).
                error(function(data) {
                    console.log('Error!!!');
                    showModal('#errorModal');
            });
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