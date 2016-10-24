using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webanhnguyen.Models;

namespace webanhnguyen.Controllers
{
    public class HomeController : Controller
    {
        databaseDataContext db = new databaseDataContext();
        public ActionResult Index()
        {
            tbl_header hea = db.tbl_headers.SingleOrDefault(n => n.id == 1);
            Session["title"] = hea.tittle;
            Session["icon"] = hea.shortcuticon;
            return View();
        }
        #region sản phẩm hot
        [ChildActionOnly]
        public ActionResult Hot_Product()
        {
            var SP_hot = (from sp in db.tbl_Products
                                   where sp.Status == true
                                   orderby sp.SLDaBan descending
                                   select sp).Skip(0).Take(8).ToList();
            return PartialView(SP_hot);
        }
        #endregion
        #region sản phẩm tươi sống
        [ChildActionOnly]
        public ActionResult HaiSanTuoiSong()
        {
           var TuoiSong = (from sp in db.tbl_Products
                                where sp.Status == true && sp.IDLoaiSP == 1
                                select sp).Skip(0).Take(12).ToList();
            return PartialView(TuoiSong);
        }
        #endregion
        #region sản phẩm đông lạnh
        [ChildActionOnly]
        public ActionResult HaiSanDongLanh()
        {
            var dong = (from sp in db.tbl_Products
                        where sp.Status == true && sp.IDLoaiSP == 2
                        select sp).Skip(0).Take(12).ToList();
            return PartialView(dong);
        }
        #endregion
        #region sản phẩm khô
        [ChildActionOnly]
        public ActionResult HaiSanKho()
        {
             var Kho = (from sp in db.tbl_Products
                           where sp.Status == true && sp.IDLoaiSP == 3
                           select sp).Skip(0).Take(12).ToList();
            return PartialView(Kho);
        }
        #endregion
        #region món ăn mỗi ngày
        [ChildActionOnly]
        public ActionResult monanmoingay()
        {   ViewBag.tinmoinhat = (from sp in db.tbl_news
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
        public ActionResult Details(int id)
        {
            var CT_SP = (db.tbl_Products.First(sp => sp.ID == id));
            int loai = int.Parse(CT_SP.IDLoaiSP.ToString());
            ViewBag.TenLoai = (from s in db.tbl_Products
                               from l in db.tbl_product_types
                               where s.ID == id && s.IDLoaiSP == l.ID && s.Status == true
                               select l);
            ViewBag.SP_cungloai = (from s in db.tbl_Products
                                   where s.ID != id && s.IDLoaiSP == loai && s.Status == true 
                                   select s).Skip(0).Take(4).ToList();
            ViewBag.SP_khac = (from s in db.tbl_Products
                                   where s.ID != id && s.IDLoaiSP != loai && s.Status == true
                                   select s).Skip(0).Take(4).ToList();
            CT_SP.LuotXem += 1;
            UpdateModel(CT_SP);
            db.SubmitChanges();
            return View(CT_SP);
        }
        #endregion
        #region sản phẩm theo loại
        public ActionResult ProductType(int id, string sortOrder)
        {

            var laysp = from g in db.tbl_Products
                         from h in db.tbl_product_types 
                        where h.ID == id && g.IDLoaiSP == id &&g.Status == true && h.Status == true
                         select g;
            
            Session["loai"] = id;
          
            ViewBag.NameSortDesc = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            switch (sortOrder)
            {
                case "name_desc":
                    laysp = laysp.OrderByDescending(s => s.TenSP);
                    break;
               
               
            }
            ViewBag.TenLoai = (from l in db.tbl_product_types
                               where l.ID == id
                               select l);
                        return View(laysp.ToList());
        }

        
        public ActionResult hienthi2(int id, string sortOrder)
        {
          
            var laysp = from g in db.tbl_Products
                         from h in db.tbl_product_types
                         where g.ID == id && g.Status == true && h.Status == true
                                                  select g;
            ViewBag.TenLoai = (from l in db.tbl_product_types
                               where l.ID == id
                               select l);
            Session["loai"] = id;
            return View(laysp.ToList());       
    }
        public ActionResult hienthi3(int id, string sortOrder)
        {
            var laysp = from g in db.tbl_Products
                         from h in db.tbl_product_types
                         where g.ID == id && g.Status == true && h.Status == true
                         select g;
            ViewBag.TenLoai = (from l in db.tbl_product_types
                               where l.ID == id
                               select l);
            Session["loai"] = id;
            return View(laysp.ToList());
        }
        #endregion

        #region sản phẩm theo loại
        public ActionResult Laycatuoi()
        {
            var laysp = (from g in db.tbl_Products
                         orderby g.NgayCapNhat descending
                         select g).ToList();
            ViewBag.tenmenu = (from s in db.tbl_menus where s.id == 5  select s.TenMenu);
            tbl_menu tenmenu = db.tbl_menus.SingleOrDefault(n => n.id == 5);
            Session["TenMenu"] = tenmenu.TenMenu;
            return View(laysp);
        }
        
        public ActionResult hienthica2()
        {
            var laysp = (from g in db.tbl_Products
                         orderby g.NgayCapNhat descending
                         select g).ToList();
            ViewBag.tenmenu = (from s in db.tbl_menus where s.id == 5 select s);
            return View(laysp);
        }
        public ActionResult hienthica3()
        {
            var laysp = (from g in db.tbl_Products
                         orderby g.NgayCapNhat descending
                         select g).ToList();
            ViewBag.tenmenu = (from s in db.tbl_menus where s.id == 5 select s);
            return View(laysp);
        }
        #endregion
        #region Sản phẩm tìm kiếm (Search)
        public ActionResult Search(string searchString)
        {
            //Lấy ra danh sách sản phẩm từ chuỗi tìm kiếm truyền vào
            var SP_TK = (from sp in db.tbl_Products
                         where (sp.Status == true) && (sp.TenSP.Contains(searchString)) 
                         orderby sp.GiaHienTai descending                                         
                         select sp).ToList();

           
            ViewBag.TuKhoa = searchString;

            return View(SP_TK);
        }
        #endregion
        #region menutop
        [ChildActionOnly]//Gọi từ View sang Controll
        public ActionResult MenuTop()
        {
            //Lấy ra danh sách Menu
            var MenuTop = (from mn in db.tbl_menus
                              orderby mn.ThuTu
                              select mn).ToList();
            return PartialView(MenuTop);
        }
        #endregion
        #region header
        [ChildActionOnly]//Gọi từ View sang Controll
        public ActionResult header()
        {
            //Lấy ra danh sách Menu
            var header = (from mn in db.tbl_headers where mn.id == 1
                           select mn).ToList();
           
            return PartialView(header);
        }
        #endregion
        #region tintuc
        public ActionResult tintuc()
        {
            var tintuc = (from tt in db.tbl_news
                     where tt.status == true
                     orderby tt.NgayCapNhat descending
                     select tt);
            return View(tintuc);
        }
        #endregion
        #region Chi tiết tin (Reader)
        public ActionResult Reader(int id)
        {
            //Lấy ra tin tức từ mã tin truyền vào
            var CT_Tin = (db.tbl_news.First(tt => tt.id == id));

            //Lấy ra 10 tin khác (10 tin trong đó không có tin đang đọc)
           
            //Bộ đếm lượt xem cho Tin tức
            CT_Tin.LuotXem += 1;
            UpdateModel(CT_Tin);
            db.SubmitChanges();

            return View(CT_Tin);
        }

        #endregion
        #region khuyenmai
        public ActionResult khuyenmai()
        {
            var km = (from k in db.tbl_Products
                          where k.Status == true && k.KhuyenMai > 0
                        
                          select k).ToList();
            return View(km);
        }
        public ActionResult khuyenmai1()
        {
            var km = (from k in db.tbl_Products
                      where k.Status == true && k.KhuyenMai > 0
                     
                      select k).ToList();
            return View(km);
        }
        public ActionResult khuyenmai2()
        {
            var km = (from k in db.tbl_Products
                      where k.Status == true && k.KhuyenMai > 0
                      select k).ToList();
            return View(km);
        }
        #endregion
    }
}