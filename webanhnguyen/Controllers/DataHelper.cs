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
    }
}