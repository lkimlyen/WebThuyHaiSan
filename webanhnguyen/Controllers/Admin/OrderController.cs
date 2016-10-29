using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using webanhnguyen.Models;
using System.IO;

namespace webanhnguyen.Controllers.Admin
{
    public class OrderController : BaseAdminController
    {
        // GET: Order
        public List<OrderDetail> getListOrderDetailById(int id)
        {
            return data.OrderDetails.OrderByDescending(a => a.id).Where(n => n.iddh == id).ToList();
        }

        private List<Order> getOrder(int count)
        {
            return getOrder(count, null);
        }
        private List<Order> getAllOrder()
        {
            return getOrder(-1, null);
        }
        private Order getOneOrder(int id)
        {
            var item = from ic in data.Orders
                       where ic.id == id
                       select ic;
            if (item == null)
            {
                return new Order();
            }
            return item.Single();
        }
        private OrderDetail getOneOrderDetail(int id)
        {
            var item = from ic in data.OrderDetails
                       where ic.id == id
                       select ic;
            if (item == null)
            {
                return new OrderDetail();
            }
            return item.Single();
        }

        public ActionResult OrderSetStatusEnable(int id)
        {
            Order tic = getOneOrder(id);
            tic.status = !tic.status;
            UpdateModel(tic);
            data.SubmitChanges();
            return RedirectToAction("OrderView");
        }
        private List<Order> getOrder(int count, String keyword)
        {
            if (!String.IsNullOrEmpty(keyword))
            {
                var result = data.Orders.Where(a => a.gmail.Contains(keyword)).OrderByDescending(a => a.thoidiemdathang);
                if (count != -1)
                    result.Take(count);
                return result.ToList();
            }
            else
            {
                var result = data.Orders.OrderByDescending(a => a.thoidiemdathang);
                if (count != -1)
                    result.Take(count);
                return result.ToList();
            }
        }

        /*
         * 
         * 
         * 
         */
        public ActionResult Index()
        {
            return OrderView();
        }

        [HttpGet]
        public ActionResult OrderDetail(int id)
        {
            var listOrderDetail = getListOrderDetailById(id);
            return View(URLHelper.URL_ADMIN_ORDER_DETAIL, DataHelper.ShoppingCardHelper.getInstance().getListShoppingCardItemModelFromListOrderDetails(data, listOrderDetail));
        }

        [HttpPost]
        public ActionResult OrderDetail(int id, String btnDel)
        {
            if (String.IsNullOrEmpty(btnDel))
            {
                //Delete all
                DataHelper.ShoppingCardHelper.getInstance().deleteAllOrderDetails(data);
            }

            var listOrderDetail = getListOrderDetailById(id);
            return View(URLHelper.URL_ADMIN_ORDER_DETAIL, listOrderDetail);
        }

        /*
         * 
         * 
         * 
         */
        [HttpGet]
        public ActionResult OrderView()
        {
            var listOrder = getOrder(10);
            return View(URLHelper.URL_ADMIN_ORDER, listOrder);
        }
        [HttpPost]
        public ActionResult OrderView(FormCollection form, String btnDel)
        {
            if (btnDel != null)
            {
                //Delete all
                DataHelper.ShoppingCardHelper.getInstance().deleteAllOrders(data);

            }
            var keyword = form["keyword"];
            var listOrder = getOrder(10, keyword);
            return View(URLHelper.URL_ADMIN_ORDER, listOrder);
        }

        /*
         * 
         * 
         * 
         */
        public ActionResult OrderDelete(String id)
        {
            if (String.IsNullOrEmpty(id))
            {
                ViewBag.AlertError = "Không xoá được!";
            }
            else
            {
                try
                {
                    data.Orders.DeleteOnSubmit(getOneOrder(Int32.Parse(id)));
                    data.SubmitChanges();
                    ViewBag.AlertSuccess = "Xoá thành công!";
                }
                catch (Exception e)
                {
                    ViewBag.AlertError = "Không xoá được";
                }
            }
            return OrderView();
        }

        public ActionResult OrderDetailDelete(String id, int idorder)
        {
            if (String.IsNullOrEmpty(id))
            {
                ViewBag.AlertError = "Không xoá được!";
            }
            else
            {
                try
                {
                    data.OrderDetails.DeleteOnSubmit(getOneOrderDetail(Int32.Parse(id)));
                    data.SubmitChanges();
                    ViewBag.AlertSuccess = "Xoá thành công!";
                }
                catch (Exception e)
                {
                    ViewBag.AlertError = "Không xoá được";
                }
            }
            return OrderDetail(idorder);
        }
    }
}