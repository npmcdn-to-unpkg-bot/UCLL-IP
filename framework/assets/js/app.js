var cards;
var grid;
var app;

(function () {
    'use strict';

    app = angular.module('networksApp', ['ngRoute', 'ngAnimate']);
    app.config(function ($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl: 'assets/parts/home.html',
                controller: 'networksController'
            })
            .when('/add', {
                templateUrl: 'assets/parts/addNetwork.html',
                controller: 'addNetworkController'
            });
    });

    app.controller('networksController', function ($scope, $http) {

        cards = document.getElementById('cards');
        grid = new Masonry(cards, {
            itemSelector: 'article'
        });

        $http.get('http://193.191.187.14:10228/api/networks')
            .success(function (response) {
                $scope.networks = response;
            })
            .error(function (response, status) {
                alert('Error retrieving JSON (' + status + ')');
            });

        setTimeout(function () {
            grid.reloadItems();
            grid.layout();
        }, 500);

    });

    app.controller('addNetworkController', function ($scope, $http) {
        $scope.network = {};
        $scope.errors = {};
        $scope.processForm = function () {
            $http({
                method: 'POST',
                url: 'http://193.191.187.14:10228/api/networks/' + ( $scope.network.hasPassword ? 'protected' : 'open' ),
                data: JSON.stringify($scope.network),
                dataType: 'json',
                headers: {'Content-Type': 'application/json'}
            })
                .success(function (data) {
                    console.log(data);
                    alert("alles cool");
                })
                .error(function (data) {
                    console.log(data);
                    $scope.errors = data.errors;
                });
        };
    });
})();
