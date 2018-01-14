var app = angular.module("myApp",['ngRoute']);

app.config(function($routeProvider){
	$routeProvider.when('/', {
		templateUrl: './index.html',
		controller: 'homectrl'
	}).when('/login', {
		templateUrl: './login.html',
		controller: 'loginctrl'
	}).otherwise({
		template: '404'
	})
});

app.controller('homectrl', ['$scope','$location', function($scope,$location){
	$scope.goToLogin = function() {
		$location.path('/login');
	};
	$scope.register = function() {
		$location.path('/register');
	};
}]);

app.controller('loginctrl', ['$scope', function($scope){
		$scope.login = function() {
			var username = $scope.username;
			var password = $scope.password;
		};
}]);