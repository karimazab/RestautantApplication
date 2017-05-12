var AddMealFactory = function ($http, $q) {
    return function (name, price, description,category_Id,formData) {

        var ddata = 
            {
                Meal: {
                    Name: name,
                    Price: price,
                    Descripition: description,
                    Category_Id: category_Id
                }
            }

        var deferredObject = $q.defer();
        $http.post(
            '/Meal/AddMeal?Name=' + name + '&Price=' + price + '&Descripition=' + description + '&Category_Id=' + category_Id, formData, {
                withCredentials: true,
                headers: { 'Content-Type': undefined },
                transformRequest: angular.identity

            }
        ).
        success(function (data) {
            if (data == "True") {
                deferredObject.resolve({ success: true });
            } else {
                deferredObject.resolve({ success: false });
            }
        }).
        error(function () {
            deferredObject.resolve({ success: false });
        });

        return deferredObject.promise;
    }
}

AddMealFactory.$inject = ['$http', '$q'];