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
        [HttpPost]
        public ActionResult Products(string keyWords)
        {
            ViewBag.categories = bd.Category.ToList();
            ViewBag.categoryTitle = "Result of " + keyWords;
            if (!String.IsNullOrEmpty(keyWords) && !keyWords.Trim().Equals(""))
            {
                List<Models.Products> Tabla = bd.Products.ToList();
                List<Models.Products> Resultado = new List<Models.Products>();
                foreach (Models.Products i in Tabla)
                {
                    string[] elements = keyWords.Replace(' ', ';').Split(';');
                    foreach (string key in elements)
                    {
                        string name = i.Name.ToLower();
                        if (key != "" && name.Contains(key.ToLower()))
                        {
                            Resultado.Add(i);
                        }
                    }
                }
                return View(Resultado.AsQueryable());
            }
            else
            {
                var Query = from product in bd.Products select product;
                return View(Query);
            }
        }
    }
}