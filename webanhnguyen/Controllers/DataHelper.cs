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

        }
    }
}