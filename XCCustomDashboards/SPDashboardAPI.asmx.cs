using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace XCCustomDashboards
{
    /// <summary>
    /// Summary description for SPDashboardAPI
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class SPDashboardAPI : System.Web.Services.WebService
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

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public void ServerProcessorState()
        {
            //SessionTest();
            var dT = info.getDSRO(@"
            select * from ( select top(1) ServerName,ServerTime,Convert(int,Value) Value from pm_SystemPerformance where ServerName = 'LHE-SSO-FE1' and CategoryName = 'Processor' order by ServerTime desc ) A
            union all
            select * from ( select top(1) ServerName,ServerTime,Convert(int,Value) Value  from pm_SystemPerformance where ServerName = 'LHE-SSO-FE2' and CategoryName = 'Processor' order by ServerTime desc ) A
            union all
            select * from ( select top(1) ServerName,ServerTime,Convert(int,Value) Value from pm_SystemPerformance where ServerName = 'ISB-SSO-FE1' and CategoryName = 'Processor' order by ServerTime desc ) A
            union all
            select * from ( select top(1) ServerName,ServerTime,Convert(int,Value) Value  from pm_SystemPerformance where ServerName = 'ISB-SSO-FE2' and CategoryName = 'Processor' order by ServerTime desc ) A").Tables[0];
            Context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(dT));
        }



        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public void ServerMemoryState()
        {
            //SessionTest();
            var dT = info.getDSRO(@"
            select * from ( select top(1) ServerName, ServerTime , Convert(int,((16384-Value)/16384)*100) Value from pm_SystemPerformance where ServerName = 'LHE-SSO-FE1' and  CategoryName like 'Memory' and CounterName ='Available MBytes' order by ServerTime desc ) A
            union all
            select * from ( select top(1) ServerName, ServerTime , Convert(int,((16384-Value)/16384)*100) Value from pm_SystemPerformance where ServerName = 'LHE-SSO-FE2' and  CategoryName like 'Memory' and CounterName ='Available MBytes' order by ServerTime desc ) A
            union all
            select * from ( select top(1) ServerName, ServerTime , Convert(int,((16384-Value)/16384)*100) Value from pm_SystemPerformance where ServerName = 'ISB-SSO-FE1' and  CategoryName like 'Memory' and CounterName ='Available MBytes' order by ServerTime desc ) A
            union all
            select * from ( select top(1) ServerName, ServerTime , Convert(int,((16384-Value)/16384)*100) Value from pm_SystemPerformance where ServerName = 'ISB-SSO-FE2' and  CategoryName like 'Memory' and CounterName ='Available MBytes' order by ServerTime desc ) A
            ").Tables[0];
            Context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(dT));
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public void GetInnerServicesWorkingSet()
        {
            var dT = info.getDSRO(@"
                select * from (select top(100) ServerName,InstanceName,Convert(int,Value/1024/1024) Value from pm_SystemPerformance where ServerName = 'LHE-SSO-FE1' and CategoryName = 'Process' and Value is not null and ServerTime > DATEADD(SECOND,-10,GETDATE()) order by InstanceName) A
                union all
                select * from (select top(100) ServerName,InstanceName,Convert(int,Value/1024/1024) Value  from pm_SystemPerformance where ServerName = 'LHE-SSO-FE2' and CategoryName = 'Process' and Value is not null and ServerTime > DATEADD(SECOND,-10,GETDATE()) order by InstanceName) A
                union all
                select * from (select top(100) ServerName,InstanceName,Convert(int,Value/1024/1024) Value  from pm_SystemPerformance where ServerName = 'ISB-SSO-FE1' and CategoryName = 'Process' and Value is not null and ServerTime > DATEADD(SECOND,-10,GETDATE()) order by InstanceName)A
                union all
                select * from (select top(100) ServerName,InstanceName,Convert(int,Value/1024/1024) Value from pm_SystemPerformance where ServerName = 'ISB-SSO-FE2' and CategoryName = 'Process' and Value is not null and ServerTime > DATEADD(SECOND,-10,GETDATE()) order by InstanceName)A
            ").Tables[0];
            Context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(dT));
        }



        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public void WebWorkerJS(string Interval)
        {
            Context.Response.Write(@"
                var i = 0;
                function timedCount() {
                    i = i + 1;
                    postMessage(i);
                    setTimeout('timedCount()'," + Interval + @");
                }
                timedCount();
            ");
        }

    }
}
