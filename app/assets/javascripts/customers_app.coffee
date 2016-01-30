app = angular.module 'customers', []

CustomerSearchController = ($scope, $http) ->

  $scope.customers = []
  page = 0

  $scope.search = (searchTerm) ->
    return if searchTerm.length < 3

    $http.get '/customers.json',
      params:
        keywords: searchTerm
        page: page
    .then (response) ->
      $scope.customers = response.data
    , (response) ->
      alert "Something went wrong: #{response.status}"

  $scope.previousPage = ->
    if page > 0
      page = page - 1
      $scope.search($scope.keywords)

  $scope.nextPage = ->
    page = page + 1
    $scope.search($scope.keywords)


app.controller('CustomerSearchController', ['$scope', '$http',
  CustomerSearchController])
