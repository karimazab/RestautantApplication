var AddOrderFactory = function ($http, $q) {
    return function (allMeals) {

        console.log(allMeals)
        var deferredObject = $q.defer();
        $http.post(
            '/Order/CreateNewOrder', {
                AllMeals :allMeals
                    //: allMeals
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

AddOrderFactory.$inject = ['$http', '$q'];