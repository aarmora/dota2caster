@dota2caster = angular.module('dota2caster', [])


# This routing directive tells Angular about the default
# route for our application. The term "otherwise" here
# might seem somewhat awkward, but it will make more
# sense as we add more routes to our application.

@dota2caster.config(['$routeProvider', '$compileProvider', ($routeProvider, $compileProvider) ->
  $routeProvider.
	  when('/editinfo', {
	  	templateUrl: '../templates/personalinfo/show.html',
	  	controller: 'EditPersonalCtrl'
	  }).
	  when('/casters', {
	  	templateUrl: '../templates/casters/index.html',
	  	controller: 'CasterIndexCtrl'
	  }).
    otherwise({
      templateUrl: '../templates/casters/index.html',
      controller: 'CasterIndexCtrl'
    }) 
			$compileProvider.urlSanitizationWhitelist (/^\s*(https?|ftp|mailto|tel|file|steam):/);
		])