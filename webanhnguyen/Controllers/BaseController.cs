using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webanhnguyen.Models;

namespace webanhnguyen.Controllers
{
    public abstract class BaseController : Controller
    {
        public databaseDataContext db = new databaseDataContext();
    
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // Your logic here...
            tbl_header hea = db.tbl_headers.SingleOrDefault(n => n.id == 1);
            ViewBag.title = hea.tittle;
            ViewBag.icon = hea.shortcuticon;
            base.OnActionExecuting(filterContext);
        }
    }
}