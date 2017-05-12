using Restaurant.DataModels.DataContracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DataModels.ReportModels
{
    public class OrderReportModel
    {
        public List<OrderDTO> AllOrders { get; set; }
        public int OverAllTotalNumberOfOrders { get; set; }
        public int OverAllTotalNumberOfMeals { get; set; }
        public long OverAllTotalPrice { get; set; }
    }
}
