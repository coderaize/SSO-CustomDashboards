<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatDashboard.aspx.cs" Inherits="XCCustomDashboards.StatDashboard" %>

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

                                 <!--Active Store -- Critical -->
                                <div>

                                    <div class="card card-stats">
                                        <div class="card-header card-header-danger card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-database"></i>
                                            </div>
                                            <p class="card-category">Critical</p>
                                            <h3 class="card-title" style="font-size: 17px;"><%= SeverityActiveStore.Rows[0][0].ToString() %></h3>
                                        </div>
                                        <div class="card-footer" style="padding-top: 14px; margin-bottom: 7px;margin-top:2px;">
                                            <div class="stats">
                                                <%--<i style="/*font-size: 18px*/" class="fa fa-chalkboard"></i>&nbsp;Major:&nbsp; <b style="font-weight: bold"></b>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Active Store -- Major -->
                                <div>

                                    <div class="card card-stats">
                                        <div class="card-header card-header-warning card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-database"></i>
                                            </div>
                                            <p class="card-category">Major</p>
                                            <h3 class="card-title" style="font-size: 17px;"><%= SeverityActiveStore.Rows[1][0].ToString() %></h3>
                                        </div>
                                        <div class="card-footer" style="padding-top: 14px; margin-bottom: 7px;margin-top:2px;">
                                            <div class="stats">
                                                <%--<i style="font-size: 18px" class="fa fa-chalkboard"></i>&nbsp;Mirror:&nbsp; <b style="font-weight: bold"><%=DBInstance[1].ToString() %></b>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Active Store -- Minor -->
                                <div>
                                       <div class="card card-stats">
                                        <div class="card-header card-header-info card-header-icon">
                                            <div class="card-icon">
                                                <i class="fa fa-database"></i>
                                            </div>
                                            <p class="card-category">Minor</p>
                                            <h3 class="card-title" style="font-size: 17px;"><%= SeverityActiveStore.Rows[2][0].ToString() %></h3>
                                        </div>
                                        <div class="card-footer" style="padding-top: 14px; margin-bottom: 7px;margin-top:2px;">
                                            <div class="stats">
                                                <%--<i style="font-size: 18px" class="fa fa-chalkboard"></i>&nbsp;Mirror:&nbsp; <b style="font-weight: bold"><%=DBInstance[1].ToString() %></b>--%>
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
            //$('.carousel').carousel({
            //    interval: 1000 * 20
            //});
        });

    </script>
   <%-- <!-- Processor Utilizarion -->
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
    </script>--%>



    <!-- -->
  


</body>
</html>
