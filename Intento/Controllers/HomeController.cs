using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Intento.Controllers
{
    public class HomeController : Controller
    {
        Models.EbayEntities bd = new Models.EbayEntities();
        public ActionResult Index()
        {
            List<Category> l = bd.Category();
            return View();
        }
    }
}