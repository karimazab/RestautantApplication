using Restaurant.DataModels.OrderModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DataModels.DataContracts
{
    public class OrderDTO
    {
        public List<OrderMealModel> AllOrder { get; set; }
        public int OrderTotalPrice { get; set; }
        public string Date { get; set; }


    }
}
