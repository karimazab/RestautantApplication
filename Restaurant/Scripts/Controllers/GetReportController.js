var GetReportController = function ($scope, $location,$filter, GetReportFactory, GetMealOrderReportFactory) {


    $scope.datefrom;
    $scope.dateto;
    $scope.Orders = [];
    $scope.dateout = '';

    var data = [];



    $scope.GetReport = function () {
        var from =  $filter('date')($scope.datefrom, 'yyyy-MM-dd');
        var to =  $filter('date')($scope.dateto, 'yyyy-MM-dd');
        $scope.dateout = 'From Date :' + from + ' To Date: ' + to;


        var Report1 = GetReportFactory(from, to)

        Report1.then(function (datasss) {
            $scope.Orders = datasss;
            console.log($scope.Orders);
        });

        var test22 = GetMealOrderReportFactory(from, to)
        //console.log(
        test22.then(function (datasss) {
            data = datasss;

            var margin = {
                top: 20,
                right: 20,
                bottom: 50,
                left: 40
            },
            width = 450 - margin.left - margin.right,
            height = 350 - margin.top - margin.bottom;


            var x = d3.scale.ordinal()
              .rangeRoundBands([width, 0], 0.1);

            var y = d3.scale.linear()
              .range([0, height]);

            var xAxis = d3.svg.axis()
              .scale(x)
              .orient("bottom");

            var yAxis = d3.svg.axis()
               .scale(y)
               .orient("left")
               .tickFormat(d3.format("d"))
               .tickSubdivide(0);

            var svg = d3.select("svg#barChart")
              .attr("width", width + margin.left + margin.right)
              .attr("height", height + margin.top + margin.bottom)
              .append("g")
              .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

            x.domain(data.map(function (d) {
                return d.Product;
            }));

            y.domain([d3.max(data, function (d) {
                return d.Count;
            }), 0]);


            svg.append("g")
              .attr("class", "y axis")
              .attr("transform", "translate(0," + height + ")")
              .call(xAxis)
              .selectAll("text")
              .attr("transform", "rotate(90)")
              .attr("x", 0)
              .attr("y", -6)
              .attr("dx", ".6em")
              .style("text-anchor", "start");

            svg.append("g")
              .attr("class", "y axis")
              .call(yAxis);

            svg.selectAll(".bar")
              .data(data)
              .enter().append("rect")
              .attr("class", "bar")

              .attr("x", function (d) {
                  return x(d.Product);
              })
              .attr("width", x.rangeBand())
              .attr("y", function (d) {
                  return y(d.Count);
              })
              .attr("height", function (d) {
                  return height - y(d.Count);
              });
            //console.log(datasss)
        });
        //);
    };
    
}
GetReportController.$inject = ['$scope', '$location', '$filter', 'GetReportFactory', 'GetMealOrderReportFactory'];