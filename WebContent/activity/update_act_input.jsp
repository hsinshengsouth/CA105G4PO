<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.activity.model.*"%>
<%@page import="java.util.*"%>

<%
	ActivityVO actVO = (ActivityVO) request.getAttribute("actVO");//ActServlet.java (Concroller) 取出req的actVO物件 (包括幫忙取出的actVO, 也包括輸入資料錯誤時的actVO物件)
%>


<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Update Activity</title>

<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<style>
</style>
</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="index.html">M.C.P.I.G villa</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <span
					class="badge badge-danger">9+</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="alertsDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow mx-1"><a
				class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <span
					class="badge badge-danger">7</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="messagesDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">Settings</a> <a
						class="dropdown-item" href="#">Activity Log</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal">Logout</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">

			<!-- profile pic Gina -->
			<div class="profile_pic">
				<img
					src="https://api.fnkr.net/testimg/1200x1200/00CED1/FFF/?text=img+placeholder"
					class="img-circle profile_img">
			</div>

			<li class="nav-item active"><a class="nav-link"
				href="index.html"> <i class="fa fa-home"></i> <span>當日房況一覽</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>Check
						In/Out</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">入住:</h6>
					<a class="dropdown-item" href="blank.html">Check In</a> <a
						class="dropdown-item" href="blank.html">新增會員</a> <a
						class="dropdown-item" href="blank.html">新增訂單</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">退房:</h6>
					<a class="dropdown-item" href="blank.html">Check Out</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown2"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>訂單管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown2">
					<h6 class="dropdown-header">新增/查詢:</h6>
					<a class="dropdown-item" href="blank.html">查詢訂單</a> <a
						class="dropdown-item" href="blank.html">新增訂單</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">列表:</h6>
					<a class="dropdown-item" href="tables.html">一般訂單列表</a> <a
						class="dropdown-item" href="tables.html">打工換宿訂單列表</a> <a
						class="dropdown-item" href="tables.html">退訂訂單列表</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>打工需求管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown3">
					<h6 class="dropdown-header">新增/查詢:</h6>
					<a class="dropdown-item" href="blank.html">新增需求</a> <a
						class="dropdown-item" href="blank.html">查詢需求</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">列表:</h6>
					<a class="dropdown-item" href="tables.html">打工需求列表</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>房型管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown3">
					<h6 class="dropdown-header">新增:</h6>
					<a class="dropdown-item" href="blank.html">新增房型</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">列表:</h6>
					<a class="dropdown-item" href="tables.html">房型列表</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>房間管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown3">
					<h6 class="dropdown-header">新增/查詢:</h6>
					<a class="dropdown-item" href="blank.html">新增房間</a> <a
						class="dropdown-item" href="blank.html">查詢房間</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">房況一覽</h6>
					<a class="dropdown-item" href="index.html">當日</a> <a
						class="dropdown-item" href="blank.html">選擇日期</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>會員管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown3">
					<h6 class="dropdown-header">新增/查詢:</h6>
					<a class="dropdown-item" href="blank.html">新增會員</a> <a
						class="dropdown-item" href="blank.html">查詢會員</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">列表:</h6>
					<a class="dropdown-item" href="tables.html">會員列表</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>員工管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown3">
					<h6 class="dropdown-header">新增:</h6>
					<a class="dropdown-item" href="blank.html">新增員工</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">列表:</h6>
					<a class="dropdown-item" href="tables.html">員工列表</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>前台網頁管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown3">
					<h6 class="dropdown-header">輪播看板:</h6>
					<a class="dropdown-item" href="blank.html">新增</a> <a
						class="dropdown-item" href="table.html">列表</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">廣告彈跳:</h6>
					<a class="dropdown-item" href="blank.html">新增</a> <a
						class="dropdown-item" href="table.html">列表</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>促銷活動管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown3">
					<h6 class="dropdown-header">新增:</h6>
					<a class="dropdown-item" href="blank.html">新增活動</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">列表:</h6>
					<a class="dropdown-item" href="table.html">促銷活動列表</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>優惠劵管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown3">
					<h6 class="dropdown-header">新增:</h6>
					<a class="dropdown-item" href="blank.html">新增優惠劵</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">列表:</h6>
					<a class="dropdown-item" href="table.html">優惠劵列表</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>檢舉管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown3">
					<h6 class="dropdown-header">文章檢舉:</h6>
					<a class="dropdown-item" href="blank.html">被檢舉文章列表</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">留言檢舉:</h6>
					<a class="dropdown-item" href="table.html">被檢舉留言列表</a>
				</div></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown3"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fa fa-edit"></i> <span>分店管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown3">
					<h6 class="dropdown-header">新增:</h6>
					<a class="dropdown-item" href="blank.html">新增分店</a>
					<div class="dropdown-divider"></div>
					<h6 class="dropdown-header">列表:</h6>
					<a class="dropdown-item" href="table.html">分店列表</a>
				</div></li>
			<li class="nav-item dropdown"><a class="nav-link"
				href="blank.html"> <i class="fa fa-edit"></i> <span>客服Q&A</span>
			</a></li>
		</ul>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Dashboard</a>
					</li>
					<li class="breadcrumb-item active">修改促銷活動</li>
				</ol>

				<!-- Page Content 這邊開始自由發揮-->
				<%-- 錯誤表列 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>




				<h3>修改一筆促銷活動</h3>
				<div class="container">
					<div class="row">

						<form METHOD="post" ACTION="act.do"
							class="form-inline form-horizontal" name="updateform">
							<table class="table table-hover">
								<tr>
									<td>促銷活動編號:<font color=red><b>*</b></font></td>
									<td><%=actVO.getActID()%></td>
								</tr>
								<tr>
									<td>促銷活動名稱</td>
									<td><input class="form-control " type="TEXT"
										name="actName" value="<%=actVO.getActName()%>" /></td>
								</tr>

								<tr>
									<td>促銷活動開始時間</td>
									<td><input name="actStart" id="f_date1" type="text"
										class="form-control " /></td>
								</tr>


								<tr>
									<td>促銷活動結束時間</td>
									<td><input name="actEnd" id="f_date2" type="text"
										class="form-control " /></td>
								</tr>

							</table>

							<div class="col-xs-12 col-sm-8">
								<input type="hidden" name="action" value="update"> <input
									type="hidden" name="actID" value="<%=actVO.getActID()%>">
							</div>
							<button class="btn btn-info" type="submit">送出修改</button>

						</form>




					</div>
				</div>















				<!-- Page Content 這邊開始自由發揮結束-->
			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->
			<footer class="sticky-footer">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright © Your Website 2018</span>
					</div>
				</div>
			</footer>
		</div>

	</div>
	<!-- /.content-wrapper -->

	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>





	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin.min.js"></script>

</body>

<%
	java.sql.Date date = null;
	try {
		date = actVO.getActStart();
	} catch (Exception e) {
		date = new java.sql.Date(System.currentTimeMillis());
	}

	String str = null;
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=str%>
	', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
	$('#f_date2').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : false, //timepicker:true,
		step : 1, //step: 60 (這是timepicker的預設間隔60分鐘)
		format : 'Y-m-d', //format:'Y-m-d H:i:s',
		value :
<%=str%>
	, // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	//startDate:	            '2017/07/10',  // 起始日
	//minDate:               '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});

	// ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

	//      1.以下為某一天之前的日期無法選擇
	//      var somedate1 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      2.以下為某一天之後的日期無法選擇
	//      var somedate2 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
	//      var somedate1 = new Date('2017-06-15');
	//      var somedate2 = new Date('2017-06-25');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//		             ||
	//		            date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});
</script>

</html>