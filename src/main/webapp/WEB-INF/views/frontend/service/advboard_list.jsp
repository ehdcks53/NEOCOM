<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>neocom</title>
<!-- SEO Meta Tags-->
<meta name="description"
	content="Unishop - Universal E-Commerce Template">
<meta name="keywords"
	content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
<meta name="author" content="Rokaux">
<!-- Favicon and Apple Icons-->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/neocom_favicon.ico">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/neocom_favicon.png">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="167x167"
	href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-ipad-retina.png">
<!-- Vendor Styles including: Bootstrap, Font Icons, Plugins, etc.-->
<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/static/frontend/assets/css/vendor.min.css">
<!-- Main Template Styles-->
<link id="mainStyles" rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/static/frontend/assets/css/styles.min.css">
<!-- Modernizr-->
<script
	src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>
<style>
a {
	text-decoration: none;
	color: black;
}
.table {
	margin-left: auto;
	margin-right: auto;
}
.table tbody tr td {
	height: 50px;
	vertical-align: middle;
}
.table tbody tr td img {
	width: 20px;
}
</style>
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp" />


	<!-- ????????? ????????? -->
	<div class="page-title">
		<div class="container">
			<div class="column">
				<h1>?????????????????????</h1>
			</div>
			<div class="column">
				<ul class="breadcrumbs">
					<!-- ????????? ?????? ??????????????? -->
					<li><a href="#">Home</a></li>
					<li class="separator">&nbsp;</li>
					<li><a href="#">Service</a></li>
					<li class="separator">&nbsp;</li>
					<li>Advice Board</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- ????????? ????????? ??? -->


	<!-- ????????? ????????? -->
	<div class="container padding-bottom-3x mb-2">
		<div class="row">
			<div class="col-lg-12 col-md-10 order-md-2 text-center">
				<div>
					<div>
						<form
							action="${pageContext.request.contextPath}/service/advboard_list"
							method="post">
							<div class="row">
								<div class="p-2"></div>
								<select class="form-control col-sm-2 p-2" name="field">
									<option value="nickname"
										<c:if test="${field=='nickname'}">selected</c:if>>?????????</option>
									<option value="adv_title"
										<c:if test="${field=='adv_title'}">selected</c:if>>??????</option>
									<option value="adv_content"
										<c:if test="${field=='adv_content'}">selected</c:if>>??????</option>
									<option value="combined"
										<c:if test="${field=='combined'}">selected</c:if>>??????+??????</option>
								</select> <input type="text" class="form-control col-sm-3 p-1"
									value="${keyword}" name="keyword">
								<button type="submit" class="form-control col-sm-1 w-1 p-2">??????</button>
								<div class="ml-md-auto" style="margin-right: 20px;">
									<button type="button" id="insertBtn"
										class="form-control btn-sm btn-outline-info"
										onclick="clickInsert()">
										???????????? <i class="icon-arrow-right-circle"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="mb-3"></div>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th style="width: 100px;">?????????</th>
								<th style="width: 500px;">??????</th>
								<th style="width: 100px;">?????????</th>
								<th style="width: 140px;">????????????</th>
								<th style="width: 100px;">?????????</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${advboardlist}">
								<tr>

					<c:choose>
						<c:when test="${item.adv_show eq true}">
							<td></td>	
							<td colspan="4" class="text-left">
								<span style="color:gray;">
									<c:if test="${item.adv_group_depth >0 }">
										<c:forEach var="i" begin="1" end="${item.adv_group_depth }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</c:forEach>
									[Re]&nbsp;
									</c:if>
									???????????? ?????? ????????? ??? ?????????.
								</span>
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<c:if test="${item.adv_group_depth == 0 }">
									${item.adv_board_no }
								</c:if>
							</td>
							<td class="text-left">
								<a href="javascript:clickTitle('${item.adv_board_no }','${item.adv_secret_chk }');">
									<c:if test="${item.adv_group_depth >0 }">
										<c:forEach var="i" begin="1" end="${item.adv_group_depth }">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</c:forEach>
										[Re]&nbsp;
									</c:if>
									${item.adv_title }
									<c:if test="${item.adv_secret_chk==true }">
									<img src="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/lockicon.png" class="lock_img">
								</c:if>
								</a>
							</td>
							<td>${item.Nickname }</td>
							<td><fmt:parseDate value="${item.adv_regdate }" var="adv_regdate" pattern="yyyy-MM-dd'T'HH:mm:ss" /><fmt:formatDate value="${adv_regdate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${item.adv_hit }</td>
						</c:otherwise>
					</c:choose>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>


				<!-- ????????? -->
				<nav class="pagination" style="margin-top: 20px;">
					<div class="column">
						<c:choose>
							<c:when test="${pu.prevPage }">
								<a class="btn btn-outline-secondary btn-sm"
									href="${pageContext.request.contextPath}/service/advboard_list?pageNum=${pu.pageNum-1 }&field=${field}&keyword=${keyword}"><i
									class="icon-chevron-left"></i> ??????</a>
							</c:when>
							<c:otherwise>
								<a class="btn btn-outline-secondary btn-sm disabled"><i
									class="icon-chevron-left"></i> ??????</a>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="column">
						<ul class="pages" style="margin-top: 20px;">

							<c:forEach var="i" begin="${pu.startPageNum }"
								end="${pu.endPageNum }">
								<c:choose>
									<c:when test="${pu.pageNum==i }">
										<li class="active"><a
											href="${pageContext.request.contextPath}/service/advboard_list?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a>
										</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/service/advboard_list?pageNum=${i }&field=${field}&keyword=${keyword}">${i }</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
					<div class="column">
						<c:choose>
							<c:when test="${pu.nextPage }">
								<a class="btn btn-outline-secondary btn-sm"
									href="${pageContext.request.contextPath}/service/advboard_list?pageNum=${pu.pageNum+1 }&field=${field}&keyword=${keyword}">??????
									<i class="icon-chevron-right"></i>
								</a>
							</c:when>
							<c:otherwise>
								<a class="btn btn-outline-secondary btn-sm disabled">?????? <i
									class="icon-chevron-right"></i></a>
							</c:otherwise>
						</c:choose>
					</div>
				</nav>
				<div class="mb-4"></div>

			</div>
		</div>
	</div>

	<!-- ????????? ????????? ??? -->
	<!-- modal -->
	<div class="modal fade" id="loginModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">???????????? ????????? ??????????????????.</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
					<p>????????? ???????????????????</p>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-info btn-sm"
						onclick="location.href='${pageContext.request.contextPath}/account/login'">Yes</button>
					<button type="button" class="btn btn-secondary btn-sm"
						data-dismiss="modal" onclick="return false;">No</button>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp" />

	<!-- Back To Top Button-->
	<a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script
		src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
	<script>
	//????????? ??????????????? ???????????? ?????? 
	function clickInsert(){
	var id = null;
		<sec:authorize access="isAuthenticated()">
			id = '<sec:authentication property="principal.memberVo.id"/>';
		</sec:authorize>
	console.log("?????????:" + id);
	if(id!=null && id!='') {
		location.href='${pageContext.request.contextPath}/service/advboard_insert';
	}else{
		$("#loginModal").modal();
	}
}
	function clickTitle(adv_board_no,adv_secret_chk){
		var id = null;
			<sec:authorize access="isAuthenticated()">
				id = '<sec:authentication property="principal.memberVo.id"/>';
			</sec:authorize>
		console.log("?????????:" + id);
		
		if(id!=null && id!='') {
			location.href="${pageContext.request.contextPath }/service/advboard_detail?adv_board_no="+adv_board_no+"&adv_secret_chk="+adv_secret_chk;
		}else{
			$("#loginModal").modal();
		}
	}
	</script>
</body>
</html>