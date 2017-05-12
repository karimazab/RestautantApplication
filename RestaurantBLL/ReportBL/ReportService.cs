using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.DataModels.DataContracts;
using Restaurant.DataModels.ReportModels.RequestModels;
using DAL.UnitOfWork;
using DAL.DataModel;
using Restaurant.DataModels.OrderModels;
using Restaurant.DataModels.ReportModels;

namespace RestaurantBLL.ReportBL
{
    public class ReportService : IReportService
    {
        private readonly UnitOfWork _unitOfWork = new UnitOfWork();

        public List<MealOrderReportModel> GetMealOrderReport(GetReportRequest Request)
        {
            var response = new DAL.DataModel.RestaurantEntities1().GetMealOrderReport(Request.From, Request.To).Select
                (q =>
               new MealOrderReportModel
               {
                   Product = q.Name,
                   Count = (int)q.allsum
               }
                ).ToList();

            return response;
        }

        public OrderReportModel GetOrderReport(GetReportRequest Request)
        {
            var Response = new OrderReportModel();

             Response.AllOrders = _unitOfWork.RepositoryFactory<Order>()
                .GetMany(q =>
                q.DateTime.Value.Date >= Request.From
                && q.DateTime.Value.Date <= Request.To).Select(q => new OrderDTO
                {
                    AllOrder = q.Order_Meals.Select(w => new OrderMealModel
                    {
                        AddOns = (w.IsCombo ? "Compo 3LE" : "") + (w.IsSpicy ? " Spicy 3LE" : ""),
                        Item = w.Meal.Name,
                        Item_Id = w.Meal_Id,
                        Price = (int)w.Meal.Price,
                        TotalPrice = (((int)w.Meal.Price + (w.IsCombo ? 3 : 0) + (w.IsSpicy ? 3 : 0)) * w.Q),
                        Q = w.Q
                    }).ToList(),
                    Date = q.DateTime.Value.ToShortTimeString() + ' ' + q.DateTime.Value.ToShortDateString() ,
                    OrderTotalPrice = (int)q.Order_Meals.Sum(w => ( (w.Meal.Price +  (w.IsCombo ? 3:0) + (w.IsSpicy ? 3 : 0)) * w.Q)),
                    
                }).ToList();
            Response.OverAllTotalPrice = Response.AllOrders.Sum(q => q.OrderTotalPrice);
            Response.OverAllTotalNumberOfMeals = Response.AllOrders.Sum(q => q.AllOrder.Sum(w => w.Q));
            Response.OverAllTotalNumberOfOrders = Response.AllOrders.Count();
            return Response;
        }
    }
}
