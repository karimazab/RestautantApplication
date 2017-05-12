var GetMealsFactory = function ($http, $q) {
    return function (category_Id) {
        console.log(category_Id)
        var deferredObject = $q.defer();
        $http.get(
            '/Meal/GetMeals?Category_Id='+category_Id, {

            }
        ).
        success(function (data) {
 
            deferredObject.resolve(data);

        }).
        error(function () {
            deferredObject.resolve({ success: false });
        });


        return deferredObject.promise;
    }
}

GetMealsFactory.$inject = ['$http', '$q'];