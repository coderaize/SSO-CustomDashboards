<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SPDashboard.aspx.cs" Inherits="XCCustomDashboards.SPDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Vendor/bootstrap-4.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Vendor/material-assets/css/material-dashboard.css" rel="stylesheet" />
    <link href="Vendor/fontawesome-free-5.13.0-web/css/all.css" rel="stylesheet" />
    <link href="Vendor/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css" rel="stylesheet" />
    <style>
        @keyframes color-change {

            0% {
                color: #343a40;
            }

            12% {
                color: #6f42c1;
            }

            24% {
                color: #6c757d;
            }

            36% {
                color: #28a745;
            }

            48% {
                color: #17a2b8;
            }

            60% {
                color: #ffc107;
            }

            72% {
                color: #dc3545;
            }

            84% {
                color: #f8f9fa;
            }

            100% {
                color: #343a40;
            }
        }

        .card .table td {
            padding: 0px !important;
            font-size: 12px !important;
        }

        .owl-nav, .owl-dots {
            display: none !important;
        }

        .ab-own-nav {
            cursor: pointer;
            font-size: 25px;
            opacity: 0.2;
        }

            .ab-own-nav:hover {
                opacity: 1;
            }

        .navbar-banner {
            width: 100%;
            height: 63px;
            background-color: #eee;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center; /*flex-direction: column; */
        }
    </style>
