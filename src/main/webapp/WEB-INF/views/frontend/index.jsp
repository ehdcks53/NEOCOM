<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
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
</head>
<body>

	<!-- header -->

	<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp" />


	<!-- ?????? ???????????? -->
	<section class="hero-slider"
		style="background-image: url(${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/main-bg.jpg);">
		<div class="owl-carousel large-controls dots-inside"
			data-owl-carousel="{ &quot;nav&quot;: true, &quot;dots&quot;: true, &quot;loop&quot;: true, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 5000 }">
			<div class="item">
				<div class="container padding-top-3x">
					<div class="row justify-content-center align-items-center">
						<div
							class="col-lg-5 col-md-6 padding-bottom-2x text-md-left text-center">
							<!-- ?????? ????????? ?????? ????????? ?????? -->
							<div class="from-bottom">
								<img class="d-inline-block w-150 mb-4"
									src="${pageContext.request.contextPath}/static/frontend/assets/img/brands/brand2.png"
									alt="">
								<div class="h2 text-body mb-2 pt-1">AMD ?????????7-4?????? 5800X<br> (?????????) (?????????)</div>
								<div class="h2 text-body mb-4 pb-1">
									????????? &nbsp;<span class="text-medium">481,000 ???</span>
								</div>
							</div>
							<a class="btn btn-primary scale-up delay-1" href="${pageContext.request.contextPath}/shop/product_detail?n=95&m=3">
								?????? ????????????&nbsp;<i class="icon-arrow-right"></i>
							</a>
						</div>
						<!-- ???????????? ??????????????? ?????? -->
						<div class="col-md-6 padding-bottom-2x mb-3">
							<img class="d-block mx-auto"
								src="${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/slideimage1.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="container padding-top-3x">
					<div class="row justify-content-center align-items-center">
						<div
							class="col-lg-5 col-md-6 padding-bottom-2x text-md-left text-center">
							<!-- ?????? ????????? ?????? ????????? ?????? -->
							<div class="from-bottom">
								<img class="d-inline-block w-150 mb-4"
									src="${pageContext.request.contextPath}/static/frontend/assets/img/brands/brand7.png"
									alt="">
								<div class="h2 text-body mb-2 pt-1">JONSBO CR-1000 AUTO RGB <br> (WHITE)</div>
								<div class="h2 text-body mb-4 pb-1">
									????????? &nbsp;<span class="text-medium">23,400 ???</span>
								</div>
							</div>
							<a class="btn btn-primary scale-up delay-1" href="${pageContext.request.contextPath}/shop/product_detail?n=96&m=10">
								?????? ????????????&nbsp;<i class="icon-arrow-right"></i>
							</a>
						</div>
						<!-- ???????????? ??????????????? ?????? -->
						<div class="col-md-6 padding-bottom-2x mb-3">
							<img class="d-block mx-auto"
								src="${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/slideimage2.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
			<div class="item">
				<div class="container padding-top-3x">
					<div class="row justify-content-center align-items-center">
						<div
							class="col-lg-5 col-md-6 padding-bottom-2x text-md-left text-center">
							<!-- ?????? ????????? ?????? ????????? ?????? -->
							<div class="from-bottom">
								<img class="d-inline-block w-150 mb-4"
									src="${pageContext.request.contextPath}/static/frontend/assets/img/brands/brand8.png"
									alt="">
								<div class="h2 text-body mb-2 pt-1">G.SKILL DDR4 32G <br> PC4-25600 CL16 TRIDENT Z RGB</div>
								<div class="h2 text-body mb-4 pb-1">
									????????? &nbsp;<span class="text-medium">250,500 ???</span>
								</div>
							</div>
							<a class="btn btn-primary scale-up delay-1" href="${pageContext.request.contextPath}/shop/product_detail?n=85&m=5">
								?????? ????????????&nbsp;<i class="icon-arrow-right"></i>
							</a>
						</div>
						<!-- ???????????? ??????????????? ?????? -->
						<div class="col-md-6 padding-bottom-2x mb-3">
							<img class="d-block mx-auto"
								src="${pageContext.request.contextPath}/static/frontend/assets/img/hero-slider/slideimage3.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ?????? ???????????? ??? -->


	<!-- deals 
<section class="container padding-top-3x">

