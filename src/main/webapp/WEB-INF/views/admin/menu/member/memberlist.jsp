<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>ADMIN</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN core-css ================== -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/css/vendor.min.css" rel="stylesheet" />
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/css/default/app.min.css" rel="stylesheet" />
	<!-- ================== END core-css ================== -->
	
	<!-- ================== BEGIN page-css ================== -->
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/jvectormap-next/jquery-jvectormap.css" rel="stylesheet" />
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/bootstrap-calendar/css/bootstrap_calendar.css" rel="stylesheet" />
	<link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/nvd3/build/nv.d3.css" rel="stylesheet" />
    <link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />
	<!-- ================== END page-css ================== -->
	
</head>
<body>
	<!-- BEGIN #loader -->
	<div id="loader" class="app-loader">
		<span class="spinner"></span>
	</div>
	<!-- END #loader -->
	<!-- BEGIN #app -->
	<div id="app" class="app app-header-fixed app-sidebar-fixed">
	<jsp:include page="../../inc/header.jsp" />

		<jsp:include page="../../inc/sidebar.jsp" />
		
		<!-- BEGIN #content -->
		<div id="content" class="app-content">

			<!-- BEGIN row -->
			<div class="row">
				<!-- BEGIN col-12 -->
				<div class="col-xl-12">
					<!-- BEGIN panel -->
					<div class="panel panel-inverse">
						<!-- BEGIN panel-heading -->
						<div class="panel-heading">
							<h4 class="panel-title">?????? ??????</h4>
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<!-- END panel-heading -->
						<!-- BEGIN panel-body -->
						<div class="panel-body">
							<table id="data-table-responsive" class="table table-striped table-bordered align-middle">
								<thead>
									<tr>
										<th width="10%">????????????</th>
										<th width="20%" data-orderable="true">?????????</th>
										<th class="text-nowrap">?????????</th>
										<th class="text-nowrap">??????</th>
										<th class="text-nowrap">????????????</th>
										<th class="text-nowrap">????????????</th>
										<th class="text-nowrap">?????????</th>
										<th width="5%"></th>
										<th width="5%"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${list }" varStatus="status">
										<tr>
											<td>${vo.mem_no }</td>
											<td>${vo.id }</td>
											<td>${vo.nickname }</td>
											<td>${vo.name }</td>
											<td>${vo.birth_date }</td>
											<td>${vo.phone }</td>
											<td>${vo.reg_date }</td>
											<td class="text-center"><a href="${pageContext.request.contextPath }/admin/member/delete?mem_no=${vo.mem_no }" class="btn btn-sm btn-primary w-60px me-1">??????</a></td>
											<td class="text-center"><a href="#modal-dialog" class="open_modal btn btn-sm btn-white w-60px" data-bs-toggle="modal" 
											data-mem_no="${vo.mem_no}" data-id="${vo.id}" data-nickname="${vo.nickname}" data-name="${vo.name}" 
											data-birth_date="${vo.birth_date}" data-phone="${vo.phone}" data-reg_date="${vo.reg_date}">??????</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- END panel-body -->
					</div>
					<!-- END panel -->
				</div>
				<!-- END col-12 -->
			</div>
			<!-- END row -->
		</div>
		<!-- END #content -->
		
		<!-- BEGIN scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top" data-toggle="scroll-to-top"><i class="fa fa-angle-up"></i></a>
		<!-- END scroll to top btn -->

		<!-- #modal-dialog -->
		<div class="modal fade" id="modal-dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">???????????? ??????</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
			</div>
			<div class="modal-body">
				<form method="post" id="member_form" action="${pageContext.request.contextPath}/admin/member/update">
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">?????? ??????</label>
							<div class="col-md-9">
								<input type="text" id="mem_no" name="mem_no" class="form-control mb-5px" readonly/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">?????? ?????????</label>
							<div class="col-md-9">
								<input type="text" id="id" name="id" class="form-control mb-5px" readonly/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">?????????</label>
							<div class="col-md-9">
								<input type="text" id="nickname" name="nickname" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">??????</label>
							<div class="col-md-9">
								<input type="text" id="name" name="name" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">????????????</label>
							<div class="col-md-9">
								<input type="text" id="birth_date" name="birth_date" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">????????????</label>
							<div class="col-md-9">
								<input type="text" id="phone" name="phone" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3">?????????</label>
							<div class="col-md-9">
								<input type="text" id="reg_date" name="reg_date" class="form-control mb-5px" readonly/>
							</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">??????</a>
				<a href="#" id="submitBtn" class="btn btn-success">??????</a>
			</div>
			</div>
		</div>
		</div>
		
	</div>
	<!-- END #app -->
	
	<!-- ================== BEGIN core-js ================== -->
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/js/vendor.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/js/app.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/js/theme/default.min.js"></script>
	<!-- ================== END core-js ================== -->
	
	<!-- ================== BEGIN page-js ================== -->
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/d3/d3.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/nvd3/build/nv.d3.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/jvectormap-next/jquery-jvectormap.min.js"></script>
	<script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/jvectormap-next/jquery-jvectormap-world-mill.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src=" ${pageContext.request.contextPath}/static/admin/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	<!-- ================== END page-js ================== -->
    <!-- script -->
    <script>
		$(document).on("click", ".open_modal", function () {
			var mem_no= $(this).data('mem_no');
			var id = $(this).data('id');
			var nickname = $(this).data('nickname');
			var name = $(this).data('name');
			var birth_date= $(this).data('birth_date');
			var phone= $(this).data('phone');
			var reg_date= $(this).data('reg_date');
			$("#mem_no").val(mem_no);
			$("#id").val(id);
			$("#nickname").val(nickname);
			$("#name").val(name);
			$("#birth_date").val(birth_date);
			$("#phone").val(phone);
			$("#reg_date").val(reg_date);
		});

		$(document).on("click", "#submitBtn" , function (){
			$("#member_form").submit();
		});
		
    	$('#data-table-responsive').DataTable({
        	responsive: true,
			lengthMenu: [10,20,30,50],
			language: {
            emptyTable: "???????????? ????????????.",
            lengthMenu: "???????????? _MENU_ ?????? ??????",
            info: "?????? _START_ - _END_ / _TOTAL_???",
            infoEmpty: "????????? ??????",
            infoFiltered: "( _MAX_?????? ??????????????? ???????????? )",
            search: "",
            zeroRecords: "???????????? ???????????? ????????????.",
            loadingRecords: "?????????...",
            processing: "????????? ????????? ?????????.",
            paginate: {
              next: "??????",
              previous: "??????",
            },
          	},
    	});

    </script>
</body>
</html>