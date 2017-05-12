var GetReportFactory = function ($http, $q) {
    return function (dateFrom, dateTo) {

        var deferredObject = $q.defer();
        $http.get(
            '/Report/GetOrderReport?From=' + dateFrom + '&To=' +dateTo , {

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

GetReportFactory.$inject = ['$http', '$q'];