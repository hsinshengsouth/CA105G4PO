<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.billboard.model.*"%>
<%@page import="java.util.*"%>

<%
	BillboardVO bbVO = (BillboardVO) request.getAttribute("bbVO");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Add Billboard</title>

<!-- Bootstrap core CSS-->
<link href="<%=request.getContextPath()%>/back-end/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="<%=request.getContextPath()%>/back-end/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Page level plugin CSS-->
<link href="<%=request.getContextPath()%>/back-end/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<%=request.getContextPath()%>/back-end/css/sb-admin.css" rel="stylesheet">
<style>
.container {
	margin-left: -13px;
	padding: 10px;
}

img {
	max-width: 400px;
	max-height: 250px;
}
</style>



</head>

<body id="page-top">

		<!-- Navbar -->

 <jsp:include page="/back-end/navbar.jsp" />
 
 <!-- /Navbar -->

	<div id="wrapper">

	
	  <!-- Sidebar -->
  
  <jsp:include page="/back-end/sidebar.jsp" />
  
  <!-- /Sidebar -->

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Dashboard</a>
					</li>
					<li class="breadcrumb-item active">新增輪播廣告</li>
				</ol>

				<!-- Page Content 這邊開始自由發揮-->

				<%--錯誤列表 --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">請修正以下錯誤</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>


				<br>

				<div class="container">
					<div class="row">
						<div class="col-sm-7 offset-sm-3 ">

							<form method="post" action="bb.do" name="insertbbform"
								class="form-horizontal justify-content-center"
								enctype="multipart/form-data">


								<div class="form-row">
									<div class="form-group">
										<label for="aa">欲前往頁面的URL:</label> <input type="text"
											name="url" id="url" placeholder="請輸入URL"
											class="form-control" style="width: 200px">
									</div>

							
								</div>


								<div class="form-row">
									<div class="form-group" style="margin-right: 15px">
										<label for="aa">開始時間:</label> <input type="text" name="bbStart"
											id="f_date1" class="form-control"
											style="width: 180px">
									</div>




									<div class="form-group">
										<label for="aa">結束時間:</label> <input type="text" name="bbEnd"
											id="f_date2"  class="form-control"
											style="width: 180px">
									</div>

								</div>
									
								<br>
				
								<div class="form-row">
									<div class="form-row" style="margin-bottom: 15px">
										<img id="blah" />
									</div>

									<div class="input-group mb-3 form-group">
										<div class="custom-file">

											<input class="custom-file-input" id="inputGroupFile01"
												name="bbPic" multiple type="file"> <label
												class="custom-file-label" for="inputGroupFile01"
												id="labelPicName">上傳輪播廣告 file</label>

										</div>
										<div class="input-group-append">
											<span class="input-group-text" id="">Upload</span>
										</div>

									</div>

								</div>


								<div class="col-12 text-center">
									<input type="hidden" name="action" value="insert"> <input
										class="btn btn-primary" type="submit" value="送出新增">
									<button class="btn btn-primary">
										<a href="<%=request.getContextPath()%>/back-end/billboard/listAllBillBoard.jsp"  style="color:#fff">返回</a>
									</button>
								</div>

							</form>

							<!--解決按鈕置中的問題 https://stackoverflow.com/questions/41664991/bootstrap-4-how-do-i-center-align-a-button -->

						</div>
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
	<script src="<%=request.getContextPath()%>/back-end/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/back-end/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="<%=request.getContextPath()%>/back-end/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath()%>/back-end/js/sb-admin.min.js"></script>

</body>
<% 
  java.sql.Date date = null;
  try {
	    date = bbVO.getbbStart();
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
	$(function() {

		$(document).ready(function() {
			$('#inputGroupFile01').on('change', function(event) {
				// and you can get the name of the image like this:
				console.log(event.target.files[0].name);
				$('#labelPicName').text(event.target.files[0].name);
			});
		});

		$("#inputGroupFile01").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#blah').attr('src', e.target.result);
				}

				reader.readAsDataURL(this.files[0]);

			}
		});
	});
	
	

    $.datetimepicker.setLocale('zh');
    $('#f_date1').datetimepicker({
       theme: '',              //theme: 'dark',
       timepicker:false,       //timepicker:true,
       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
	   value: '<%=date%> 	', // value:   new Date(),
//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
//startDate:	            '2017/07/10',  // 起始日
//minDate:               '-1970-01-01', // 去除今日(不含)之前
//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
});
$('#f_date2').datetimepicker({
	theme : '', //theme: 'dark',
	timepicker : false, //timepicker:true,
	step : 1, //step: 60 (這是timepicker的預設間隔60分鐘)
	format : 'Y-m-d H:i:s', //format:'Y-m-d H:i:s',
	value :<%=str%>, // value:   new Date(),
//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
//startDate:	            '2017/07/10',  // 起始日
	minDate:               '-1970-01-01', // 去除今日(不含)之前
//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
});
	
	
</script>



</html>