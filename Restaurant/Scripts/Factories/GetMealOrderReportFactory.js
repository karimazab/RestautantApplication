var GetMealOrderReportFactory = function ($http, $q) {
    return function (dateFrom, dateTo) {

        var deferredObject = $q.defer();
        $http.get(
            '/Report/GetMealOrderReport?From=' + dateFrom + '&To=' + dateTo, {

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

GetMealOrderReportFactory.$inject = ['$http', '$q'];