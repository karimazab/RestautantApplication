using Restaurant.DataModels.OrderModels.RequestModels;
using Restaurant.DataModels.OrderModels.ResponseModels;
using RestaurantBLL.CategoryBL;
using RestaurantBLL.OrderBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Restaurant.Controllers
{
    public class OrderController : Controller
    {
        public ActionResult CreateNewOrder()
        {
            CategoryService _CategoryService = new CategoryService();
            ViewBag.Categories = _CategoryService.GetAllCategories(new DataModels.CategoryModels.RequestModels.GetAllCategoriesRequest()).Categories.ToList();
            return View();
        }
        [HttpPost]
        public bool CreateNewOrder(CreateNewOrderRequest Request)
        {
            OrderService _OrderService = new OrderService();
            return (bool)_OrderService.CreateNewOrder(Request).isSuccess;
        }
    }
}
