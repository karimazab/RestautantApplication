var AddMealController = function ($scope, $location, AddMealFactory) {
    $scope.mealForm = {
        Name: '',
        Price : 0,
        Description: '',
        Category_Id : "0"
    };

    var formData = new FormData();
    $scope.LoadFileData = function (files) {
        for (var file in files) {
            formData.append("file", files[file]);
        }
    };

    $scope.addMeal = function () {
        var result = AddMealFactory($scope.mealForm.Name, $scope.mealForm.Price, $scope.mealForm.Description, $scope.mealForm.Category_Id, formData)
        result.then(function (result) {
            if (result.success) {
                $scope.mealForm = {
                    Name: '',
                    Price: 0,
                    Description: '',
                    Category_Id: "0",
                    
                };
                formData : new FormData()
                //$location.path('/routeOne');
            } else {
                $scope.mealForm.AddMealFailure = true;
            }
        });
    }
}
AddMealController.$inject = ['$scope', '$location', 'AddMealFactory'];