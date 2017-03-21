<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>SuperIntendance </title>

	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css"/> 
 	<link rel="stylesheet" type="text/css" href="Css/stylesheet.css"/>
 	<link rel="stylesheet" type="text/css" href="Css/jquery-confirm.css"/>
 	<link rel="stylesheet" type="text/css" href="Css/select2.css"/>
 	<script type="text/javascript" src="Js/jquery.js"></script> 
 	<script type="text/javascript" src="Js/bootstrap.js"></script>
 	<script type="text/javascript" src="Js/select2.js"></script>
 	<script type="text/javascript" src="Js/jquery-confirm.js"></script>
	<script type="text/javascript" src="Js/general.js"></script>

    <!-- Bootstrap -->
    <link href="Css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="Css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="Css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="#" class="site_title"><i class="fa fa-laptop"></i> <span>SuperIntendance Portal</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
                <img src="img/profile.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>${key}</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li>
                        <a class="ajax_load" ref="viewquery.html?page=1" id="dashboard_link"><span class="glyphicon glyphicon-home"></span> Dashboard</a>
                      </li>
                      <li>
                        <a class="ajax_load" ref="viewdb.html?page=1"><span class="glyphicon glyphicon-th-list"></span> Manage DB</a>
                      </li>
                      <li>
                        <a class="ajax_load" ref="reportconfig.html"><span class="glyphicon glyphicon-cog"></span> Generate Report</a>
                      </li>
                      <li>
                        <a ref="viewreport.html?page=1" class="ajax_load"><span class="glyphicon glyphicon-list-alt"></span> View Reports</a>
                      </li>
                      <li>
                        <a ref="scheduler.html" class="ajax_load"><span class="glyphicon glyphicon-time"></span> Schedule Report</a>
                      </li>
                      <li>
                        <a ref="dummy.html" class="ajax_load">Coming Soon...</a>
                      </li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Client Tab <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a ref="viewclients.html?page=1" class="ajax_load"><span class="glyphicon glyphicon-list-alt"></span>Client Accounts</a></li>
                      <li><a href="#">Today's Attempts</a></li>
                      <li><a href="#">General Audit</a></li>
                      <li><a href="#">Blah Blah</a></li>
                    </ul>
                  </li> 
                  <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="#">General Form</a></li>
                    </ul>
                  </li>                  
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
          	<span id="session_url" style="display: none">
			<% 
				String url = (String) session.getAttribute("url"); 
				if(!(url.equals(""))) 
					out.println(url); 
			%>
			</span>
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="img/profile.jpg" alt="">${key}
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="logout.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">1</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="img/profile.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>                   
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>

        <div class="right_col" role="main" id="content_div">
        </div>

        <footer>
          <div class="pull-right">
            Galaxy Template for Maintenance by <a href="https://github.com/vats512">Vatsal</a>
          </div>
          <div class="clearfix"></div>
        </footer>

    <!-- jQuery -->
    <script src="Js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="Js/bootstrap.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="Js/custom.min.js"></script>

  </body>
</html>
          </div>
        </div>
        <!-- /top navigation -->

