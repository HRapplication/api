angular.module 'HrApp'
  .config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise('home')

    $stateProvider
      .state('home', {
        url: '/home',
        controller: 'HomeCtrl',
        templateUrl: 'home.html'
      })
      .state('edit_profile', {
        url: '/edit_profile',
        templateUrl: 'edit_profile.html'
      })

      .state('my_events', {
        url: '/my_events',
        templateUrl: 'events/my_events.html'
      })
      .state('add_event', {
        url: '/add_event',
        templateUrl: 'events/add_event.html'
      })
      .state('events', {
        url: '/events',
        templateUrl: 'events/events.html'
      })
      .state('event_contents', {
        url: '/event_contents',
        templateUrl: 'events/event_contents.html'
      })
      .state('business_trip_form', {
        url: '/business_trip_form',
        templateUrl: 'forms/business_trip_form.html'
      })
      .state('holiday_form', {
        url: '/holiday_form',
        templateUrl: 'forms/holiday_form.html'
      })
      .state('homeoffice_form', {
        url: '/homeoffice_form',
        templateUrl: 'forms/homeoffice_form.html'
      })
      .state('sick_leave_form', {
        url: '/sick_leave_form',
        templateUrl: 'forms/sick_leave_form.html'
      })
       .state('forms', { 
        url: '/forms', 
        templateUrl: 'forms/forms.html' 
      }) 
      .state('my_forms', { 
        url: '/my_forms', 
        templateUrl: 'forms/my_forms.html' 
      }) 
      
      .state('edit_schedule', {
        url: '/edit_schedule',
        templateUrl: 'schedule/edit_schedule.html'
      })
      .state('add_schedule', {
        url: '/add_schedule',
        templateUrl: 'schedule/add_schedule.html'
      })
      .state('submit_schedule', {
        url: '/submit_schedule',
        templateUrl: 'schedule/submit_schedule.html'
      })
      .state('calendar', {
        url: '/calendar',
        templateUrl: 'schedule/calendar.html'
      })
      
      .state('add_employee', {
        url: '/add_employee',
        templateUrl: 'employee/add_employee.html'
      })
      .state('update_employee', {
        url: '/update_employee',
        templateUrl: 'employee/update_employee.html'
      })

      .state('offers', {
        url: '/offers',
        templateUrl: 'offers/offers.html'
      })
      .state('add_offer', {
        url: '/add_offer',
        templateUrl: 'offers/add_offer.html'
      })
      .state('av_offers', {
        url: '/av_offers',
        templateUrl: 'offers/available_offers.html'
      })
