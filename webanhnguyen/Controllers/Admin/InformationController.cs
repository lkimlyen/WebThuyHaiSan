using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webanhnguyen.Models;
using System.IO;

namespace webanhnguyen.Controllers.Admin
{
    public class InformationController : BaseAdminController
    {
           // GET: Information
        private List<tbl_information> getInformation(int count)
        {
            return getInformation(count, "");
        }
        private List<tbl_information> getAllInformation()
        {
            return getInformation(-1, "");
        }
        private List<tbl_information> getInformation(int count, String keyword)
        {
            if (!String.IsNullOrEmpty(keyword))
            {
                var result = data.tbl_informations.Where(a => a.TenTT.Contains(keyword));
                if (count != -1)
                    result.Take(count);
                return result.ToList();
            }
            else
            {
                var result = data.tbl_informations;
                if (count != -1)
                    result.Take(count);
                return result.ToList();
            }
        }
        private tbl_information getOneInformation(int id)
        {
            var information = from ic in data.tbl_informations
                               where ic.id == id
                               select ic;
            if (information == null)
            {
                return new tbl_information();
            }
            return information.Single();
        }
        
        public ActionResult InformationSetStatusEnable(int id)
        {
            tbl_information tic = getOneInformation(id);
            tic.Status = !tic.Status;
            UpdateModel(tic);
            data.SubmitChanges();
            return RedirectToAction("informationView");
        }



        /*
         * 
         * 
         * 
         */
        public ActionResult Index()
        {
            return informationView();
        }
        /*
         * 
         * 
         * 
         */
        [HttpGet]
        public ActionResult informationView()
        {
            var listInformation = getInformation(10);
            return View(URLHelper.URL_ADMIN_INFORMATION, listInformation);
        }
        [HttpPost]
        public ActionResult informationView(FormCollection form, String btnDel)
        {
            if (btnDel != null)
            {
                //Delete checked items
                string checkedList = form["chk[]"];
                if (!String.IsNullOrEmpty(checkedList))
                {
                    string[] arrayStringCheckedList = checkedList.Split(new char[] { ',' });
                    for (int i = 0; i < arrayStringCheckedList.Length; i++)
                    {
                        try
                        {
                            data.tbl_informations.DeleteOnSubmit(getOneInformation(Int32.Parse(arrayStringCheckedList[i])));
                            data.SubmitChanges();
                            ViewBag.AlertSuccess = "Xoá thành công!";
                        }
                        catch (Exception e)
                        {
                            ViewBag.AlertError = "Không xoá được";
                        }
                    }
                }
            }


            var keyword = form["keyword"];
            var listInformation = getInformation(10, keyword);
            return View(URLHelper.URL_ADMIN_INFORMATION, listInformation);
        }
        /*
         * 
         * 
         * 
         */
        [HttpGet]
        public ActionResult informationCreate()
        {
            return View(URLHelper.URL_ADMIN_INFORMATION_M, new tbl_information());
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult informationCreate(FormCollection form, HttpPostedFileBase fileUpload)
        {
            tbl_information tic = new tbl_information();
            var TenTT = form["TenTT"];
            var NoiDung = form["NoiDung"];
           
            bool err = false;
            if (String.IsNullOrEmpty(TenTT))
            {
                err = true;
                ViewData["Error"] += "Vui lòng nhập thông tin!\n";
            }
            tic.TenTT = TenTT;
            tic.NoiDung = NoiDung;
            tic.Status = true;

            if (err == false)
            {
                data.tbl_informations.InsertOnSubmit(tic);
                data.SubmitChanges();
                return RedirectToAction("informationView");
            }
            else
            {
                return View(URLHelper.URL_ADMIN_INFORMATION_M, tic);
            }
        }
        /*
         *
         *
         * 
         */
        [HttpGet]
        public ActionResult informationEdit(String id)
        {
            return View(URLHelper.URL_ADMIN_INFORMATION_M, getOneInformation(Int32.Parse(id)));
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult informationEdit(FormCollection form, HttpPostedFileBase fileUpload)
        {
            var id = form["id"];
            if (id == null)
            {
                return informationCreate(form, fileUpload);
            }
            else
            {
                tbl_information tic = getOneInformation(Int32.Parse(id));
                var TenTT = form["TenTT"];
                var NoiDung = form["NoiDung"];

                bool err = false;
                if (String.IsNullOrEmpty(TenTT))
                {
                    err = true;
                    ViewData["Error"] += "Vui lòng nhập thông tin!\n";
                }
                tic.TenTT = TenTT;
                tic.NoiDung = NoiDung;
                if (err == false)
                {
                    UpdateModel(tic);
                    data.SubmitChanges();
                    return RedirectToAction("informationView");
                }
                else
                {
                    return View(URLHelper.URL_ADMIN_INFORMATION_M, tic);
                }
            }
        }
        /*
         * 
         * 
         * 
         */
        public ActionResult informationDelete(String id)
        {
            if (String.IsNullOrEmpty(id))
            {
                ViewBag.AlertError = "Không xoá được!";
            }
            else
            {
                try
                {
                    data.tbl_informations.DeleteOnSubmit(getOneInformation(Int32.Parse(id)));
                    data.SubmitChanges();
                    ViewBag.AlertSuccess = "Xoá thành công!";
                }
                catch (Exception e)
                {
                    ViewBag.AlertError = "Không xoá được";
                }
            }
            return informationView();
        }
    }
}