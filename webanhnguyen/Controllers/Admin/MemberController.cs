using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webanhnguyen.Models;
using System.IO;

namespace webanhnguyen.Controllers.Admin
{
    public class MemberController : BaseAdminController
    {
        // GET: Member
        private List<Customer> getMember(int count)
        {
            return getMember(count, "");
        }
        private List<Customer> getAllMember()
        {
            return getMember(-1, "");
        }
        private List<Customer> getMember(int count, String keyword)
        {
            if (!String.IsNullOrEmpty(keyword))
            {
                var result = data.Customers.Where(a => a.email.Contains(keyword)).OrderByDescending(a => a.date_added);
                if (count != -1)
                    result.Take(count);
                return result.ToList();
            }
            else
            {
                var result = data.Customers.OrderByDescending(a => a.date_added);
                if (count != -1)
                    result.Take(count);
                return result.ToList();
            }
        }
        private Customer getOneMember(int id)
        {
            var Member = from ic in data.Customers
                         where ic.id == id
                         select ic;
            if (Member == null)
            {
                return new Customer();
            }
            return Member.Single();
        }
        /*
         * 
         * 
         * 
         */
        public ActionResult Index()
        {
            return MemberView();
        }
        /*
         * 
         * 
         * 
         */
        [HttpGet]
        public ActionResult MemberView()
        {
            var listMember = getMember(10);
            return View(URLHelper.URL_ADMIN_MEMBER, listMember);
        }
        [HttpPost]
        public ActionResult MemberView(FormCollection form, String btnDel)
        {
            if (btnDel != null)
            {
                //Delete all
                DataHelper.AccountHelper.getInstance().deleteAllMembers(data);
            }

            var keyword = form["keyword"];
            var listMember = getMember(10, keyword);
            return View(URLHelper.URL_ADMIN_MEMBER, listMember);
        }

        public ActionResult MemberDetailView(String id)
        {
            if (String.IsNullOrEmpty(id))
            {
                ViewBag.AlertError = "Có lỗi xảy ra!";
            }
            else
            {
                return View(URLHelper.URL_ADMIN_MEMBER_DETAIL, getOneMember(Int32.Parse(id)));
            }
            return MemberView();
        }

        public ActionResult MemberDelete(String id)
        {
            if (String.IsNullOrEmpty(id))
            {
                ViewBag.AlertError = "Không xoá được!";
            }
            else
            {
                try
                {
                    data.Customers.DeleteOnSubmit(getOneMember(Int32.Parse(id)));
                    data.SubmitChanges();
                    ViewBag.AlertSuccess = "Xoá thành công!";
                }
                catch (Exception e)
                {
                    ViewBag.AlertError = "Không xoá được";
                }
            }
            return MemberView();
        }
    }
}