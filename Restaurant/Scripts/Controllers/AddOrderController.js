var AddOrderController = function ($scope, $location, AddOrderFactory, GetMealsFactory) {
    $scope.AddOrderFailure = false;
    $scope.meals = [];
    $scope.mealsOutput = [];
    $scope.Category_Id = "0";
    $scope.CurrentMeals = [];
    $scope.parseInt = parseInt;
    $scope.Meal_Id = "0";
    $scope.OverAllPrice = 0;
    $scope.MealPrice = 0;

    $scope.addRow = function () {
        $scope.meals.push({ 'Q': $scope.Q, 'IsCombo': $scope.IsCombo, 'IsSpicy': $scope.IsSpicy, 'Meal_Id': $scope.Meal_Id, 'Price': $scope.Price });
        var SpicyPrice = 0
        var CompoPrice = 0;
        var ItemName = '';
        var AddOns = '';
        if ($scope.IsSpicy === true) {
            SpicyPrice = 3;
            AddOns += 'Spicy 3LE';
        }
        if ($scope.IsCombo === true) {
            CompoPrice = 3;
            console.log(CompoPrice);
            AddOns += ' Compo 3LE';
        }

        for (var x = 0 ; x < $scope.CurrentMeals.length ; x++) {
            if (($scope.Meal_Id != $scope.CurrentMeals[x].Id) == false) {
                $scope.Price = $scope.CurrentMeals[x].Price;
                ItemName = $scope.CurrentMeals[x].Name;
            }
        }

        var totalPrice = ((parseInt($scope.Price) + CompoPrice + SpicyPrice) * $scope.Q);
        $scope.OverAllPrice = $scope.OverAllPrice + totalPrice;
        $scope.mealsOutput.push({ 'item': ItemName, 'Q': $scope.Q, 'Price': $scope.Price, 'AddOns': AddOns, 'Total': totalPrice });
        $scope.Q = 0;
        $scope.IsCombo = false;
        $scope.IsSpicy = false;
        $scope.Category_Id = "0";

        $scope.Price = 0;
        $scope.MealPrice = 0;
        $scope.Meal_Id = "0";
    };

    $scope.addRow2 = function () {
        var result = AddOrderFactory($scope.meals)

        result.then(function (result) {
            if (result.success) {
                $scope.meals = [];
                $scope.mealsOutput = [];
                $scope.MealPrice = 0;
                $scope.OverAllPrice = 0;
                //$location.path('/NextOrder');
            } else {
                $scope.AddOrderFailure = true;
            }
        });

    };

    $scope.SelectCategory = function (CategoryId) {
        $scope.Category_Id = CategoryId
        $scope.Meal_Id = "0";
        
        if ($scope.Category_Id != 0) {
            var CategoryMeals = GetMealsFactory($scope.Category_Id)

            CategoryMeals.then(function (datasss) {
                $scope.CurrentMeals = datasss;
                
                });
        }
    };

    $scope.CalPrice = function () {
        $scope.MealPrice = 0;
        if (($scope.Q <= 0)===true) { 
            $scope.Q = 1;
        }
        if ($scope.IsSpicy === true) {
            $scope.MealPrice += 3;
        }
        if ($scope.IsCombo === true) {
            $scope.MealPrice += 3;
        }
        for (var x = 0 ; x < $scope.CurrentMeals.length ; x++) {
            if (($scope.Meal_Id != $scope.CurrentMeals[x].Id) == false) {
                $scope.MealPrice += $scope.CurrentMeals[x].Price;
            }
        }
        $scope.MealPrice = ($scope.MealPrice * $scope.Q);
    };
}
AddOrderController.$inject = ['$scope', '$location', 'AddOrderFactory', 'GetMealsFactory'];