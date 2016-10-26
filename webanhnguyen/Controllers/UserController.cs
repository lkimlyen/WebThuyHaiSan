using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webanhnguyen.Models;
using System.IO;
namespace webanhnguyen.Controllers
{
    public class UserController : Controller
    {
        databaseDataContext db = new databaseDataContext();
        // GET: User

        public ActionResult Index()
        {
            return View();
        }
        #region Tài khoản (Login - SuccessLogin - Logout - Account - ChangePassword - Register - SuccessRegister)
        #region Đăng nhập (Login)
        [HttpGet]
    
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
       
        public ActionResult Login(FormCollection collection)
        {
                try
                {
                    //Lấy giá trị ở Form Login
                    var _Email = collection["email"];
                    var _Password = collection["password"];
                Customer kh = db.Customers.SingleOrDefault(n => n.email == _Email && n.password == _Password);
                //Tạo biến _UserLogin để kiểm tra tài khoản đăng nhập có trong CSDL không
               // var _UserLogin = db.Customers.SingleOrDefault(k => k.email == _Email && k.password == _Password);
                    if (ModelState.IsValid && kh != null)
                    {
                    if (kh.status == true)//không bị lock tài khoản
                    {
                        Session["ID"] = kh.id;
                        //Lưu các thông tin vào Session
                        Session["Email"] = kh;
                        Session["emailstring"] = kh.email;
                        if (Session["Giohang"] == null)
                        {//Chuyển đến trang thông báo Login thành công (Ở đây không dùng được RedirectToAction vì [ChildActionOnly])
                            return Content("<script>alert('Đăng nhập thành công!');window.location='/Home/Index';</script>");
                        }
                        else
                            return Content("<script>alert('Đăng nhập thành công!');window.location='/ShoppingCart/GioHang';</script>");
                    }
                    
                        else
                            return Content("<script>alert('Tài khoản của bạn đã bị khóa. Vui lòng liên hệ ban quản trị!');window.location='/User/Login';</script>");
                    }
                    else
                        return Content("<script>alert('Tên đăng nhập hoặc mật khẩu không đúng!');window.location='/User/Login';</script>");
                }
                catch
                {
                    return Content("<script>alert('Đăng nhập thất bại!');window.location='/User/Login';</script>");
                }
        }

        #endregion
        [HttpGet]
        [ChildActionOnly]
        public ActionResult plogin()
        {
            return PartialView();
        }

        [HttpPost]
        [ChildActionOnly]
        public ActionResult plogin(FormCollection collection)
        {
            
                try
                {
                //Lấy giá trị ở Form Login

                var _Email = collection["email"];
                var _Password = collection["password"];
                Customer kh = db.Customers.SingleOrDefault(n => n.email == _Email && n.password == _Password);
                //Tạo biến _UserLogin để kiểm tra tài khoản đăng nhập có trong CSDL không
                // var _UserLogin = db.Customers.SingleOrDefault(k => k.email == _Email && k.password == _Password);
                if (ModelState.IsValid && kh != null)
                {
                    if (kh.status == true)//không bị lock tài khoản
                    {
                        Session["ID"] = kh.id;
                        //Lưu các thông tin vào Session
                        Session["Email"] = kh;
                        Session["emailstring"] = kh.email;
                        if (Session["Giohang"] == null)
                            {//Chuyển đến trang thông báo Login thành công (Ở đây không dùng được RedirectToAction vì [ChildActionOnly])
                            return Content("<script>window.location='/Home/Index';</script>");
                        }
                            else
                            return Content("<script>window.location='/ShoppingCart/GioHang';</script>");
                    }
                        else
                            return Content("<script>alert('Tài khoản của bạn đã bị khóa. Vui lòng liên hệ ban quản trị!');window.location='/User/Login';</script>");
                    }
                    else
                        return Content("<script>alert('Tên đăng nhập hoặc mật khẩu không đúng!');window.location='/User/Login';</script>");
                }
                catch
                {
                    return Content("<script>alert('Đăng nhập thất bại!');window.location='/User/Login';</script>");
                }
            
                return PartialView();
        }

     

