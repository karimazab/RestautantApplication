using Restaurant.DataModels.OrderModels.RequestModels;
using Restaurant.DataModels.OrderModels.ResponseModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RestaurantBLL.OrderBL
{
    public interface IOrderService
    {
        CreateNewOrderResponse CreateNewOrder(CreateNewOrderRequest Request);
    }
}
