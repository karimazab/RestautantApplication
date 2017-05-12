using Restaurant.DataModels.DataContracts;
using Restaurant.DataModels.ReportModels.RequestModels;
using RestaurantBLL.ReportBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Restaurant.Controllers
{
    public class ReportController : Controller
    {
        ReportService _Service = new ReportService();

        [HttpGet]
        public ActionResult GetMealOrderReport([System.Web.Http.FromUri]GetReportRequest Request)
        {
            var y = _Service.GetMealOrderReport(Request);
            return Json(y, JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        public ActionResult GetOrderReport([System.Web.Http.FromUri]GetReportRequest Request)
        {
            var y = _Service.GetOrderReport(Request);
            return Json(y, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetReport()
        {
            return View();
        }
    }
}
