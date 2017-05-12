using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.DataModels.CategoryModels.RequestModels;
using Restaurant.DataModels.CategoryModels.ResponseModels;
using DAL.UnitOfWork;
using DAL.DataModel;
using Restaurant.DataModels.DataContracts;

namespace RestaurantBLL.CategoryBL
{
    public class CategoryService : ICategoryService
    {
        private readonly UnitOfWork _unitOfWork = new UnitOfWork();
        public GetAllCategoriesResponse GetAllCategories(GetAllCategoriesRequest Request)
        {
            var Response = new GetAllCategoriesResponse();
            try
            {
                Response.Categories = _unitOfWork.RepositoryFactory<Category>()
                    .GetAll()
                    .Select(
                        q => new CategoryDTO
                        {
                            Id = q.Id,
                            Name = q.Name,
                            Category_Meals = q.Meals.Select(
                                                w => new MealDTO
                                                {
                                                    Id = w.Id,
                                                    Name = w.Name
                                                }).ToList()
                        }).ToList();
                Response.SetBaseResponse(true, 0, "");
            }
            catch (Exception ex)
            {
                Response.SetBaseResponse(false, 0, ex.Message);

            }
            return Response;
        }
    }
}
