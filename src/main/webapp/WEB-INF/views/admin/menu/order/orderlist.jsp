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
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
										<th class="text-center text-nowrap" width="15%">????????????</th>
										<th class="text-center text-nowrap" width="10%" data-orderable="true">????????????</th>
										<th class="text-center text-nowrap">??????</th>
										<th class="text-center text-nowrap">????????????</th>
										<th class="text-center text-nowrap">????????????</th>
										<th class="hide"></th>
										<th class="text-center text-nowrap" class="text-nowrap">????????????</th>
										<th class="text-center text-nowrap" width="10%">????????????</th>
										<!--  <th width="5%"></th>
										<th width="5%"></th>-->
									</tr>
								</thead>
								<tbody id="tbody">
									<c:forEach var="vo" items="${list }" varStatus="status">
										<tr>
											<td class="od_no text-center">${vo.order_no }</td>
											<td class="text-center">${vo.mem_no }</td>
											<td class="td text-center">${vo.tot_price } ???</td>
											<td class="text-center">${vo.order_date }</td>
											<c:choose>
												<c:when test="${vo.order_status=='?????? ?????????' }">
													<td class="text-center">
													<button class="btn btn-md btn-success w-120px me-1" onclick="changeStatus(${vo.order_no})">
													${vo.order_status }</button></td>
												</c:when>
												<c:when test="${vo.order_status=='?????????' }">
													<td class="text-center">
													<button class="btn btn-md btn-warning w-120px me-1" onclick="changeStatus2(${vo.order_no})">
													${vo.order_status }</button></td>
												</c:when>
												<c:otherwise>
													<td class="text-center">${vo.order_status }</td>
												</c:otherwise>
											</c:choose>
											<td class="hide">${vo.mid_num }</td>
											<c:choose>
												<c:when test="${vo.order_status=='?????? ??????' }">
													<td class="text-center"><button class="btn btn-md btn-primary w-120px me-1" onclick="payback(${vo.order_no})">?????? ??????</button></td>
													
												</c:when>
												<c:when test="${vo.od_cc_status=='?????? ??????' }">
													<td class="text-center"><button class="btn btn-md btn-primary w-120px me-1" onclick="paybackReturn(${vo.order_no})">?????? ??????</button></td>
													
												</c:when>
												<c:otherwise>
													<td class="text-center">${vo.od_cc_status }</td>
												</c:otherwise>
											</c:choose>
											<td class="text-center"><a href="${pageContext.request.contextPath }/" class="open_modal btn btn-md btn-white w-120px">????????????</a></td>
											
											<!--  <td><a href="${pageContext.request.contextPath }/admin/cate/delete?order_no=${vo.order_no }" class="btn btn-sm btn-primary w-60px me-1">??????</a></td>
											<td><a href="#modal-dialog" class="open_modal btn btn-sm btn-white w-60px" data-bs-toggle="modal" 
											data-order_no="${vo.order_no}" data-mem_no="${vo.mem_no}" data-order_num="${vo.order_num}" data-tot_price="${vo.tot_price}"
											data-order_date="${vo.order_date}" data-order_status="${vo.order_status}">??????...?</a></td>-->
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
				<h4 class="modal-title">?????? ??????</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
			</div>
			<div class="modal-body">
				<form method="post" id="" action="${pageContext.request.contextPath}/admin/cate/update">
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3"></label>
							<div class="col-md-9">
								<input type="text" id="" class="form-control mb-5px" readonly/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3"></label>
							<div class="col-md-9">
								<input type="text" id="" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3"></label>
							<div class="col-md-9">
								<input type="text" id="" class="form-control mb-5px"/>
							</div>
					</div>
					<div class="row mb-15px">
						<label class="form-label col-form-label col-md-3"></label>
							<div class="col-md-9">
								<input type="text" id="" class="form-control mb-5px"/>
							</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">??????</a>
				<a href="javascript:;" class="btn btn-success">??????</a>
			</div>
			</div>
		</div>
		</div>
		<div id="today"></div>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    
    <script>
		
	/*$(document).on("click", ".open_modal", function () {
			data-order_no="${vo.order_no}" data-mem_no="${vo.mem_no}" data-order_num="${vo.order_num}" data-tot_price="${vo.tot_price}"
											data-order_date="${vo.order_date}" data-order_status="${vo.order_status}
			var order_no = $(this).data('order_no');
			var mem_no = $(this).data('mem_no');
			var order_num = $(this).data('order_num');
			var tot_price = $(this).data('tot_price');
			var order_date = $(this).data('order_date');
			var tot_price = $(this).data('tot_price');
			
			$("#category_id").val(id);
			$("#category_name").val(name);
			$("#category_parent").val(parent);
			$("#category_order").val(order);
		});

		$(document).on("click", "" , function (){

		});*/
		
    	$('#data-table-responsive').DataTable({
        	responsive: true,
			lengthMenu: [10,20,30,50],
			order: [ [ 0, "desc" ] ],
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
    	

    	function payback(order_no){	
    		var a = $(".od_no");
    		var today=moment().format("YYYY-MM-DD");
    		var mid="";
    		var mem_no=0;
			var tot_price=0;
    		a.each(function(i) {
    			if(a.eq(i).text()==order_no){
    				console.log(a.eq(i).parent().children().eq(5).text());
    				mid=a.eq(i).parent().children().eq(5).text();
    				mem_no=a.eq(i).parent().children().eq(1).text();
    				tot_price=a.eq(i).parent().children().eq(2).text();
    				console.log(a.eq(i).parent().children().eq(2).text());
    				console.log(mem_no);
    			}
    		});
    		var result = confirm(mem_no+"??? ????????? ????????????: "+tot_price+"??? ?????? ?????? ???????????????????");
			console.log(mem_no+"ddd");
			console.log(today);
			if(result){
				$.ajax({
			    	// ???: http://www.myservice.com/payments/cancel
			      "url": "${pageContext.request.contextPath}/order/payback1",
			      "type": "POST",
			      "data": { "mid" : mid, 
				        // ???: ORD20180131-0000011
				        "order_no":order_no,
				        "od_cc_complete_date": today,
				        "cancel_request_amount": 100, // ????????????
				        "reason": "?????? ??????", 
				        // ????????????
				        "refund_holder": "?????????", 
				        // [???????????? ????????? ????????????] ?????? ???????????? ?????????
				        "refund_bank": "88", 
				        // [???????????? ????????? ????????????] ?????? ???????????? ????????????(???: KG??????????????? ?????? ??????????????? 88???)
				        "refund_account": "56211105948400" // [???????????? ????????? ????????????] ?????? ???????????? ??????
				  		},
			      "dataType": "json",
			      success:function(data){
						 alert("?????? ????????? ?????? ???????????????.");
						 location.href="${pageContext.request.contextPath }/admin/order/orderlist";
						 $("#today").append(
							`
							<input type="hidden" name="today" value="\${today}">
							`
						 )
					 },error:function(request, status, error){

							alert("code:"+request.status+"error:"+error);

						}
					 
			    });
			}else{
				 event.preventDefault ();
			}
			
			
		};
		
		  
		function paybackReturn(order_no){	
    		var a = $(".od_no");
    		var today=moment().format("YYYY-MM-DD");
    		var mid="";
    		var mem_no=0;
			var tot_price=0;
    		a.each(function(i) {
    			if(a.eq(i).text()==order_no){
    				console.log(a.eq(i).parent().children().eq(5).text());
    				mid=a.eq(i).parent().children().eq(5).text();
    				mem_no=a.eq(i).parent().children().eq(1).text();
    				tot_price=a.eq(i).parent().children().eq(2).text();
    				console.log(a.eq(i).parent().children().eq(2).text());
    				console.log(mem_no);
    			}
    		});
    		var result = confirm(mem_no+"??? ????????? ????????????: "+tot_price+"??? ?????? ?????? ???????????????????");
			console.log(mem_no+"ddd");
			console.log(today);
			if(result){
				$.ajax({
			    	// ???: http://www.myservice.com/payments/cancel
			      "url": "${pageContext.request.contextPath}/order/payback2",
			      "type": "POST",
			      "data": { "mid" : mid, 
				        // ???: ORD20180131-0000011
				        "order_no":order_no,
				        "od_cc_complete_date": today,
				        "cancel_request_amount": 100, // ????????????
				        "reason": "?????? ??????", 
				        // ????????????
				        "refund_holder": "?????????", 
				        // [???????????? ????????? ????????????] ?????? ???????????? ?????????
				        "refund_bank": "88", 
				        // [???????????? ????????? ????????????] ?????? ???????????? ????????????(???: KG??????????????? ?????? ??????????????? 88???)
				        "refund_account": "56211105948400" // [???????????? ????????? ????????????] ?????? ???????????? ??????
				  		},
			      "dataType": "json",
			      success:function(data){
						 alert("?????? ????????? ?????? ???????????????.");
						 location.href="${pageContext.request.contextPath }/admin/order/orderlist";
						 $("#today").append(
							`
							<input type="hidden" name="today" value="\${today}">
							`
						 )
					 },error:function(request, status, error){

							alert("code:"+request.status+"error:"+error);

						}
					 
			    });
			}else{
				 event.preventDefault ();
			}
			
			
		};  

		function changeStatus(order_no){
			var result = confirm("?????? ????????? '?????????' ?????? ?????????????????????????");
			if(result){
				location.href="${pageContext.request.contextPath}/admin/order/changeStatus?order_no="+order_no;
			}else{
				 event.preventDefault ();
			}
		}
		  
 		function changeStatus2(order_no){
 			var result = confirm("?????? ????????? '?????? ??????' ??? ?????????????????????????");
			if(result){
				location.href="${pageContext.request.contextPath}/admin/order/changeStatus2?order_no="+order_no;
			}else{
				 event.preventDefault ();
			}	  
		}

    </script>
</body>
</html>