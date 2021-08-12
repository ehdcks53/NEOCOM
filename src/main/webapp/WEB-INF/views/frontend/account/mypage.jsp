<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>neocom</title>
	<!-- SEO Meta Tags-->
	<meta name="description" content="Unishop - Universal E-Commerce Template">
	<meta name="keywords" content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
	<meta name="author" content="Rokaux">
	<!-- Favicon and Apple Icons-->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/neocom_favicon.ico">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/neocom_favicon.png">
	<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-iphone.png">
	<link rel="apple-touch-icon" sizes="152x152" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-ipad.png">
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-iphone-retina.png">
	<link rel="apple-touch-icon" sizes="167x167" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/touch-icon-ipad-retina.png">
	<!-- Vendor Styles including: Bootstrap, Font Icons, Plugins, etc.-->
	<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/static/frontend/assets/css/vendor.min.css">
	<!-- Main Template Styles-->
	<link id="mainStyles" rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/static/frontend/assets/css/styles.min.css">
	<!-- Modernizr-->
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>
<style>
.table tbody tr td {
	height: 100px;
	vertical-align: middle;
}
</style>
</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>


<!-- 페이지 타이틀 -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<!-- 페이지명 적어주세요 -->
			<h1>마이페이지</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<!-- 페이지 경로 넣어주세요 -->
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li>My Page</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x">
<div class="row">
	<!-- 마이페이지 주문내역 -->
	<div class="col-lg col-md-8 order-md-2">
		<h6 class="text-muted text-lg text-upppercase">주문내역</h6>
		<hr class="margin-bottom-1x">
		<div class="table-responsive">
			<table class="table table-striped text-center">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문일</th>
						<th>상품명</th>
						<th>총금액</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>2021.08.12</td>
						<td>상품명</td>
						<td>500,000원</td>
						<td><button class="btn btn-sm btn-outline-info" type="button">상세보기</button></td>
					</tr>
					<tr>
						<td>2</td>
						<td>2021.08.12</td>
						<td>상품명</td>
						<td>500,000원</td>
						<td><button class="btn btn-sm btn-outline-info" type="button">상세보기</button></td>
					</tr>
					<tr>
						<td>3</td>
						<td>2021.08.12</td>
						<td>상품명</td>
						<td>500,000원</td>
						<td><button class="btn btn-sm btn-outline-info" type="button">상세보기</button></td>
					</tr>
					<tr>
						<td>4</td>
						<td>2021.08.12</td>
						<td>상품명</td>
						<td>500,000원</td>
						<td><button class="btn btn-sm btn-outline-info" type="button">상세보기</button></td>
					</tr>
					<tr>
						<td>5</td>
						<td>2021.08.12</td>
						<td>상품명</td>
						<td>500,000원</td>
						<td><button class="btn btn-sm btn-outline-info" type="button">상세보기</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 마이페이지 사이드 -->
	<jsp:include page="inc/mypage_sidebar.jsp"/>
</div>
</div>
<!-- 페이지 컨텐트 끝 -->


<!-- footer -->
<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp"/>

	<!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
</body>
</html>