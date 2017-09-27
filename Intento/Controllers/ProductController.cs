using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Intento.Controllers
{
    public class ProductController : Controller
    {
        Models.EbayEntities bd = new Models.EbayEntities();
        // GET: Product
        public ActionResult Product(int id)
        {
            var product = bd.Products.Find(id);
            return View(product);
        }
    }
}