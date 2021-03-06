﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webanhnguyen.Models;
using PagedList.Mvc;
using PagedList;


namespace webanhnguyen.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }
        
        #region loại snar phẩm ngoài trang chủ
        public ActionResult ProductbyCategory()
        {
            ViewBag.Categories = ((from mn in db.tbl_product_types
                                   join s in db.tbl_Products on mn.ID equals s.IDLoaiSP
                                   where mn.Status == true && mn.ID == s.IDLoaiSP && mn.TrangChu == true && s.Status == true
                                   select mn).Distinct()).ToList();
            var listItem = (from mn in db.tbl_Products where mn.Status == true && mn.TrangChu == true orderby mn.NgayCapNhat descending select mn).ToList();
                                    
           // ViewBag.Product = db.tbl_Products.Where(n => n.Status == true).ToList();

            return PartialView(listItem);
        }
        #endregion
        #region món ăn mỗi ngày
        [ChildActionOnly]
        public ActionResult monanmoingay()
        {
            ViewBag.tinmoinhat = (from sp in db.tbl_news
                                  where sp.status == true
                                  orderby sp.NgayCapNhat descending
                                  select sp).Skip(0).Take(1).ToList();
            var tt = (from sp in db.tbl_news
                      where sp.status == true
                      orderby sp.NgayCapNhat descending
                      select sp).Skip(1).Take(4).ToList();
            return PartialView(tt);
        }
        #endregion
        #region chi tiết sản phẩm
        public ActionResult Details(string id)
        {
            tbl_header hea = db.tbl_headers.SingleOrDefault(n => n.id == 1);
            Session["title"] = ViewBag.shoptitle;

            Session["icon"] = hea.shortcuticon;
            var CT_SP = (db.tbl_Products.First(sp => sp.alias.Equals(id)));
            int loai = int.Parse(CT_SP.IDLoaiSP.ToString());
            ViewBag.TenLoai = (from s in db.tbl_Products
                               from l in db.tbl_product_types
                               where s.alias.Equals(id) && s.IDLoaiSP == l.ID && s.Status == true
                               select l);
            ViewBag.SP_cungloai = (from s in db.tbl_Products
                                   where s.alias != id && s.IDLoaiSP == loai && s.Status == true
                                   select s).Skip(0).Take(4).ToList();
            ViewBag.SP_khac = (from s in db.tbl_Products
                               where s.alias != id && s.IDLoaiSP != loai && s.Status == true
                               select s).Skip(0).Take(4).ToList();
            //CT_SP.LuotXem += 1;
            //UpdateModel(CT_SP);
            //db.SubmitChanges();
            ViewBag.Title = CT_SP.title;
            ViewBag.keyword = CT_SP.keyword;
            ViewBag.description = CT_SP.description;

            return View(CT_SP);
        }
        #endregion
        #region sản phẩm theo loại
        public ActionResult ProductType(string id, int? page, string sorting)
        {
            tbl_header hea = db.tbl_headers.SingleOrDefault(n => n.id == 1);
            Session["title"] = ViewBag.shoptitle;

            Session["icon"] = hea.shortcuticon;

            int pageSize = 20;
            int pageNum = (page ?? 1);

            var laysp = from g in db.tbl_Products
                        from h in db.tbl_product_types
                        where h.alias.Equals(id) && g.IDLoaiSP == h.ID && g.Status == true && h.Status == true
                        select g;
            Session["loai"] = id;
            tbl_product_type loai = db.tbl_product_types.SingleOrDefault(n => n.alias.Equals(id));
            Session["tenloai"] = loai.TenLoaiSP;
            ViewBag.TenLoai = (from l in db.tbl_product_types
                               where l.alias.Equals(id)
                               select l);
            ViewBag.TenSapXep = "Sắp xếp: A đến Z";
            ViewBag.NameSortParm = "Name_desc";
            ViewBag.NameSortParmasc = "Name_asc";
            ViewBag.DateSortParm = "Date_desc";
            ViewBag.PriceSortParm = "Price_desc";
            ViewBag.PriceSortPasc = "Price";
            if (sorting == "Name_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp: Z đến A";
                return View(laysp.OrderByDescending(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Name_asc")
            {
                ViewBag.TenSapXep = "Sắp xếp: A đến Z";
                return View(laysp.OrderBy(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Date_desc")
            {
                ViewBag.TenSapXep = "Sản phẩm mới";
                return View(laysp.OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Price_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Cao Đến Thấp";
                return View(laysp.OrderByDescending(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }

            if (sorting == "Price")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Thấp đến Cao";
                return View(laysp.OrderBy(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }
            return View(laysp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult hienthi2(string id, int? page, string sorting)
        {
            tbl_header hea = db.tbl_headers.SingleOrDefault(n => n.id == 1);
            Session["title"] = ViewBag.shoptitle;
            Session["icon"] = hea.shortcuticon;

            int pageSize = 20;
            int pageNum = (page ?? 1);
            var laysp = from g in db.tbl_Products
                        from h in db.tbl_product_types
                        where h.alias.Equals(id) && g.IDLoaiSP == h.ID && g.Status == true && h.Status == true
                        select g;
            ViewBag.TenLoai = (from l in db.tbl_product_types
                               where l.alias.Equals(id)
                               select l);
            Session["loai"] = id;
            ViewBag.TenSapXep = "Sắp xếp: A đến Z";

            ViewBag.NameSortParm = "Name_desc";
            ViewBag.NameSortParmasc = "Name_asc";
            ViewBag.DateSortParm = "Date_desc";
            ViewBag.PriceSortParm = "Price_desc";
            ViewBag.PriceSortPasc = "Price";
            if (sorting == "Name_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp: Z đến A";
                return View(laysp.OrderByDescending(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Name_asc")
            {
                ViewBag.TenSapXep = "Sắp xếp: A đến Z";
                return View(laysp.OrderBy(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Date_desc")
            {
                ViewBag.TenSapXep = "Sản phẩm mới";
                return View(laysp.OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Price_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Cao Đến Thấp";
                return View(laysp.OrderByDescending(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }

            if (sorting == "Price")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Thấp đến Cao";
                return View(laysp.OrderBy(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }
            return View(laysp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult hienthi3(string id, int? page, string sorting)
        {
            tbl_header hea = db.tbl_headers.SingleOrDefault(n => n.id == 1);
            Session["title"] = ViewBag.shoptitle;

            Session["icon"] = hea.shortcuticon;

            int pageSize = 20;
            int pageNum = (page ?? 1);
            var laysp = from g in db.tbl_Products
                        from h in db.tbl_product_types
                        where h.alias.Equals(id) && g.IDLoaiSP == h.ID && g.Status == true && h.Status == true
                        select g;
            ViewBag.TenLoai = (from l in db.tbl_product_types
                               where l.alias.Equals(id)
                               select l);
            Session["loai"] = id;
            ViewBag.TenSapXep = "Sắp xếp: A đến Z";
            ViewBag.NameSortParm = "Name_desc";
            ViewBag.NameSortParmasc = "Name_asc";
            ViewBag.DateSortParm = "Date_desc";
            ViewBag.PriceSortParm = "Price_desc";
            ViewBag.PriceSortPasc = "Price";
            if (sorting == "Name_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp: Z đến A";
                return View(laysp.OrderByDescending(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Name_asc")
            {
                ViewBag.TenSapXep = "Sắp xếp: A đến Z";
                return View(laysp.OrderBy(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Date_desc")
            {
                ViewBag.TenSapXep = "Sản phẩm mới";
                return View(laysp.OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Price_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Cao Đến Thấp";
                return View(laysp.OrderByDescending(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }

            if (sorting == "Price")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Thấp đến Cao";
                return View(laysp.OrderBy(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }

            return View(laysp.ToPagedList(pageNum, pageSize));
        }
        #endregion

        #region sản phẩm theo loại
        public ActionResult Laycatuoi(int? page, string sorting)
        {
            tbl_header hea = db.tbl_headers.SingleOrDefault(n => n.id == 1);
            Session["icon"] = hea.shortcuticon;
            Session["title"] = ViewBag.shoptitle;
            int pageSize = 20;
            int pageNum = (page ?? 1);
            var laysp = from g in db.tbl_Products
                        where g.CaTuoiMoiNgay == true && g.Status == true
                        orderby g.NgayCapNhat descending
                        select g;

            tbl_menu tenmenu = db.tbl_menus.SingleOrDefault(n => n.id == 5);
            Session["TenMenu"] = tenmenu.TenMenu;
            ViewBag.TenSapXep = "Sắp xếp: A đến Z";

            ViewBag.NameSortParm = "Name_desc";
            ViewBag.NameSortParmasc = "Name_asc";
            ViewBag.DateSortParm = "Date_desc";
            ViewBag.PriceSortParm = "Price_desc";
            ViewBag.PriceSortPasc = "Price";
            if (sorting == "Name_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp: Z đến A";
                return View(laysp.OrderByDescending(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Name_asc")
            {
                ViewBag.TenSapXep = "Sắp xếp: A đến Z";
                return View(laysp.OrderBy(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Date_desc")
            {
                ViewBag.TenSapXep = "Sản phẩm mới";
                return View(laysp.OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Price_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Cao Đến Thấp";
                return View(laysp.OrderByDescending(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }

            if (sorting == "Price")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Thấp đến Cao";
                return View(laysp.OrderBy(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }
            return View(laysp.ToPagedList(pageNum, pageSize));
        }

        public ActionResult hienthica2(int? page, string sorting)
        {
            tbl_header hea = db.tbl_headers.SingleOrDefault(n => n.id == 1);
            Session["icon"] = hea.shortcuticon;
            Session["title"] = ViewBag.shoptitle;
            int pageSize = 20;
            int pageNum = (page ?? 1);

            var laysp = from g in db.tbl_Products
                        where g.CaTuoiMoiNgay == true && g.Status == true
                        orderby g.NgayCapNhat descending
                        select g;
            ViewBag.tenmenu = (from s in db.tbl_menus where s.id == 5 select s);
            ViewBag.TenSapXep = "Sắp xếp: A đến Z";

            ViewBag.NameSortParm = "Name_desc";
            ViewBag.NameSortParmasc = "Name_asc";
            ViewBag.DateSortParm = "Date_desc";
            ViewBag.PriceSortParm = "Price_desc";
            ViewBag.PriceSortPasc = "Price";
            if (sorting == "Name_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp: Z đến A";
                return View(laysp.OrderByDescending(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Name_asc")
            {
                ViewBag.TenSapXep = "Sắp xếp: A đến Z";
                return View(laysp.OrderBy(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Date_desc")
            {
                ViewBag.TenSapXep = "Sản phẩm mới";
                return View(laysp.OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Price_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Cao Đến Thấp";
                return View(laysp.OrderByDescending(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }

            if (sorting == "Price")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Thấp đến Cao";
                return View(laysp.OrderBy(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }
            return View(laysp.ToPagedList(pageNum, pageSize));
        }
        public ActionResult hienthica3(int? page, string sorting)
        {
            tbl_header hea = db.tbl_headers.SingleOrDefault(n => n.id == 1);
            Session["icon"] = hea.shortcuticon;

            int pageSize = 20;
            int pageNum = (page ?? 1);

            var laysp = from g in db.tbl_Products
                        where g.CaTuoiMoiNgay == true && g.Status == true
                        orderby g.NgayCapNhat descending
                        select g;
            ViewBag.tenmenu = (from s in db.tbl_menus where s.id == 5 select s);
            ViewBag.TenSapXep = "Sắp xếp: A đến Z";

            ViewBag.NameSortParm = "Name_desc";
            ViewBag.NameSortParmasc = "Name_asc";
            ViewBag.DateSortParm = "Date_desc";
            ViewBag.PriceSortParm = "Price_desc";
            ViewBag.PriceSortPasc = "Price";
            if (sorting == "Name_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp: Z đến A";
                return View(laysp.OrderByDescending(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Name_asc")
            {
                ViewBag.TenSapXep = "Sắp xếp: A đến Z";
                return View(laysp.OrderBy(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Date_desc")
            {
                ViewBag.TenSapXep = "Sản phẩm mới";
                return View(laysp.OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Price_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Cao Đến Thấp";
                return View(laysp.OrderByDescending(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }

            if (sorting == "Price")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Thấp đến Cao";
                return View(laysp.OrderBy(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }
            return View(laysp.ToPagedList(pageNum, pageSize));
        }
        #endregion
        #region Sản phẩm tìm kiếm (Search)
        [HttpGet]
        public ActionResult Search(string txttimkiem, string sorting, int? page)
        {
            tbl_header hea = db.tbl_headers.SingleOrDefault(n => n.id == 1);
            Session["icon"] = hea.shortcuticon;

            int pageNum = (page ?? 1);
            int pageSize = 20;
            string tukhoa = txttimkiem;
            if (String.IsNullOrEmpty(tukhoa))
                tukhoa = "";
            ViewBag.tukhoa = tukhoa;
            Session["timkiem"] = txttimkiem;
            List<tbl_Product> sp = db.tbl_Products.Where(n => n.TenSP.Contains(tukhoa)).ToList();
            ViewBag.TenSapXep = "Sắp xếp: A đến Z";
            ViewBag.NameSortParm = "Name_desc";
            ViewBag.NameSortParmasc = "Name_asc";
            ViewBag.DateSortParm = "Date_desc";
            ViewBag.PriceSortParm = "Price_desc";
            ViewBag.PriceSortPasc = "Price";
            if (sorting == "Name_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp: Z đến A";
                return View(sp.OrderByDescending(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Name_asc")
            {
                ViewBag.TenSapXep = "Sắp xếp: A đến Z";
                return View(sp.OrderBy(n => n.TenSP).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Date_desc")
            {
                ViewBag.TenSapXep = "Sản phẩm mới";
                return View(sp.OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNum, pageSize));
            }
            if (sorting == "Price_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Cao Đến Thấp";
                return View(sp.OrderByDescending(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }

            if (sorting == "Price")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Thấp đến Cao";
                return View(sp.OrderBy(n => n.GiaHienTai).ToPagedList(pageNum, pageSize));
            }
            return View(sp.OrderBy(n => n.TenSP).ToPagedList(pageNum, pageSize));
        }
        #endregion
        #region menutop
        [ChildActionOnly]//Gọi từ View sang Controll
        public ActionResult MenuTop()
        {
            //Lấy ra danh sách Menu
            var MenuTop = (from mn in db.tbl_product_types
                           join s in db.tbl_Products on mn.ID equals s.IDLoaiSP
                           where mn.Status == true && mn.ID == s.IDLoaiSP && s.Status == true
                           select mn).Distinct();


            return PartialView(MenuTop.ToList());
        }
        #endregion
        #region header
        [ChildActionOnly]//Gọi từ View sang Controll
        public ActionResult header()
        {
            //Lấy ra danh sách Menu
            var header = (from mn in db.tbl_headers
                          where mn.id == 1
                          select mn);

            return PartialView(header.Single());
        }
        #endregion
        #region tintuc
        public ActionResult tintuc(int? page)
        {
            int pageNume = (page ?? 1);
            int pageSize = 20;
            var tintuc = (from tt in db.tbl_news
                          where tt.status == true
                          orderby tt.NgayCapNhat descending
                          select tt);

            return View(tintuc.ToPagedList(pageNume, pageSize));
        }
        #endregion
        #region Chi tiết tin (Reader)
        public ActionResult Reader(string id)
        {
            //Lấy ra tin tức từ mã tin truyền vào
            var CT_Tin = (db.tbl_news.First(tt => tt.alias.Equals(id)));

            //Lấy ra 10 tin khác (10 tin trong đó không có tin đang đọc)

            //Bộ đếm lượt xem cho Tin tức
            //CT_Tin.LuotXem += 1;
            //UpdateModel(CT_Tin);
            //db.SubmitChanges();
            ViewBag.Title = CT_Tin.title;
            ViewBag.keyword = CT_Tin.keyword;
            ViewBag.description = CT_Tin.description;

            return View(CT_Tin);
        }

        #endregion
        #region khuyenmai
        public ActionResult khuyenmai(int? page, string sorting)
        {

            int pageNume = (page ?? 1);
            int pageSize = 20;
            var km = (from k in db.tbl_Products
                      where k.Status == true && k.KhuyenMai > 0

                      select k);
            ViewBag.TenSapXep = "Sắp xếp: A đến Z";
            ViewBag.NameSortParm = "Name_desc";
            ViewBag.NameSortParmasc = "Name_asc";
            ViewBag.DateSortParm = "Date_desc";
            ViewBag.PriceSortParm = "Price_desc";
            ViewBag.PriceSortPasc = "Price";
            if (sorting == "Name_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp: Z đến A";
                return View(km.OrderByDescending(n => n.TenSP).ToPagedList(pageNume, pageSize));
            }
            if (sorting == "Name_asc")
            {
                ViewBag.TenSapXep = "Sắp xếp: A đến Z";
                return View(km.OrderBy(n => n.TenSP).ToPagedList(pageNume, pageSize));
            }
            if (sorting == "Date_desc")
            {
                ViewBag.TenSapXep = "Sản phẩm mới";
                return View(km.OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNume, pageSize));
            }
            if (sorting == "Price_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Cao Đến Thấp";
                return View(km.OrderByDescending(n => n.GiaHienTai).ToPagedList(pageNume, pageSize));
            }

            if (sorting == "Price")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Thấp đến Cao";
                return View(km.OrderBy(n => n.GiaHienTai).ToPagedList(pageNume, pageSize));
            }

            return View(km.ToPagedList(pageNume, pageSize));
        }
        public ActionResult khuyenmai1(int? page, string sorting)
        {

            int pageNume = (page ?? 1);
            int pageSize = 20;
            var km = (from k in db.tbl_Products
                      where k.Status == true && k.KhuyenMai > 0

                      select k);
            ViewBag.TenSapXep = "Sắp xếp: A đến Z";
            ViewBag.NameSortParm = "Name_desc";
            ViewBag.NameSortParmasc = "Name_asc";
            ViewBag.DateSortParm = "Date_desc";
            ViewBag.PriceSortParm = "Price_desc";
            ViewBag.PriceSortPasc = "Price";
            if (sorting == "Name_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp: Z đến A";
                return View(km.OrderByDescending(n => n.TenSP).ToPagedList(pageNume, pageSize));
            }
            if (sorting == "Name_asc")
            {
                ViewBag.TenSapXep = "Sắp xếp: A đến Z";
                return View(km.OrderBy(n => n.TenSP).ToPagedList(pageNume, pageSize));
            }
            if (sorting == "Date_desc")
            {
                ViewBag.TenSapXep = "Sản phẩm mới";
                return View(km.OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNume, pageSize));
            }
            if (sorting == "Price_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Cao Đến Thấp";
                return View(km.OrderByDescending(n => n.GiaHienTai).ToPagedList(pageNume, pageSize));
            }

            if (sorting == "Price")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Thấp đến Cao";
                return View(km.OrderBy(n => n.GiaHienTai).ToPagedList(pageNume, pageSize));
            }

            return View(km.ToPagedList(pageNume, pageSize));
        }
        public ActionResult khuyenmai2(int? page, string sorting)
        {

            int pageNume = (page ?? 1);
            int pageSize = 20;
            var km = (from k in db.tbl_Products
                      where k.Status == true && k.KhuyenMai > 0
                      select k);
            ViewBag.TenSapXep = "Sắp xếp: A đến Z";
            ViewBag.NameSortParm = "Name_desc";
            ViewBag.NameSortParmasc = "Name_asc";
            ViewBag.DateSortParm = "Date_desc";
            ViewBag.PriceSortParm = "Price_desc";
            ViewBag.PriceSortPasc = "Price";
            if (sorting == "Name_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp: Z đến A";
                return View(km.OrderByDescending(n => n.TenSP).ToPagedList(pageNume, pageSize));
            }
            if (sorting == "Name_asc")
            {
                ViewBag.TenSapXep = "Sắp xếp: A đến Z";
                return View(km.OrderBy(n => n.TenSP).ToPagedList(pageNume, pageSize));
            }
            if (sorting == "Date_desc")
            {
                ViewBag.TenSapXep = "Sản phẩm mới";
                return View(km.OrderByDescending(n => n.NgayCapNhat).ToPagedList(pageNume, pageSize));
            }
            if (sorting == "Price_desc")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Cao Đến Thấp";
                return View(km.OrderByDescending(n => n.GiaHienTai).ToPagedList(pageNume, pageSize));
            }

            if (sorting == "Price")
            {
                ViewBag.TenSapXep = "Sắp xếp Giá: Thấp đến Cao";
                return View(km.OrderBy(n => n.GiaHienTai).ToPagedList(pageNume, pageSize));
            }

            return View(km.ToPagedList(pageNume, pageSize));
        }
        #endregion
        #region footer
        [ChildActionOnly]
        public ActionResult footer()
        {
            var footer = from mn in db.tbl_shops
                         where mn.id == 1
                         select mn;
            return PartialView(footer.Single());
        }

        #endregion
        #region menubottom
        [ChildActionOnly]//Gọi từ View sang Controll
        public ActionResult MenuBottom()
        {
            //Lấy ra danh sách Menu
            var menu = (from mn in db.tbl_informations
                        where mn.Status == true

                        select mn).ToList();
            return PartialView(menu);
        }
        #endregion

        #region information
        public ActionResult infomation(string id)
        {
            tbl_information inf = db.tbl_informations.SingleOrDefault(n => n.alias.Equals(id) && n.Status == true);
            Session["tenmuinfo"] = inf.TenTT;
            return View(inf);
        }
        public ActionResult menuinfo()
        {
            var info = from i in db.tbl_informations
                       where i.Status == true
                       select i;
            return PartialView(info);
        }
        #endregion
    }
}