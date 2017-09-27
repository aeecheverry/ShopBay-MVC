using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Intento.Controllers
{
    public class ProfileUController : Controller
    {
        Models.EbayEntities bd = new Models.EbayEntities();
        // GET: Profile
        public ActionResult ProfileU(int id)
        {
            return View(bd.Users.Find(id));
        }
    }
}