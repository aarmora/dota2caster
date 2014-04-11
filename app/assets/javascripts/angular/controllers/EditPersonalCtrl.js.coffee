# app/assets/javascripts/angular/controllers/EditPersonalCtrl.js.coffee

@dota2caster.controller 'EditPersonalCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.casters = []
  $http.get('/welcome/show.json').success((data) ->
    $scope.user = data
  )
]