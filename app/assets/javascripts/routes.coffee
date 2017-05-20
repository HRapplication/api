angular.module 'HrApp'
  .config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise('home')

    $stateProvider
      .state('home', {
        url: '/home',
        controller: 'HomeCtrl',
        templateUrl: 'home.html'
      })
      .state('add_event', {
        url: '/add_event',
        templateUrl: 'add_event.html'
      })
      .state('edit_profile', {
        url: '/edit_profile',
        templateUrl: 'edit_profile.html'
      })