<%@page import="com.roomType.model.RoomTypeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
RoomTypeVO rtVO = (RoomTypeVO) request.getAttribute("rtVO");
%>

<%-- <%= ordVO == null %> --%>
<%-- --${ordVO.ordID}-- --%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Update RoomType</title>

<!-- Bootstrap core CSS-->
<link
	href="<%=request.getContextPath()%>/back-end/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template-->
<link
	href="<%=request.getContextPath()%>/back-end/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="<%=request.getContextPath()%>/back-end/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<%=request.getContextPath()%>/back-end/css/sb-admin.css"
	rel="stylesheet">


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
					<li class="breadcrumb-item active">修改房型</li>
				</ol>

				<!-- Page Content 這邊開始自由發揮-->
				<h1>修改訂單資料</h1>
				<hr>
				<div class="container-fluid" >
				<br>
					<div class="row">
						<div class="col-xs-12 col-sm-5">
							
						</div>
						<div class="col-xs-12 col-sm-2">
							
								<c:if test="${not empty errorMsgs}">
									<font style="color:red">請修正以下錯誤:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color:red">${message}</li>
										</c:forEach>
									</ul>
								</c:if>		
											
						</div>
						<div class="col-xs-12 col-sm-5">
							
						</div>
					</div>
					<div class="row" >  
						<div class="col-xs-12 col-sm-3">
							
						</div>
						<div class="col-xs-12 col-sm-6">
							<div align="center">
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/roomType/roomType.do" name="form1" enctype="multipart/form-data">
								<table>
									<tr>
										<td>房型編號:</td>
										<td><input type="TEXT" name="rtID" size="45" class="form-control" 
											 value="<%= rtVO.getRtID() %>" readonly="true"/></td>
									</tr>
									<tr>
										<td>分店編號:</td>
										<td><input type="TEXT" name="braID" size="45" class="form-control"
											 value="<%= rtVO.getBraID() %>" /></td> 
									</tr>
									<tr>
										<td>房型名稱:</td>
										<td><input type="TEXT" name="rtName" size="45" class="form-control"
											 value="<%= rtVO.getRtName() %>" /></td>
									</tr>
									<tr>
										<td>房型照片:</td>
										<td><img src="<%=request.getContextPath()%>/roomType/roomTypeImg.do?rtID=${rtVO.rtID}" id="previewpic" 
											 class="img-fluid" width="300px">
  										</td>
									</tr>
									<tr>
										<td></td>
										<td>
										    <input type="file" name="rtPic"  id="inputfile01">
  										</td>
									</tr>
									<tr>
										<td>房型介紹:</td>
										<td><input type="TEXT" name="rtIntro" size="45" class="form-control"
											 value="<%= rtVO.getRtIntro() %>" /></td>
									</tr>
									<tr>
										<td>一般住房人數:</td>
										<td><input type="TEXT" name="rtMinimum" size="45" class="form-control"
											 value="<%= rtVO.getRtMinimum() %>" /></td>
									</tr>
									<tr>
										<td>住房上限人數:</td>
										<td><input type="TEXT" name="rtLimit" size="45" class="form-control"
											 value="<%= rtVO.getRtLimit() %>" /></td>
									</tr>
									<tr>
										<td>平日價格:</td>
										<td><input type="TEXT" name="weeklyPrice" size="45" class="form-control"
											 value="<%= rtVO.getWeeklyPrice() %>" /></td>
									</tr>
									<tr>
										<td>假日價格:</td>
										<td><input type="TEXT" name="holidayPrice" size="45" class="form-control"
											 value="<%= rtVO.getHolidayPrice() %>" /></td>										
									</tr>
									<tr>
										<td>房型數量:</td>
										<td><input type="TEXT" name="total" size="45" class="form-control"
											 value="<%= rtVO.getTotal() %>" /></td>
									</tr>
								</table>
								<br>
									<input type="hidden" name="action" value="update">
									<input type="hidden" name="rtID" value="<%= rtVO.getRtID() %>">
									<input type="submit" value="送出修改" class="btn btn-info" >
									<button type="button" class="btn btn-info">
										<a href='<%=request.getContextPath()%>/back-end/roomType/select_roomType_page.jsp' style="color:#fff">返回</a>
									</button>
								</FORM>							
							</div>
						</div>
						<div class="col-xs-12 col-sm-3">
							
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
		<!-- /.content-wrapper -->

	</div>
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
	<script
		src="<%=request.getContextPath()%>/back-end/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/back-end/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%=request.getContextPath()%>/back-end/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath()%>/back-end/js/sb-admin.min.js"></script>
	
	<script>
		$("#inputfile01").change(function(){
	        if (this.files && this.files[0]) {
	                var reader = new FileReader();
	                
	                reader.onload = function (e) {
	                        $('#previewpic').attr('src', e.target.result);
	                }
	                
	                reader.readAsDataURL(this.files[0]);
	        }
		});
	</script>
</body>

</html>
