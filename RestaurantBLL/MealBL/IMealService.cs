using Restaurant.DataModels.DataContracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RestaurantBLL.MealBL
{
    public interface IMealService
    {
       bool AddMeal(MealDTO Request);
        List<MealDTO> GetMeals(long Category_Id);
    }
}
