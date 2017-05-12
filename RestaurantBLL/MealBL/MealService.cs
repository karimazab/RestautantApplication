using DAL.DataModel;
using DAL.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.DataModels.DataContracts;

namespace RestaurantBLL.MealBL
{
    public class MealService : IMealService
    {
        private readonly UnitOfWork _unitOfWork = new UnitOfWork();
        public bool AddMeal(MealDTO Request)
        {
            try
            {
                _unitOfWork.RepositoryFactory<Meal>().Insert
                    (
                        new Meal
                        {
                            Name = Request.Name,
                            Category_Id = Request.Category_Id,
                            Descripition = Request.Descripition,
                            PictureURL = Request.PictureURL,
                            Price = Request.Price
                        }
                    );
                _unitOfWork.Save();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;

            }
        }

        public List<MealDTO> GetMeals(long Category_Id)
        {
            return _unitOfWork.RepositoryFactory<Meal>().GetMany(q => q.Category_Id == Category_Id).Select(q => new MealDTO
            {
                Id = q.Id,
                Name = q.Name,
                Price = (float)q.Price
            }).ToList();
        }
    }
}
