using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace XCCustomDashboards
{
    /// <summary>
    /// Summary description for StatDashboardAPI
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class StatDashboardAPI : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        public void SessionTest()
        {
            if (Session["UserName"] == null)
            {
                Context.Response.Write("HaHa! Please Login ;-}");
                Context.Response.End();
            }
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void AddClient()
        {
            SessionTest();
            try
            {
                
            }
            catch (Exception t) { Context.Response.Write(t.Message + "\n\n" + t.StackTrace); }
        }



    }
}
