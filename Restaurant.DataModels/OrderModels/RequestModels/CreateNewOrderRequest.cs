using Restaurant.DataModels.DataContracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DataModels.OrderModels.RequestModels
{
    public class CreateNewOrderRequest : BaseRequest
     {
        public List<Order_MealsDTO> AllMeals { get; set; }
    }
}
