# app/assets/javascripts/angular/controllers/RestaurantIndexCtrl.js.coffee

@dota2caster.controller 'CasterIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.casters = []
  $http.get('/welcome/index.json').success((data) ->
    $scope.casters = data
  )
]