﻿using System;
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
            tbl_shop shop = db.tbl_shops.SingleOrDefault(n => n.id == 1);
            Session["icon"] = hea.shortcuticon;
            Session["title"] = shop.title;
            Session.Timeout = 40;
            ViewBag.Title = shop.title;
            ViewBag.icon = hea.shortcuticon;
            ViewBag.keyword = shop.keyword;
            ViewBag.shoptitle = shop.title;
            ViewBag.description = shop.description;
            base.OnActionExecuting(filterContext);
        }
    }
}