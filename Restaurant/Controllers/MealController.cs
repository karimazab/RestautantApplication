using Restaurant.DataModels.DataContracts;
using RestaurantBLL.CategoryBL;
using RestaurantBLL.MealBL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Restaurant.Controllers
{
    public class MealController : Controller 
    {
        [HttpGet]
        public ActionResult GetMeals(long Category_Id)
        {
            MealService x = new MealService();
            var y = x.GetMeals(Category_Id);
            return Json(y, JsonRequestBehavior.AllowGet);
        }
        public ActionResult AddMeal()
        {
            CategoryService x = new CategoryService();
            ViewBag.Categories = x.GetAllCategories(new DataModels.CategoryModels.RequestModels.GetAllCategoriesRequest()).Categories.ToList();
            return View();
        }
        [HttpPost]
        public async Task<bool> AddMeal([System.Web.Http.FromUri]MealDTO Request)
        {
            var File = this.Request.Files;
            if (File.Count > 0 && File[0].ContentLength > 0)
            {
                var path = Path.Combine(Server.MapPath("~/Images/"),
                                        System.IO.Path.GetFileName(File[0].FileName));
                File[0].SaveAs(path);
                Request.PictureURL = path;

            }
            MealService CurrentService = new MealService();
            return (bool)CurrentService.AddMeal(Request);
        }
    }
}
