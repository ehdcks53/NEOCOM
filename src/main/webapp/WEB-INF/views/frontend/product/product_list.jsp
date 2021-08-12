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
	<link rel="icon" type="image/x-icon" href="static/frontend/assets/favicon&icon/favicon.ico">
	<link rel="icon" type="image/png" href="static/frontend/assets/favicon&icon/favicon.png">
	<link rel="apple-touch-icon" href="static/frontend/assets/favicon&icon/touch-icon-iphone.png">
	<link rel="apple-touch-icon" sizes="152x152" href="static/frontend/assets/favicon&icon/touch-icon-ipad.png">
	<link rel="apple-touch-icon" sizes="180x180" href="static/frontend/assets/favicon&icon/touch-icon-iphone-retina.png">
	<link rel="apple-touch-icon" sizes="167x167" href="static/frontend/assets/favicon&icon/touch-icon-ipad-retina.png">
	<!-- Vendor Styles including: Bootstrap, Font Icons, Plugins, etc.-->
	<link rel="stylesheet" media="screen" href="static/frontend/assets/css/vendor.min.css">
	<!-- Main Template Styles-->
	<link id="mainStyles" rel="stylesheet" media="screen" href="static/frontend/assets/css/styles.min.css">
	<!-- Modernizr-->
	<script src="static/frontend/assets/js/modernizr.min.js"></script>
</head>
<body>

<!-- footer -->
<jsp:include page="../inc/header.jsp"/>


<!-- 페이지 타이틀 -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<h1>상품리스트</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li><a href="#">Shop</a></li>
				<li class="separator">&nbsp;</li>
				<li>Goods list</li>
			</ul>
		</div>
	</div>
</div>
<!-- 페이지 타이틀 끝 -->


<!-- 페이지 컨텐트 -->
<div class="container padding-bottom-3x mb-1">
<div class="row">
	<div class="col-lg-9 order-lg-2">
		<!-- shop toolbar -->
		<div class="shop-toolbar padding-bottom-1x mb-2">
			<div class="column">
				<div class="shop-sorting">
					<label for="sorting">정렬 순서</label>
					<select class="form-control" id="">
						<option>신상품순</option>
						<option>낮은가격순</option>
						<option>높은가격순</option>
						<option>이름순-오름차순</option>
						<option>이름순-내림차순</option>
					</select>
				</div>
			</div>
			<div class="column">
				<div class="shop-view">
					<a class="grid-view active" href="#"></a>
					<a class="list-view" href="#"></a>
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- sidebar -->
	<div class="col-lg-3 order-lg-1">
		<div class="sidebar-toggle position-left">
			<i class="icon-filter"></i>
		</div>
		<aside class="sidebar sidebar-offcanvas position-left">
			<span class="sidebar-close"><i class="icon-x"></i></span>
			<section class="widget widget-categories">
			<h3 class="widget-title">카테고리</h3>
			<ul>
				<li class="has-children expanded"><a href="#">종류1</a><span>(100)</span>
					<ul>
						<li><a href="#">상품분류1</a><span>(수량)</span>
							<ul>
								<li><a href="#">상품1</a></li>
								<li><a href="#">상품2</a></li>
								<li><a href="#">상품3</a></li>
							</ul>
						</li>
						<li><a href="#">상품분류2</a><span>(수량)</span>
							<ul>
								<li><a href="#">상품1</a></li>
								<li><a href="#">상품2</a></li>
								<li><a href="#">상품3</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li class="has-children expanded"><a href="#">종류2</a><span>(100)</span>
					<ul>
						<li><a href="#">상품분류1</a><span>(수량)</span>
							<ul>
								<li><a href="#">상품1</a></li>
								<li><a href="#">상품2</a></li>
								<li><a href="#">상품3</a></li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
			</section>
		</aside>
	</div>
</div>
</div>
<!-- 페이지 컨텐트 끝 -->


<!-- footer -->
<jsp:include page="../inc/footer.jsp"/>

	<!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script src="static/frontend/assets/js/vendor.min.js"></script>
	<script src="static/frontend/assets/js/scripts.min.js"></script>
</body>
</html>