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
            //Hay que guardar en un viewbag para usarla en el menu de categorías de productos
            ViewBag.categories = bd.Category.ToList();

            var category = bd.Category.Find(id);

            ViewBag.categoryTitle = category.CategoryTitle;
            var productsList = category.Products.ToList();

            return View(productsList);
        }
    }
}