        #region Đăng xuất (Logout)
        public ActionResult Logout()
        {
            Session.RemoveAll();
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
        #endregion

        
        #region Thay đổi thông tin cá nhân (ProfileUpdate)
        public ActionResult ProfileUpdate()
        {
            if (Session["Email"] == null)
                return RedirectToAction("Index");
            int _MaKH = int.Parse(Session["ID"].ToString());
            var kh = db.Customers.SingleOrDefault(k => k.id == _MaKH);
            return View(kh);
        }

        [HttpPost]
        public ActionResult ProfileUpdate(FormCollection collection)
        {
            
            try
            {
                  
                //Lấy giá trị ở Form ChangePassword
                string _Email = collection["email"];
                string _PassNew = collection["password1"];
                string _RePassNew = collection["password2"];
                string _Name = collection["name"];
                string _SDT = collection["phone"];
                string _Address = collection["address"];
                string _State = collection["state"];
                string _BillingName = collection["billingname"];
                string _BillingPhone = collection["billingphone"];
                string _BillingAddress = collection["billingaddress"];
                string _BillingState = collection["billingstate"];
                int _MaKH = int.Parse(Session["ID"].ToString());
                var kh = db.Customers.SingleOrDefault(k => k.id == _MaKH);
                if (collection["ship_to_another"] == "1")
                {
                    kh.name = _Name;
                    kh.moblie = _SDT;
                    kh.address = _Address;
                    kh.state = _State;
                    kh.password = _PassNew;
                    kh.billingname = _BillingName;
                    kh.billingphone = _BillingPhone;
                    kh.billingaddress = _BillingAddress;
                    kh.billingstate = _BillingState;
                }
                else
                {
                    kh.name = _Name;
                    kh.moblie = _SDT;
                    kh.address = _Address;
                    kh.state = _State;
                    kh.password = _PassNew;
                    kh.billingname = _Name;
                    kh.billingphone = _SDT;
                    kh.billingaddress = _Address;
                    kh.billingstate = _State;
                }
                UpdateModel(kh);
                db.SubmitChanges();
                return Content("<script>alert('Cập nhật thành công!');window.location='/User/ProfileUpdate';</script>");
            }
            catch
            {
                return Content("<script>alert('Thao tác đổi mật khẩu thất bại!');window.location='/User/ProfileUpdate';</script>");
            }
        }
        #endregion

        #region Đăng ký (Register)
        public ActionResult Register()
        {
            //Đã Đăng Nhập thì không cho vào Form Đăng Ký
            if (Session["Email"] != null)
                return RedirectToAction("Index");
            return View();
        }

        [HttpPost]
        public ActionResult Register(FormCollection collection, Customer kh)
        {

            try
            {
                //Lấy giá trị ở Form Register         
                string _Email = collection["email1"];
                if(String.IsNullOrEmpty(_Email))
                {
                    return View();
                }
                string _Password = collection["password1"];
                string _RePassword = collection["password2"];
                //Kiểm tra xem tài khoản đã có người sử dụng chưa?
                var _CheckUser = db.Customers.FirstOrDefault(k => k.email == _Email);
                if (_CheckUser != null)
                    return Content("<script>alert('Email đã có người sử dụng!');window.location='/User/Register';</script>");
                else
                    kh.email = _Email;

                //Kiểm tra Mật khẩu nhập lại có giống Mật khẩu đăng ký không?
                    kh.password = _Password;
                kh.date_added = DateTime.Now;
                //Khai báo _FileUpload ở <input type="file" id="_FileUpload" name="_FileUpload" /> trên Form Register
                kh.status = true;//Mặc định cho tài khoản là Hiện

                //Thực hiện thêm mới
                db.Customers.InsertOnSubmit(kh);
                db.SubmitChanges();

                //Lưu thông tin khách hàng vừa đăng ký vào Session để tự động đăng nhập
                Session.Add("ID", kh.id);
                Session.Add("Email", _Email);
                return RedirectToAction("SuccessRegister");
            }
            catch
            {
                return Content("<script>alert('Đăng ký thất bại!');window.location='/User/Register';</script>");
            }
        }
        #endregion

        #region Đăng ký thành công (SuccessRegister)
        public ActionResult SuccessRegister()
        {
            //Ở đây khi đăng ký thành công thì sẽ lưu thông tin tài khoản vào Session => chưa có thì về trang chủ
            if (Session["Email"] == null)
                return RedirectToAction("Index");

            return View();
        }
        #endregion
        #region quên mật khẩu (RecoverPassword)
        public ActionResult RecoverPassword()
        {
            //Ở đây khi đăng ký thành công thì sẽ lưu thông tin tài khoản vào Session => chưa có thì về trang chủ
            if (Session["Email"] == null)
                return RedirectToAction("Index");
            return View();
        }
        #endregion
        #region Đơn hàng
        public ActionResult Order()
        {
            if (Session["Email"] == null)
                return RedirectToAction("Login");
            int _MaKH = int.Parse(Session["ID"].ToString());
            var donhang = (from d in db.Orders
                           where d.idkh == _MaKH
                           select d).ToList();
            return View(donhang);
        }
        #endregion
        #region Đổi trả hàng
        public ActionResult Returns()
        {
            return View();
        }
        #endregion
        #region chi tiết đơn hàng
        public ActionResult OrderDetail(int id)
        {

            var CT_SP = from c in db.OrderDetails
                        from d in db.Orders
                        where c.iddh == d.id
                        select c;
            return View(CT_SP.Single());
        }
        #endregion
        #endregion

    }
}