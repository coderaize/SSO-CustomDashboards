using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XCCustomDashboards
{
    public partial class StatDashboard : System.Web.UI.Page
    {
        public DataTable SeverityActiveStore { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            SeverityActiveStore = info.getDSRO(@"
                SELECT  COUNT(*) from [dBThornBed].[dbo].[ActiveStore] Where Severity = 'Critical'
                UNION ALL
                SELECT  COUNT(*) from [dBThornBed].[dbo].[ActiveStore] Where Severity = 'Major'
                UNION ALL
                SELECT  COUNT(*) from [dBThornBed].[dbo].[ActiveStore] Where Severity = 'Minor'
            ").Tables[0];


        }
    }
}