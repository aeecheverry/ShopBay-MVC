using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Intento.Controllers
{
    public class ProductsController : Controller
    {
        Models.EbayEntities bd = new Models.EbayEntities();
        // GET: Products
        public ActionResult Products(string id)
        {
            var categories = bd.Category.ToList();
            var category=categories[0];
            var p = category.Products.ToList();
            return View(p);
        }
    }
}