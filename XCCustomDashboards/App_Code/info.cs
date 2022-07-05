using System.Collections;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

namespace XCCustomDashboards
{
    public class info
    {
        static string dBDashConnectionString => ConfigurationManager.ConnectionStrings["dBThornBedConString"].ConnectionString;
        static string dBDashConnectionStringRO => ConfigurationManager.ConnectionStrings["dBThornBedConString"].ConnectionString;


        public static DataSet getDS(string sel, Hashtable hT = null)
        {
            var sqlDS = new SqlDataSource();
            sqlDS.ConnectionString = dBDashConnectionString;
            sqlDS.Selecting += (object sender, SqlDataSourceSelectingEventArgs e) => e.Command.CommandTimeout = 120;
            sqlDS.SelectCommand = sel;
            if (!(hT == null))
            {
                foreach (string x in hT.Keys)
                    sqlDS.SelectParameters.Add(x, hT[x].ToString());
            }
            sqlDS.CancelSelectOnNullParameter = false;
            DataView dV = (DataView)sqlDS.Select(System.Web.UI.DataSourceSelectArguments.Empty);
            if (!(dV == null))
                return dV.Table.DataSet;
            else
                return null;
        }

        public static DataSet getDSRO(string sel, Hashtable hT = null)
        {
            var sqlDS = new SqlDataSource();
            sqlDS.ConnectionString = dBDashConnectionStringRO;
            sqlDS.Selecting += (object sender, SqlDataSourceSelectingEventArgs e) => e.Command.CommandTimeout = 120;
            sqlDS.SelectCommand = sel;
            if (!(hT == null))
            {
                foreach (string x in hT.Keys)
                    sqlDS.SelectParameters.Add(x, hT[x].ToString());
            }
            sqlDS.CancelSelectOnNullParameter = false;
            DataView dV = (DataView)sqlDS.Select(System.Web.UI.DataSourceSelectArguments.Empty);
            if (!(dV == null))
                return dV.Table.DataSet;
            else
                return null;
        }


    }
}