</section>
 deals ??? -->
 

	<!-- New Arrivals -->

	<section class="container padding-top-4x padding-bottom-3x mb-2">
		<h2 class="h3 pb-3 text-center">?????? &nbsp;&nbsp; ?????? &nbsp;&nbsp; ??????</h2>
		<div class="row">
			<c:forEach var="vo" items="${list }" end="7">

				<div class="col-lg-3 col-md-4 col-sm-6" style="width:auto;height:auto;">
					<div class="product-card mb-30">
						<a class="product-thumb" 
							href="${pageContext.request.contextPath}/shop/product_detail?n=${vo.product_id}&m=${vo.category_id}">

							<img   src="<c:url value='/upload/product_img/${vo.uploadPath}/${vo.img_name_save}' />"
							alt="<c:url value='/upload/product_img/${vo.uploadPath}/${vo.img_name_save}' />" />
						</a>
						<div class="product-card-body">
							<div class="product-category">
								<a href="#">${vo.brand }</a>
							</div>
							<h3 class="product-title">
								 ${vo.product_name }

							</h3>
							<h4 class="product-price">
								<fmt:formatNumber pattern="###,###,###"
									value="${vo.selling_price }" />
								???
							</h4>
						</div>
						<div class="product-button-group">
							<a id="wish" class="product-button btn-wish" href="#" onclick="insertWish(${vo.product_id})">
								<c:choose>
									<c:when test="${status == 0 }">
										<i class="icon-heart" style="color:red;"></i>
									</c:when>
									<c:otherwise>
										<i class="icon-heart"></i>
									</c:otherwise>
								</c:choose>
								<span>????????????</span>
							</a>
							<a
								class="product-button"
								href="javascript:insertCart(${vo.product_id});" 
								
								data-toast data-toast-type="success"
								data-toast-position="topRight"
								data-toast-icon="icon-check-circle" data-toast-title=" "
								data-toast-message="??????????????? ????????? ???????????????!"> <i
								class="icon-shopping-cart"></i><span>????????????</span>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="text-center">
			<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/shop/product_list?category_id=20000">????????? ????????????</a>
		</div>
	</section>
	
	
	<!-- ?????? -->
	<section class="container-fluid padding-top-2x padding-bottom-4x">
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12">
				<div class="fw-section rounded padding-top-4x padding-bottom-4x"
					 style="background-image: url(${pageContext.request.contextPath}/static/frontend/assets/img/banners/bannerimage.png);">
					<span class="overlay rounded" style="opacity:.35;"></span>
					<div class="text-center padding-bottom-8x">
						<h3 class="display-4 text-nomal text-white text-shadow py-2 px-3 mb-1">???????????? ????????? ?????? ???????????? ?????? ???????????? ?????????</h3>
						<h2 class="display-1 text-bold text-white text-shadow py-4">?????? ?????? ?????????</h2>
						<h4 class="d-inline-block h2 text-normal text-white text-shadow border-default border-left-0 border-right-0 mb-4"> &nbsp; ?????? ?????? ???????????????! &nbsp; </h4>
						<br>
						<a class="btn btn-primary margin-bottom-none" href="${pageContext.request.contextPath }/service/advboard_list">
							??????????????????
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ?????? ??? -->
	
	
	<!-- ????????? ????????? -->
	<section class="bg-secondary padding-top-2x padding-bottom-2x">
		<div class="container">
		<h2 class="h3 text-center mb-30 pb-3">?????? &nbsp;&nbsp; ?????? ????????? &nbsp;&nbsp; ??????</h2>
			<div class="owl-carousel" data-owl-carousel="{ &quot;nav&quot;: false, &quot;dots&quot;: false, &quot;loop&quot;: true, &quot;autoplay&quot;: true, &quot;autoplayTimeout&quot;: 3000, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:2}, &quot;470&quot;:{&quot;items&quot;:3},&quot;630&quot;:{&quot;items&quot;:4},&quot;991&quot;:{&quot;items&quot;:5},&quot;1200&quot;:{&quot;items&quot;:6}} }">
				<img class="d-block w-110 opacity-75 m-auto" src="${pageContext.request.contextPath}/static/frontend/assets/img/brands/brand1.png" alt="ASUS">
				<img class="d-block w-110 opacity-75 m-auto" src="${pageContext.request.contextPath}/static/frontend/assets/img/brands/brand2.png" alt="AMD">
				<img class="d-block w-110 opacity-75 m-auto" src="${pageContext.request.contextPath}/static/frontend/assets/img/brands/brand3.png" alt="intel">
				<img class="d-block w-110 opacity-75 m-auto" src="${pageContext.request.contextPath}/static/frontend/assets/img/brands/brand4.png" alt="SAMSUNG">
				<img class="d-block w-110 opacity-75 m-auto" src="${pageContext.request.contextPath}/static/frontend/assets/img/brands/brand5.png" alt="NVIDIA">
				<img class="d-block w-110 opacity-75 m-auto" src="${pageContext.request.contextPath}/static/frontend/assets/img/brands/brand6.png" alt="SanDisk">
			</div>
		</div>
	</section>
	<!-- ????????? ????????? ??? -->


	<!-- ????????? ????????? -->
	<section class="container padding-top-2x padding-bottom-2x">
	<!--<div class="row">
			<div class="col-md-4 col-sm-6 text-center mb-30">
				<a href="#"><img
					class="d-block w-90 img-thumbnail rounded mx-auto mb-4"
					src="${pageContext.request.contextPath}/static/frontend/assets/img/services/02.png"
					alt=""></a>
				<h6 class="mb-2">??????/??????</h6>
			</div>
			<div class="col-md-4 col-sm-6 text-center mb-30">
				<a href="#"><img
					class="d-block w-90 img-thumbnail rounded mx-auto mb-4"
					src="${pageContext.request.contextPath}/static/frontend/assets/img/services/03.png"
					alt=""></a>
				<h6 class="mb-2">????????????</h6>
			</div>
			<div class="col-md-4 col-sm-6 text-center mb-30">
				<a href="#"><img
					class="d-block w-90 img-thumbnail rounded mx-auto mb-4"
					src="${pageContext.request.contextPath}/static/frontend/assets/img/services/04.png"
					alt=""></a>
				<h6 class="mb-2">??????</h6>
			</div>
		</div> -->
	</section>
	<!-- ????????? ????????? ??? -->


	<!-- modal -->
	<div class="modal fade" id="loginModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">???????????? ????????? ??????????????????.</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
				</div>
				<div class="modal-body">
					<p>????????? ???????????????????</p>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-info btn-sm" onclick="location.href='${pageContext.request.contextPath}/account/login'">Yes</button>
					<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal" onclick="return false;">No</button>
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
	<script type="text/javascript">
		
	function insertCart(product_id){
			
		console.log(product_id)
			$.ajax({
				url:"${pageContext.request.contextPath}/member/insertCart",
				dataType:"json",
				data:{"product_id" : product_id},
				Type:'post',
				success:function(data){
					
				},error:function(request, status, error){

					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});	
	};
	
	/* ???????????? ????????? ??? ?????? - ????????? ????????? ??????????????? ???????????? ????????????...??????????????? */
	var status = 0;
	function insertWish(product_id){
		var id = null;
		<sec:authorize access="isAuthenticated()">
			id = '<sec:authentication property="principal.memberVo.id"/>';
		</sec:authorize>
		
		if(id != null && id!='') {
			$.ajax({
				url:"${pageContext.request.contextPath}/account/mypage_wishinsert",
				dataType:"json",
				data:{"product_id" : product_id},
				success:function(data){
					console.log("????????? (1=??????????????????,0=??????????????????) : " + data.status);
					
					if(data.status == 0){
						$(".btn-wish",function(){
							var b=$(this).data("iteration")||1,
							c={title:" ",animateInside:!1,position:"topRight",progressBar:!1,
								timeout:3200,transitionIn:"fadeInLeft",transitionOut:"fadeOut",
								transitionInMobile:"fadeIn",transitionOutMobile:"fadeOut"
							};

							switch(b){
								case 1:
								$(this).removeClass("active"),
								c.class="iziToast-danger",
								c.message="?????????????????? ?????????????????????!",
								c.icon="icon-slash";
								break;
		
								case 2:
								$(this).addClass("active"),
								c.class="iziToast-info",
								c.message="??????????????? ?????????????????????!",
								c.icon="icon-info"
							}
							iziToast.show(c),
							$(this).data("iteration",b)
						})
					}else{
						$(".btn-wish",function(){
							var b=$(this).data("iteration")||1,
							c={title:" ",animateInside:!1,position:"topRight",progressBar:!1,
								timeout:3200,transitionIn:"fadeInLeft",transitionOut:"fadeOut",
								transitionInMobile:"fadeIn",transitionOutMobile:"fadeOut"
							};

							switch(b){
								case 1:
								$(this).addClass("active"),
								c.class="iziToast-info",
								c.message="??????????????? ?????????????????????!",
								c.icon="icon-info";
								break;
		
								case 2:
								$(this).removeClass("active"),
								c.class="iziToast-danger",
								c.message="?????????????????? ?????????????????????!",
								c.icon="icon-slash"
							}
							iziToast.show(c),
							$(this).data("iteration",b)
						})
					}
					
				},error:function(error){
					console.log("error:" + error);
				}
			});
		}else{
			$("#loginModal").modal();
		}
	};
	
	</script>		
</body>

</html>