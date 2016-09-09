var jamNationsAdmin = (function () {
    var jamNationsAdmin = angular.module('jamNations', ['ngRoute','ngMaterial','oc.lazyLoad',  'ngAria','ngAnimate','chart.js', 'angular-loading-bar', 'data-table']);

    jamNationsAdmin.config(['$routeProvider','$mdThemingProvider','cfpLoadingBarProvider', function ($routeProvider,$mdThemingProvider,cfpLoadingBarProvider) {
        $routeProvider.when('/', {
            templateUrl: 'partiels/accueil.html',
            controller: 'AccueilCtrl'
        }).when('/gamejam', {
            templateUrl: 'partiels/gamejam.html',
                        controller: 'GamejamCtrl'
        }).when('/jeux', {
            templateUrl: 'partiels/jeux.html',
            controller: 'JeuxCtrl'
        }).when('/equipe', {
            templateUrl: 'partiels/equipe.html',
            controller: 'EquipeCtrl'
        }).when('/gamejam', {
            templateUrl: 'partiels/gamejam.html',
            controller: 'GamejamCtrl'
        }).when('/gamejam/:id', {
            templateUrl: 'partiels/gamejam-details.html',
            controller: 'GamejamDetailsCtrl'
        }).when('/archives', {
            templateUrl: 'partiels/archives.html',
            controller: 'ArchivesCtrl'
        }).when('/contact', {
            templateUrl: 'partiels/contact.html',
            controller: 'ContactCtrl'
        }).when('/membre', {
            templateUrl: 'partiels/membre.html',
            controller: 'MembreCtrl'
        }).when('/equipe', {
            templateUrl: 'partiels/equipe.html',
            controller: 'EquipeCtrl'
        }).when('/membre/:id', {
            templateUrl: 'partiels/membre-details.html',
            controller: 'MembreDetailsCtrl'
        }).when('/equipe/:id', {
            templateUrl: 'partiels/equipe-details.html',
            controller: 'EquipeDetailsCtrl'
        }).otherwise({
            redirectTo: '/'
        });
         $mdThemingProvider.theme('default')
             .primaryPalette('grey',{'default':'900'}).backgroundPalette('grey',{'default':'800'}).warnPalette('red');
//         ezfbProvider.setLocale('en_US');
       
  
}]);
    return jamNationsAdmin;

})();