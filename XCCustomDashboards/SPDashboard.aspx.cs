using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XCCustomDashboards
{
    public partial class SPDashboard : System.Web.UI.Page
    {
        public DataTable ServerUpTimesDT { get; set; }
        public DataTable ServerDiskSpace { get; set; }
        public DataRow DBInstance { get; set; }
        public DataTable SSOWorkerDT { get; set; }
        public DataTable ConfigurationDT { get; set; }
        public DataTable NotifDT { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ServerUpTimesDT = info.getDSRO(@"
                select * from ( select top(1) ServerName,  ServerTime , DateADD(SECOND ,-1 * Value,GETDATE()) Value from pm_SystemPerformance where ServerName = 'LHE-SSO-FE1' and CategoryName = 'System' and CounterName = 'System Up Time' order by ServerTime desc ) A
                union all
                select * from ( select top(1) ServerName,  ServerTime , DateADD(SECOND ,-1 * Value,GETDATE()) Value from pm_SystemPerformance where ServerName = 'LHE-SSO-FE2' and CategoryName = 'System' and CounterName = 'System Up Time' order by ServerTime desc ) A
                union all
                select * from ( select top(1) ServerName,  ServerTime , DateADD(SECOND ,-1 * Value,GETDATE()) Value from pm_SystemPerformance where ServerName = 'ISB-SSO-FE1' and CategoryName = 'System' and CounterName = 'System Up Time' order by ServerTime desc ) A
                union all
                select * from ( select top(1) ServerName,  ServerTime , DateADD(SECOND ,-1 * Value,GETDATE()) Value from pm_SystemPerformance where ServerName = 'ISB-SSO-FE2' and CategoryName = 'System' and CounterName = 'System Up Time' order by ServerTime desc ) A
            ").Tables[0];

            ServerDiskSpace = info.getDSRO(@"
                SELECT * FROM (SELECT TOP (2) [ServerName] ,[ServerTime], InstanceName ,Convert(int,[Value]) Value FROM [dBColdStrike].[dbo].[pm_SystemPerformance] WHERE ServerName = 'LHE-SSO-FE1' and CounterName = '% Free Space' and CategoryName = 'LogicalDisk' order by servertime desc) A
                Union ALL
                SELECT * FROM (SELECT TOP (2) [ServerName] ,[ServerTime], InstanceName ,Convert(int,[Value]) Value FROM [dBColdStrike].[dbo].[pm_SystemPerformance] WHERE ServerName = 'LHE-SSO-FE2' and CounterName = '% Free Space' and CategoryName = 'LogicalDisk' order by servertime desc) A
                Union ALL
                SELECT * FROM (SELECT TOP (2) [ServerName] ,[ServerTime], InstanceName ,Convert(int,[Value]) Value FROM [dBColdStrike].[dbo].[pm_SystemPerformance] WHERE ServerName = 'ISB-SSO-FE1' and CounterName = '% Free Space' and CategoryName = 'LogicalDisk' order by servertime desc) A
                Union ALL
                SELECT * FROM (SELECT TOP (2) [ServerName] ,[ServerTime], InstanceName ,Convert(int,[Value]) Value FROM [dBColdStrike].[dbo].[pm_SystemPerformance] WHERE ServerName = 'ISB-SSO-FE2' and CounterName = '% Free Space' and CategoryName = 'LogicalDisk' order by servertime desc) A
            ").Tables[0];



            DBInstance = info.getDSRO("SELECT  CASE mirroring_role_desc     WHEN 'MIRROR'    THEN mirroring_partner_instance     WHEN 'PRINCIPAL' THEN SERVERPROPERTY ('SERVERNAME') END AS 'Primary', CASE mirroring_role_desc     WHEN 'MIRROR'    THEN SERVERPROPERTY('SERVERNAME')     WHEN  'PRINCIPAL' THEN mirroring_partner_instance END AS 'Secondary' FROM sys.database_mirroring WHERE  DB_NAME(database_id) =  'dBColdStrike';").Tables[0].Rows[0];

            SSOWorkerDT = info.getDSRO(@"
                SELECT 'HEALTHSTATES-EXECUTED' Label, Convert(varchar, COUNT(ID)) Value   FROM [dBColdStrike].[dbo].[sso_HealthState]   WHERE MonitorTime > DATEADD(DAY, -1, GETDATE()) AND ServerName = 'LHE-SSO-FE1'
                union all
                SELECT 'WORKPACKETS-EXECUTED' Label ,Convert(varchar, COUNT(WPID)) Value FROM [dBColdStrike].[dbo].[sso_WorkPackets] WHERE InsertTime > DATEADD(DAY, -1, GETDATE())
                union all
                SELECT 'PASSWORD-RESETTED'Label,Convert(varchar,COUNT(ID)) Value FROM [dBColdStrike].[dbo].sso_CIAccounts WHERE PasswordModifyTime>DATEADD(DAY, -1, GETDATE())
            ").Tables[0];

            NotifDT = info.getDSRO(@"
                SELECT 'SMS-SENT' Label, Convert(varchar,count(NotifID)) Value FROM [dBColdStrike].[dbo].[sso_exNotificationStore] where NotifType ='SMS' and SentTime >DATEADD(HOUR, -1, GETDATE()) 
                union all
                SELECT 'EMAIL-SENT'  Label , Convert(varchar,count(NotifID)) Value FROM [dBColdStrike].[dbo].[sso_exNotificationStore] where NotifType ='EMAIL' and SentTime >DATEADD(HOUR, -1, GETDATE()) 
                union all
                SELECT 'ALERT-SENT'  Label, Convert(varchar,count(NotifID)) Value   FROM [dBColdStrike].[dbo].[sso_exNotificationStore]   where SentTime > dateadd(DAY,-1,GETDATE()) and NotifTag in ('CLI-LOG')
                union all
                SELECt * FROM (SELECT TOP(1) 'SR-RAISED'  Label,  Convert(varchar,COUNT(ID)) Value FROM [dBColdStrike].[dbo].[surfer_ServiceRequest] WHERE CreationDate >  dateadd(DAY,-1,GETDATE())  )A
                union all
                SELECt * FROM (SELECT TOP(1) 'SR-LAST-TIME'  Label,  Convert(varchar,CreationDate) Value FROM [dBColdStrike].[dbo].[surfer_ServiceRequest] ORDER BY ID DESC )A
                union all
                SELECT * FROM (SELECT TOP(1) 'SMS-LAST-TIME' Label, Convert(varchar,SentTime) Value FROM [dBColdStrike].[dbo].[sso_exNotificationStore] where NotifType ='SMS' and Senttime >  dateadd(Hour,-5,GETDATE() ) order by SentTime DESC)A
                union all
                SELECT * FROM (SELECT TOP(1) 'EMAIL-LAST-TIME' Label, Convert(varchar,SentTime) Value FROM [dBColdStrike].[dbo].[sso_exNotificationStore] where NotifType ='EMAIL' and Senttime >  dateadd(Hour,-5,GETDATE() ) order by SentTime DESC)A
                union all
                SELECT * FROM (SELECT TOP(1) 'ALERT-LAST-TIME' Label, Convert(varchar,SentTime) Value FROM [dBColdStrike].[dbo].[sso_exNotificationStore] with(nolock) where  NotifTag = 'CLI-LOG' AND NotifType = 'EMAIL' order by SentTime DESC)A
            ").Tables[0];

            ConfigurationDT = info.getDSRO(@"
                select 'TOTAL-CONFIGURATIONS'Label,Convert(varchar,count(ID)) Value from [dBColdStrike].[dbo].sso_ConfigurationItems
                union all
                select 'HTTP-CONFIGURATIONS'Label,Convert(varchar,count(ID)) Value from [dBColdStrike].[dbo].sso_ConfigurationItems where CINAME like '%-HTTP-%'
                union all
                select 'CLI-CONFIGURATIONS'Label,Convert(varchar,count(ID)) Value from [dBColdStrike].[dbo].sso_ConfigurationItems where CINAME like '%-CLI-%'
                union all
                select 'RDP-CONFIGURATIONS'Label,Convert(varchar,count(ID)) Value from [dBColdStrike].[dbo].sso_ConfigurationItems where CINAME like '%-RDP-%'
                union all
                select 'GUI-CONFIGURATIONS'Label,Convert(varchar,count(ID)) Value from [dBColdStrike].[dbo].sso_ConfigurationItems where CINAME like '%-GUI-%' and CINAME not like '%-HTTP-%'  and CINAME not like '%-HTTP-%' and CINAME not like '%-RDP-%'
            ").Tables[0];

        }


    }
}