</head>
<body>
    <%-- style="background-image:url(Images/loading-gears-animation-3.gif);background-repeat:no-repeat;background-size:contain">--%>
    <div class="navbar-banner">
        <img src="Images/loading-gears-animation-3.gif" style="height: 100%; margin-right: 30px;" />
        <h2 style="/*animation: color-change 10s infinite; */">IAM Services Dashboard</h2>
        <style>
          
        </style>
        <img src="Images/loading-gears-animation-3.gif" style="height: 100%; margin-left: 30px;" />
    </div>
    <div class="container">
        <div class="content">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-sm-12">

                        <div <%--style="height: 250px"--%>>

                            <div class="owl-carousel owl-theme">

                                <!-- DB Instance -->
                                <div>

                                    <div class="card card-stats">
                                        <div class="card-header card-header-info card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-database"></i>
                                            </div>
                                            <p class="card-category">Primary</p>
                                            <h3 class="card-title" style="font-size: 17px;"><%= DBInstance[0].ToString() %></h3>
                                        </div>
                                        <div class="card-footer" style="padding-top: 14px; margin-bottom: 7px;margin-top:2px;">
                                            <div class="stats">
                                                <i style="font-size: 18px" class="fa fa-chalkboard"></i>&nbsp;Mirror:&nbsp; <b style="font-weight: bold"><%=DBInstance[1].ToString() %></b>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- SMS Count in last hour -->
                                <div>
                                    <div class="card card-stats">
                                        <div class="card-header card-header-success card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-sms"></i>
                                            </div>
                                            <p class="card-category">SMS</p>
                                            <h3 class="card-title"><%= NotifDT.Rows[0][1].ToString() %><b style="font-size:10px">(H)</b></h3>
                                        </div>
                                        <div class="card-footer">
                                            <div class="stats">
                                                    <i style="font-size: 18px" class="fa fa-clock"></i>&nbsp;Recent:<b style="font-weight:bold"> <%= NotifDT.Rows[5][1].ToString() %></b>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- Email Count in Last Hour -->
                                <div>
                                    <div class="card card-stats">
                                        <div class="card-header card-header-warning card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-envelope"></i>
                                            </div>
                                            <p class="card-category">EMAILS</p>
                                            <h3 class="card-title"><%= NotifDT.Rows[1][1].ToString() %><b style="font-size:10px">(H)</b></h3>
                                        </div>
                                        <div class="card-footer">
                                            <div class="stats">
                                                    <i style="font-size: 18px" class="fa fa-clock"></i>&nbsp;Recent:<b style="font-weight:bold"> <%= NotifDT.Rows[6][1].ToString() %></b>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Alerts Generated -->
                                <div>
                                    <div class="card card-stats">
                                        <div class="card-header card-header-primary card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-exclamation-triangle"></i>
                                            </div>
                                            <p class="card-category">ALERTS</p>
                                            <h3 class="card-title"><%= NotifDT.Rows[2][1].ToString() %><b style="font-size:10px">(D)</b></h3>
                                        </div>
                                        <div class="card-footer">
                                            <div class="stats">
                                                <i style="font-size: 18px" class="fa fa-clock"></i>&nbsp;Recent:<b style="font-weight:bold"> <%= NotifDT.Rows[7][1].ToString() %></b>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Last SR Raised -->
                                <div>
                                    <div class="card card-stats">
                                        <div class="card-header card-header-danger card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-handshake"></i>
                                            </div>
                                            <p class="card-category">SR</p>
                                            <h3 class="card-title" ><%= NotifDT.Rows[3][1].ToString() %> <b style="font-size:10px">(D)</b></h3>
                                        </div>
                                        <div class="card-footer">
                                            <div class="stats">
                                                <i style="font-size: 18px" class="fa fa-clock"></i>&nbsp;Recent:<b style="font-weight:bold"> <%= NotifDT.Rows[4][1].ToString() %></b>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- HealthState -->
                                <div>
                                    <div class="card card-stats">
                                        <div class="card-header card-header-info card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-check-double"></i>
                                            </div>
                                            <p class="card-category" style="font-size: 9px; font-weight: bold">HEALTH STATES</p>
                                            <h3 class="card-title"><%= SSOWorkerDT.Rows[0][1].ToString() %></h3>
                                        </div>
                                        <div class="card-footer">
                                            <div class="stats">
                                                <i style="font-size: 18px" class="fa fa-redo"></i>&nbsp;&nbsp;HealthStates Refreshed
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- WorkPacket -->
                                <div>
                                    <div class="card card-stats">
                                        <div class="card-header card-header-danger card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-clipboard-list"></i>
                                            </div>
                                            <p class="card-category" style="font-size: 9px; font-weight: bold">WORK PACKETS</p>
                                            <h3 class="card-title"><%= SSOWorkerDT.Rows[1][1].ToString() %></h3>
                                        </div>
                                        <div class="card-footer">
                                            <div class="stats">
                                                <i style="font-size: 18px" class="fa fa-caret-right"></i>&nbsp;&nbsp;Work Packets Executed
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Password Reset -->
                                <div>
                                    <div class="card card-stats">
                                        <div class="card-header card-header-warning card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-key"></i>
                                            </div>
                                            <p class="card-category" style="font-size: 9px; font-weight: bold">PASS RESETS</p>
                                            <h3 class="card-title"><%= SSOWorkerDT.Rows[2][1].ToString() %></h3>
                                        </div>
                                        <div class="card-footer">
                                            <div class="stats">
                                                <i style="font-size: 18px" class="fa fa-undo"></i>&nbsp;&nbsp;Passwords Updated
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Condfigured Items  -->
                                <div>
                                    <div class="card card-stats">
                                        <div class="card-header card-header-info card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-laptop"></i>
                                            </div>
                                            <p class="card-category" style="font-size: 11px; font-weight: bold">NE COUNTS</p>
                                            <h3 class="card-title"><%= ConfigurationDT.Rows[0][1].ToString() %></h3>
                                        </div>
                                        <div class="card-footer" style="margin-bottom:0px;padding-top:0px;padding-left:30px;">
                                            <div class="stats">
                                                <p style="margin-bottom:0px">
                                                    HTTP(<b style="font-weight: bold"><%= ConfigurationDT.Rows[1][1].ToString() %></b>)&nbsp;
                                                    CLI(<b style="font-weight: bold"><%= ConfigurationDT.Rows[2][1].ToString() %></b>)&nbsp;
                                                    RDP(<b style="font-weight: bold"><%= ConfigurationDT.Rows[3][1].ToString() %></b>)&nbsp;
                                                    GUI(<b style="font-weight: bold"><%= ConfigurationDT.Rows[4][1].ToString() %></b>)&nbsp;
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                </div>



                            </div>


                        </div>


                    </div>
                    <div class="col-sm-12" style="z-index: 1000; margin-top: -16px;">
                        <style>
                           
                        </style>
                        <span id="" class="am-prev ab-own-nav fa-pull-left"><i class="fa fa-arrow-circle-left"></i></span>
                        <span id="" class="am-next fa-pull-right ab-own-nav "><i class="fa fa-arrow-circle-right"></i></span>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12">


                        <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                                <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">

                                <!-- Slide 1 -->
                                <!-- LHE-SSO-FE1 -->
                                <div class="carousel-item active">
                                    <div class="card">
                                        <div class="card-header card-header-danger">
                                            <h4 class="card-title">LHE-SSO-FE1 (10.231.40.22)  (10.200.206.252)</h4>
                                            <p class="card-category">Server Details</p>
                                        </div>
                                        <div class="card-body table-responsive" style="padding: 3px;">

                                            <div class="row" style="margin-left: -3px!important; margin-right: -3px!important">

                                                <!-- CPU Utilization -->
                                                <div class="col-sm-3">
                                                    <div class="card text-center">
                                                        <div class="card-header card-header-danger" style="padding: 6px">
                                                            <h5 class="card-title">CPU Utilization</h5>
                                                        </div>
                                                        <div class="card-body table-responsive" style="padding: 5px; max-height: 220px!important; height: 200px">
                                                            <canvas id="telco_lhe_ProcessorChart"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- RAN Utilization -->
                                                <div class="col-sm-3">
                                                    <div class="card text-center">
                                                        <div class="card-header card-header-danger" style="padding: 6px">
                                                            <h5 class="card-title">RAM Utilization</h5>
                                                        </div>
                                                        <div class="card-body table-responsive" style="padding: 5px; max-height: 220px!important; height: 200px">
                                                            <canvas id="telco_lhe_MemoryChart"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Details -->
                                                <div class="col-sm-2">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="card text-center" style="margin-bottom: 10px">
                                                                <div class="card-header card-header-danger" style="padding: 6px">
                                                                    <h5 class="card-title">UP Time</h5>
                                                                </div>
                                                                <div class="card-body table-responsive" style="padding: 5px; max-height: 110px!important; height: 75px; overflow: hidden;">

                                                                    <% string lhe_sso_fe1_uptime = "";
                                                                        foreach (System.Data.DataRow dR in ServerUpTimesDT.Rows)
                                                                        {
                                                                            if (dR["ServerName"].ToString() == "LHE-SSO-FE1") { lhe_sso_fe1_uptime = dR["Value"].ToString(); }
                                                                        }
                                                                    %>

                                                                    <%= Convert.ToDateTime(lhe_sso_fe1_uptime).ToLongDateString() %>
                                                                    <br />
                                                                    <%= Convert.ToDateTime(lhe_sso_fe1_uptime).ToLongTimeString() %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <div class="card text-center">
                                                                <div class="card-header card-header-danger" style="padding: 6px">
                                                                    <h5 class="card-title">Disk Space</h5>
                                                                </div>
                                                                <div class="card-body table-responsive" style="padding: 5px; max-height: 110px!important; height: 65px; overflow: hidden">
                                                                    <%
                                                                        string lhe_sso_fe1_totalSpaceLeft = "";
                                                                        string lhe_sso_fe1_cSpaceLeft = "";
                                                                        foreach (System.Data.DataRow dR in ServerDiskSpace.Rows)
                                                                        {
                                                                            if (dR["ServerName"].ToString() == "LHE-SSO-FE1" && dR["InstanceName"].ToString() == "_Total")
                                                                            {
                                                                                lhe_sso_fe1_totalSpaceLeft = dR["Value"].ToString();
                                                                            }
                                                                            if (dR["ServerName"].ToString() == "LHE-SSO-FE1" && dR["InstanceName"].ToString() == "C:")
                                                                            {
                                                                                lhe_sso_fe1_cSpaceLeft = dR["Value"].ToString();
                                                                            }
                                                                        }

                                                                    %>
                                                                    Total: &nbsp;<b><%=lhe_sso_fe1_totalSpaceLeft %>&nbsp;%</b><br />
                                                                    C: &nbsp;<b><%=lhe_sso_fe1_cSpaceLeft %>&nbsp;%</b>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Serivces Information -->
                                                <div class="col-sm-4">
                                                    <div class="card text-center">
                                                        <div class="card-header card-header-danger" style="padding: 6px">
                                                            <h5 class="card-title">Services State</h5>
                                                        </div>
                                                        <div class="card-body table-responsive service-tables" style="padding: 5px; max-height: 220px!important; height: 200px">
                                                            <table class="table table-hover">
                                                                <thead class="text-danger">
                                                                    <tr>
                                                                        <th>Service Name</th>
                                                                        <th>Memory (MB's)</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="lhe_sso_fe1_tBody">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <!--Slide 2-->
                                <!-- LHE-SSO-FE2 -->
                                <div class="carousel-item">
                                    <div class="card">
                                        <div class="card-header card-header-info">
                                            <h4 class="card-title">LHE-SSO-FE2  (10.231.40.20)  (10.50.231.11) </h4>
                                            <p class="card-category">Server Details</p>
                                        </div>
                                        <div class="card-body table-responsive" style="padding: 3px;">

                                            <div class="row" style="margin-left: -3px!important; margin-right: -3px!important">

                                                <!-- CPU Utilization -->
                                                <div class="col-sm-3">
                                                    <div class="card text-center">
                                                        <div class="card-header card-header-info" style="padding: 6px">
                                                            <h5 class="card-title">CPU Utilization</h5>
                                                        </div>
                                                        <div class="card-body table-responsive" style="padding: 5px; max-height: 220px!important; height: 200px">
                                                            <canvas id="it_lhe_ProcessorChart"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- RAN Utilization -->
                                                <div class="col-sm-3">
                                                    <div class="card text-center">
                                                        <div class="card-header card-header-info" style="padding: 6px">
                                                            <h5 class="card-title">RAM Utilization</h5>
                                                        </div>
                                                        <div class="card-body table-responsive" style="padding: 5px; max-height: 220px!important; height: 200px">
                                                            <canvas id="it_lhe_MemoryChart"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Details -->
                                                <div class="col-sm-2">
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="card text-center" style="margin-bottom: 10px">
                                                                <div class="card-header card-header-info" style="padding: 6px">
                                                                    <h5 class="card-title">UP Time</h5>
                                                                </div>
                                                                <div class="card-body table-responsive" style="padding: 5px; max-height: 110px!important; height: 75px; overflow: hidden;">

                                                                    <% string lhe_sso_fe2_uptime = "";
                                                                        foreach (System.Data.DataRow dR in ServerUpTimesDT.Rows)
                                                                        {
                                                                            if (dR["ServerName"].ToString() == "LHE-SSO-FE2") { lhe_sso_fe2_uptime = dR["Value"].ToString(); }
                                                                        }
                                                                    %>

                                                                    <%= Convert.ToDateTime(lhe_sso_fe2_uptime).ToLongDateString() %>
                                                                    <br />
                                                                    <%= Convert.ToDateTime(lhe_sso_fe2_uptime).ToLongTimeString() %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <div class="card text-center">
                                                                <div class="card-header card-header-info" style="padding: 6px">
                                                                    <h5 class="card-title">Disk Space</h5>
                                                                </div>
                                                                <div class="card-body table-responsive" style="padding: 5px; max-height: 110px!important; height: 65px; overflow: hidden">
                                                                    <%
                                                                        string lhe_sso_fe2_totalSpaceLeft = "";
                                                                        string lhe_sso_fe2_cSpaceLeft = "";
                                                                        foreach (System.Data.DataRow dR in ServerDiskSpace.Rows)
                                                                        {
                                                                            if (dR["ServerName"].ToString() == "LHE-SSO-FE2" && dR["InstanceName"].ToString() == "_Total")
                                                                            {
                                                                                lhe_sso_fe2_totalSpaceLeft = dR["Value"].ToString();
                                                                            }
                                                                            if (dR["ServerName"].ToString() == "LHE-SSO-FE2" && dR["InstanceName"].ToString() == "C:")
                                                                            {
                                                                                lhe_sso_fe2_cSpaceLeft = dR["Value"].ToString();
                                                                            }
                                                                        }

                                                                    %>
                                                                    Total: &nbsp;<b><%=lhe_sso_fe2_totalSpaceLeft %>&nbsp;%</b><br />
                                                                    C: &nbsp;<b><%=lhe_sso_fe2_cSpaceLeft %>&nbsp;%</b>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Serivces Information -->
                                                <div class="col-sm-4">
                                                    <div class="card text-center">
                                                        <div class="card-header card-header-info" style="padding: 6px">
                                                            <h5 class="card-title">Services State</h5>
                                                        </div>
                                                        <div class="card-body table-responsive service-tables" style="padding: 5px; max-height: 220px!important; height: 200px">
                                                            <table class="table table-hover">
                                                                <thead class="text-info">
                                                                    <tr>
                                                                        <th>Service Name</th>
                                                                        <th>Memory (MB's)</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="lhe_sso_fe2_tBody">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev" style="height: 40px; margin-top: 16%; left: 0; width: 40px;">
                                    <span <%--class="carousel-control-prev-icon"--%> aria-hidden="true" style="margin-right: 0px; font-size: 40px; color: black">
                                        <i class="fa fa-arrow-circle-left"></i>
                                    </span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next" style="height: 40px; margin-top: 16%; right: 0; width: 60px;">
                                    <span class="carousel-control-next-icon" aria-hidden="true" style="margin-left: 0px; font-size: 40px; color: black">
                                        <i class="fa fa-arrow-circle-right"></i>
                                    </span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>




                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Vendor/JQuery/jquery-3.4.1.js"></script>
    <script src="Vendor/bootstrap-4.4.1/js/bootstrap.min.js"></script>
    <script src="Vendor/ChartJS/moment.js"></script>
    <script src="Vendor/ChartJS/charts.min.js"></script>
    <script src="Vendor/ChartJS/chartjs-plugin-annotation.min.js"></script>
    <script src="Vendor/ChartJS/chartjs-plugin-streaming.min.js"></script>
    <script src="Vendor/OwlCarousel2-2.3.4/dist/owl.carousel.js"></script>

    <script>


        $(document).ready(function () {

            setTimeout(() => { window.location.reload(); }, (15 * 60 * 1000));

            $('.carousel').carousel({
                interval: 1000 * 20
            });

            var w;
            function startWorker() {
                if (typeof (Worker) !== "undefined") {
                    if (typeof (w) == "undefined") {
                        w = new Worker("SPDashboardAPI.asmx/WebWorkerJS?Interval=15000");
                    }
                    w.onmessage = function (event) {
                        UpdateProcessCharts();
                        UpdateMemoryCharts();
                        UpdateInnerAppServices();
                    };
                } else {
                    document.getElementById("result").innerHTML = "Sorry, your browser does not support Web Workers...";
                }
            }

            function stopWorker() {
                w.terminate();
                w = undefined;
            }
            startWorker();

            $('.owl-carousel').owlCarousel({
                items: 4,
                loop: true,
                margin: 10,
                autoplay: true,
                autoplayTimeout: 5000,
                autoplayHoverPause: true,
                responsive: {
                    0: {
                        items: 1,
                        nav: true
                    },
                    600: {
                        items: 3,
                        nav: false
                    },
                    1000: {
                        items: 5,
                        nav: true,
                        loop: true
                    }
                },
                navText: [$($('.am-next')[0]), $($('.am-prev')[0])]
            });
        });

    </script>
    <!-- Processor Utilizarion -->
    <script>
        var telco_lahore_processor_values = [];
        var telco_lahore_processor_chart;

        var it_lahore_processor_values = [];
        var it_lahore_processor_chart;

        initializeProcessorChart();
        function initializeProcessorChart() {

            telco_lahore_processor_values.push({ x: 0, y: 0 });
            telco_lahore_processor_chart = new Chart(document.getElementById("telco_lhe_ProcessorChart"), {
                type: 'line',
                data: {
                    labels: telco_lahore_processor_values.map(X => X.y),
                    datasets: [{
                        data: telco_lahore_processor_values,
                        backgroundColor: 'rgba(255, 99, 132, 0.1)',
                        borderColor: 'rgb(255, 99, 132)',
                        borderWidth: 2
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                    animation: {
                        duration: 5000,
                        easing: 'linear'
                    },
                    legend: false,
                    scales: {
                        xAxes: [{
                            display: true,

                        }],
                        yAxes: [{
                            ticks: {
                                //max: 100,
                                min: 0
                            }
                            , beginAtZero: true,
                            suggestedMax: 100,
                            suggestedMin: 0
                        }]
                    }
                }
            });


            it_lahore_processor_values.push({ x: 0, y: 0 });
            it_lahore_processor_chart = new Chart(document.getElementById("it_lhe_ProcessorChart"), {
                type: 'line',
                data: {
                    labels: it_lahore_processor_values.map(X => X.y),
                    datasets: [{
                        data: it_lahore_processor_values,
                        backgroundColor: 'rgba(0, 188, 212, 0.1)',
                        borderColor: 'rgb(0, 188, 212)',
                        borderWidth: 2
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                    animation: {
                        duration: 5000,
                        easing: 'linear'
                    },
                    legend: false,
                    scales: {
                        xAxes: [{
                            display: true,

                        }],
                        yAxes: [{
                            ticks: {
                                //max: 100,
                                min: 0
                            }
                            , beginAtZero: true,
                            suggestedMax: 100,
                            suggestedMin: 0
                        }]
                    }
                }
            });


        }
        var ProcessorChartIteration = 0;


        function UpdateProcessCharts() {

            $.ajax({
                url: 'SPDashboardAPI.asmx/ServerProcessorState',
                type: 'POST',
                success: function (response) {
                    response = JSON.parse(response);

                    for (var i = 0; i <= response.length - 1; i++) {
                        if (response[i].ServerName == 'LHE-SSO-FE1') {
                            telco_lahore_processor_values.push({
                                x: ProcessorChartIteration,
                                y: response[i].Value,
                            });
                            if (telco_lahore_processor_values.length > 7)
                                telco_lahore_processor_values.shift();

                        } else if (response[i].ServerName == 'LHE-SSO-FE2') {

                            it_lahore_processor_values.push({
                                x: ProcessorChartIteration,
                                y: response[i].Value,
                            });
                            if (it_lahore_processor_values.length > 7)
                                it_lahore_processor_values.shift();

                        } else if (response[i].ServerName == 'ISB-SSO-FE1') {

                        } else if (response[i].ServerName == 'ISB-SSO-FE1') {

                        }
                    }

                    ProcessorChartIteration++;

                    telco_lahore_processor_chart.config.data.labels = telco_lahore_processor_values.map(X => X.x);
                    telco_lahore_processor_chart.update();

                    it_lahore_processor_chart.config.data.labels = telco_lahore_processor_values.map(X => X.x);
                    it_lahore_processor_chart.update();
                    //console.log(telco_lahore_processor_values);

                },
                error: function (r) {
                    console.log(r.responseText);
                }
            });
        }






    </script>

    <!-- RAM Utilization -->
    <script>

        var telco_lahore_memory_values = [];
        var telco_lahore_memory_chart;


        var it_lahore_memory_values = [];
        var it_lahore_memory_chart;

        initializeMemoryChart();
        function initializeMemoryChart() {
            telco_lahore_memory_values.push({ x: 0, y: 0 });
            telco_lahore_memory_chart = new Chart(document.getElementById("telco_lhe_MemoryChart"), {
                type: 'line',
                data: {
                    labels: telco_lahore_memory_values.map(X => X.y),
                    datasets: [{
                        data: telco_lahore_memory_values,
                        backgroundColor: 'rgba(255, 99, 132, 0.1)',
                        borderColor: 'rgb(255, 99, 132)',
                        borderWidth: 2
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                    animation: {
                        duration: 5000,
                        easing: 'linear'
                    },
                    legend: false,
                    scales: {
                        xAxes: [{
                            display: true,

                        }],
                        yAxes: [{
                            ticks: {
                                max: 100,
                                min: 0
                            }
                            , beginAtZero: true,
                            suggestedMax: 100,
                            suggestedMin: 0
                        }]
                    }
                }
            });


            it_lahore_memory_values.push({ x: 0, y: 0 });
            it_lahore_memory_chart = new Chart(document.getElementById("it_lhe_MemoryChart"), {
                type: 'line',
                data: {
                    labels: it_lahore_memory_values.map(X => X.y),
                    datasets: [{
                        data: it_lahore_memory_values,
                        backgroundColor: 'rgba(0, 188, 212, 0.1)',
                        borderColor: 'rgb(0, 188, 212)',
                        borderWidth: 2
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                    animation: {
                        duration: 5000,
                        easing: 'linear'
                    },
                    legend: false,
                    scales: {
                        xAxes: [{
                            display: true,

                        }],
                        yAxes: [{
                            ticks: {
                                max: 100,
                                min: 0
                            }
                            , beginAtZero: true,
                            suggestedMax: 100,
                            suggestedMin: 0
                        }]
                    }
                }
            });

        }
        var MemeorChartIteration = 0;

        function UpdateMemoryCharts() {

            $.ajax({
                url: 'SPDashboardAPI.asmx/ServerMemoryState',
                type: 'POST',
                success: function (response) {
                    response = JSON.parse(response);

                    for (var i = 0; i <= response.length - 1; i++) {
                        if (response[i].ServerName == 'LHE-SSO-FE1') {
                            telco_lahore_memory_values.push({
                                x: MemeorChartIteration,
                                y: response[i].Value,
                            });
                            if (telco_lahore_memory_values.length > 7)
                                telco_lahore_memory_values.shift();
                        } else if (response[i].ServerName == 'LHE-SSO-FE2') {

                            it_lahore_memory_values.push({
                                x: MemeorChartIteration,
                                y: response[i].Value,
                            });
                            if (it_lahore_memory_values.length > 7)
                                it_lahore_memory_values.shift();

                        } else if (response[i].ServerName == 'ISB-SSO-FE1') {

                        } else if (response[i].ServerName == 'ISB-SSO-FE1') {

                        }
                    }
                    MemeorChartIteration++;
                    telco_lahore_memory_chart.config.data.labels = telco_lahore_memory_values.map(X => X.x);
                    telco_lahore_memory_chart.update();

                    it_lahore_memory_chart.config.data.labels = it_lahore_memory_values.map(X => X.x);
                    it_lahore_memory_chart.update();
                    //console.log(telco_lahore_memory_values);

                },
                error: function (r) {
                    console.log(r.responseText);
                }
            });
        }

    </script>

    <!-- Inner Services Apps -->
    <script>
        function UpdateInnerAppServices(data) {
            $.ajax({
                url: 'SPDashboardAPI.asmx/GetInnerServicesWorkingSet',
                type: 'POST',
                success: function (response) {
                    data = JSON.parse(response);
                    var lhe_sso_fe1_tBody = '';
                    var lhe_sso_fe2_tBody = '';
                    var isb_sso_fe1_tBody = '';
                    var isb_sso_fe2_tBody = '';
                    ////
                    for (var i = 0; i <= data.length - 1; i++) {
                        if (data[i].ServerName == "LHE-SSO-FE1") {
                            lhe_sso_fe1_tBody += '<tr>';
                            lhe_sso_fe1_tBody += '<td>' + (data[i].InstanceName == "ColdStrike" ? "AdminCLI" : data[i].InstanceName == "SSOWorker" ? "CLIHealthState" : data[i].InstanceName) + '</td><td>' + data[i].Value + ' MBs</td>';
                            lhe_sso_fe1_tBody += '</tr>';
                        } else if (data[i].ServerName == "LHE-SSO-FE2") {
                            lhe_sso_fe2_tBody += '<tr>';
                            lhe_sso_fe2_tBody += '<td>' + data[i].InstanceName + '</td><td>' + data[i].Value + ' MBs</td>';
                            lhe_sso_fe2_tBody += '</tr>';
                        } else if (data[i].ServerName == "ISB-SSO-FE1") {
                            isb_sso_fe1_tBody += '<tr>';
                            isb_sso_fe1_tBody += '<td>' + data[i].InstanceName + '</td><td>' + data[i].Value + ' MBs</td>';
                            isb_sso_fe1_tBody += '</tr>';
                        } else if (data[i].ServerName == "ISB-SSO-FE2") {
                            isb_sso_fe2_tBody += '<tr>';
                            isb_sso_fe2_tBody += '<td>' + data[i].InstanceName + '</td><td>' + data[i].Value + ' MBs</td>';
                            isb_sso_fe2_tBody += '</tr>';
                        }
                    }
                    //////
                    //poulation Lhe-SSo-FE1  Telce
                    document.getElementById('lhe_sso_fe1_tBody').innerHTML = lhe_sso_fe1_tBody;
                    //poulation Lhe-SSo-FE2  IT
                    document.getElementById('lhe_sso_fe2_tBody').innerHTML = lhe_sso_fe2_tBody;


                    var $el = $(".service-tables");
                    function anim() {
                        var st = $el.scrollTop();
                        var sb = $el.prop("scrollHeight") - $el.innerHeight();
                        $el.animate({ scrollTop: st < sb / 2 ? sb : 0 }, 4000, anim);
                    }
                    function stop() {
                        $el.stop();
                    }
                    anim();
                    $el.hover(stop, anim);
                },
                error: function (r) {
                    console.log(r.responseText);
                }
            });

        }
    </script>

    <!-- Web Worker -->
    <script>

</script>


    <!-- -->
    <!-- -->
    <!-- -->
    <!-- -->
    <!-- -->

    <script>

        //owl.trigger('play.owl.autoplay', [5000])
    </script>


</body>
</html>
