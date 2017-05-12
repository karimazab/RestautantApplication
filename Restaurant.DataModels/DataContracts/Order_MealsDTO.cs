using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DataModels.DataContracts
{
    public class Order_MealsDTO
    {
        public int Q { get; set; }
        public bool IsCombo { get; set; }
        public bool IsSpicy { get; set; }
        public long Meal_Id { get; set; }
    }
}
