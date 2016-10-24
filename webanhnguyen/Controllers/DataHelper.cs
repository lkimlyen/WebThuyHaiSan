using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace webanhnguyen.Controllers
{
    public class DataHelper
    {
        //Helper classes
        public class GeneralHelper
        {
            static GeneralHelper instance;
            public static GeneralHelper getInstance()
            {
                if (instance == null)
                {
                    instance = new GeneralHelper();
                }
                return instance;
            }
        }
        
        public class NewsHelper
        {
            static NewsHelper instance;
            public static NewsHelper getInstance()
            {
                if (instance == null)
                {
                    instance = new NewsHelper();
                }
                return instance;
            }

            public void deleteAllNews(Models.databaseDataContext data)
            {
                data.tbl_news.DeleteAllOnSubmit(data.tbl_news);
                data.SubmitChanges();

            }
            public int getNewsAmount(Models.databaseDataContext data)
            {
                return data.tbl_news.Count();
            }

            public Models.tbl_new getNewsById(Models.databaseDataContext data, int id)
            {
                Models.tbl_new result = data.tbl_news.Where(n => n.id == id).Single();
                return result;
            }
        }

        public class ProductHelper
        {
            static ProductHelper instance;
            public static ProductHelper getInstance()
            {
                if (instance == null)
                {
                    instance = new ProductHelper();
                }
                return instance;
            }

            public void deleteAllProductCategory(Models.databaseDataContext data)
            {
                deleteAllProduct(data);

                data.tbl_product_types.DeleteAllOnSubmit(data.tbl_product_types);
                data.SubmitChanges();
            }

            public void deleteAllProduct(Models.databaseDataContext data)
            {
                //ShoppingCardHelper.getInstance().deleteAllOrderDetails(data);

                data.tbl_Products.DeleteAllOnSubmit(data.tbl_Products);
                data.SubmitChanges();
            }

            public int getProductsAmount(Models.databaseDataContext data)
            {
                return data.tbl_Products.Count();
            }

            public int getProductCategoryAmount(Models.databaseDataContext data)
            {
                return data.tbl_product_types.Count();
            }


            public Models.tbl_Product getProductById(Models.databaseDataContext data, int id)
            {
                Models.tbl_Product result = data.tbl_Products.Where(n => n.ID == id).Single();
                return result;
            }

            public Models.tbl_product_type getProductCategoryById(Models.databaseDataContext data, int id)
            {
                Models.tbl_product_type result = data.tbl_product_types.Where(n => n.ID == id).Single();
                return result;
            }

            public List<Models.tbl_Product> getListAllProducts(Models.databaseDataContext data)
            {
                return data.tbl_Products.OrderByDescending(a => a.NgayCapNhat).ToList();
            }

            public List<Models.tbl_Product> getListProductsByCategory(Models.databaseDataContext data, int idProductType)
            {
                return data.tbl_Products.OrderByDescending(a => a.NgayCapNhat).Where(n => n.IDLoaiSP == idProductType).ToList();
            }

            public List<Models.tbl_Product> getListOtherProductsByCategory(Models.databaseDataContext data, int id, int idProductType)
            {
                return data.tbl_Products.OrderByDescending(a => a.NgayCapNhat).Where(n => n.IDLoaiSP == idProductType && n.ID != id).ToList();
            }
        }

        public class AccountHelper
        {
            static AccountHelper instance;
            public static AccountHelper getInstance()
            {
                if (instance == null)
                {
                    instance = new AccountHelper();
                }
                return instance;
            }

            public bool loginAdmin(Models.databaseDataContext data, string username, string password)
            {
                return checkThisAdminAccountExist(data, username, password);
            }

            public int getMemberAccountAmount(Models.databaseDataContext data)
            {
                return data.Customers.Count();
            }

            public bool checkThisAdminAccountExist(Models.databaseDataContext data, string username, string password)
            {
                var result = data.tbl_admins.Where(a => a.Username.Equals(username) && a.Password == password);
                if (result.Count() > 0)
                {
                    return true;
                }
                return false;
            }

            public bool checkIsAdminLoggingIn(HttpContextBase context)
            {
                Object session = context.Session[Constants.KEY_SESSION_ADMIN_USERNAME];
                if (session != null && !String.IsNullOrEmpty(session.ToString()))
                {
                    return true;
                }
                return false;
            }

            public void logoutAdmin(BaseAdminController context)
            {
                context.Session[Constants.KEY_SESSION_ADMIN_USERNAME] = null;
            }

            public void deleteAllMembers(Models.databaseDataContext data)
            {
                data.Customers.DeleteAllOnSubmit(data.Customers);
                data.SubmitChanges();
            }
        }
    }
}