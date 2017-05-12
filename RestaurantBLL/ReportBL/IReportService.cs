using Restaurant.DataModels.DataContracts;
using Restaurant.DataModels.OrderModels;
using Restaurant.DataModels.ReportModels;
using Restaurant.DataModels.ReportModels.RequestModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RestaurantBLL.ReportBL
{
    public interface IReportService
    {
        OrderReportModel GetOrderReport(GetReportRequest Request);
        List<MealOrderReportModel> GetMealOrderReport(GetReportRequest Request);
    }
}
