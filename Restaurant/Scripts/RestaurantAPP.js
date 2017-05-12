var RestaurantAPP = angular.module('RestaurantAPP', ['ngRoute']);

RestaurantAPP.controller('LandingPageController', LandingPageController);
RestaurantAPP.controller('AddMealController', AddMealController);
RestaurantAPP.controller('AddOrderController', AddOrderController);
RestaurantAPP.controller('GetReportController', GetReportController);

RestaurantAPP.factory('AddMealFactory', AddMealFactory);
RestaurantAPP.factory('AddOrderFactory', AddOrderFactory);
RestaurantAPP.factory('GetMealsFactory', GetMealsFactory);
RestaurantAPP.factory('GetReportFactory', GetReportFactory);
RestaurantAPP.factory('GetMealOrderReportFactory', GetMealOrderReportFactory);


var configFunction = function ($routeProvider) {
    $routeProvider.
        when('/AddMeal', {
            templateUrl: '/Meal/AddMeal',
            controller: AddMealController
        })
        .when('/AddOrder', {
            templateUrl: '/Order/CreateNewOrder',
            controller: AddOrderController
        })
        .when('/Report', {
            templateUrl: '/Report/GetReport',
            controller: GetReportController
        });
}
configFunction.$inject = ['$routeProvider', '$httpProvider'];


RestaurantAPP.config(configFunction);