using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DataModels.OrderModels
{
    public class OrderMealModel
    {
        public long Item_Id { get; set; }
        public string Item { get; set; }
        public string AddOns { get; set; }
        public int Q { get; set; }
        public int Price { get; set; }
        public int TotalPrice { get; set; }

    }
}
