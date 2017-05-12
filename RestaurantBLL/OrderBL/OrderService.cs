using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.DataModels.OrderModels.RequestModels;
using Restaurant.DataModels.OrderModels.ResponseModels;
using DAL.UnitOfWork;
using DAL.DataModel;

namespace RestaurantBLL.OrderBL
{
    public class OrderService : IOrderService
    {
        private readonly UnitOfWork _unitOfWork = new UnitOfWork();
        public CreateNewOrderResponse CreateNewOrder(CreateNewOrderRequest Request)
        {
            var Response = new CreateNewOrderResponse();
            try
            {
                var CurrentOrder = _unitOfWork.RepositoryFactory<Order>().Insert(
                                        new Order
                                        {
                                            DateTime = DateTime.Now
                                        });
                foreach (var item in Request.AllMeals)
                    _unitOfWork.RepositoryFactory<Order_Meals>().Insert(
                        new Order_Meals
                        {
                            IsCombo = item.IsCombo,
                            IsSpicy = item.IsSpicy,
                            Meal_Id = item.Meal_Id,
                            Q = item.Q,
                            Order_Id = CurrentOrder.Id
                        });
                _unitOfWork.Save();
                Response.SetBaseResponse(true, 0, "");
            }
            catch (Exception ex)
            {
                Response.SetBaseResponse(false, 0, ex.Message);

            }
            return Response;
            throw new NotImplementedException();
        }
    }
}
