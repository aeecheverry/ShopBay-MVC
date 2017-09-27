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
        public ActionResult Products(int id)
        {
            var category = bd.Category.Find(id);//Hay que guardar en un viewbag para usarla en el menu de categorías de productos
            var p = category.Products.ToList();
            return View(p);
        }
    }
}