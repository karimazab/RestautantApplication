using Restaurant.DataModels.CategoryModels.RequestModels;
using Restaurant.DataModels.CategoryModels.ResponseModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RestaurantBLL.CategoryBL
{
    public interface ICategoryService
    {
        GetAllCategoriesResponse GetAllCategories(GetAllCategoriesRequest Request);
    }
}
