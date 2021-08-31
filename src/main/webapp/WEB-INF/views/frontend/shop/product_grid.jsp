<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
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
	


</head>
<body>

<!-- header -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>


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
<div class="container padding-top-3x padding-bottom-2x mb-2">
<div class="row">
	<!-- ///////////////////// 상품리스트 그리드 ///////////////////// -->
	<div class="col-lg-9 order-lg-2">
		<!-- 정렬순서 -->
		<div class="shop-toolbar padding-bottom-1x mb-2">
			<div class="column">
				<div class="shop-sorting">
					 
					<label for="sorting">정렬 순서</label>
					<select class="form-control" id="order">
						<option value="new"><c:if test="${order=='new' }">selected</c:if>신상품순</option>
						<option value="low"><c:if test="${order=='low' }">selected</c:if>낮은가격순</option>
						<option value="high"><c:if test="${order=='high' }">selected</c:if>높은가격순</option>
						<option value="name_high"><c:if test="${order=='name_high' }">selected</c:if>이름순-오름차순</option>
						<option value="name_low"><c:if test="${order=='name_low' }">selected</c:if>이름순-내림차순</option>
					</select>
				</div>
			</div>
			<div class="column">
				
				<div class="shop-view">
				 	<c:choose>
				 		<c:when test="${keyword ne null }">
							<a class="grid-view active" href="${pageContext.request.contextPath}/shop/product_grid?category_id=${category_id}&keyword=${keyword}"><span></span><span></span><span></span></a>
							<a class="list-view" href="${pageContext.request.contextPath}/shop/product_list?category_id=${category_id}&keyword=${keyword}"><span></span><span></span><span></span></a>		
						</c:when>
						<c:when test="${minPrice1 ne null }">
						 	<a class="grid-view active" href="${pageContext.request.contextPath}/shop/product_grid?category_id=${category_id}&keyword=${keyword}&minPrice=${minPrice1}&maxPrice=${maxPrice1}"><span></span><span></span><span></span></a>
							<a class="list-view" href="${pageContext.request.contextPath}/shop/product_list?category_id=${category_id}&keyword=${keyword}&minPrice=${minPrice1}&maxPrice=${maxPrice1}"><span></span><span></span><span></span></a>		
						</c:when>
						<c:otherwise>
							<a class="grid-view active" href="${pageContext.request.contextPath}/shop/product_grid?category_id=${category_id}"><span></span><span></span><span></span></a>
							<a class="list-view" href="${pageContext.request.contextPath}/shop/product_list?category_id=${category_id}"><span></span><span></span><span></span></a>	
						</c:otherwise>
				
				</c:choose>
				</div>
				
			</div>
		</div>
		<!-- 상품리스트 -->
		<input type="hidden" id="category_id" value="${category_id}" >
		<div class="row" id="commList">
		
		 	
			
			<!-- forEach 끝 부분 -->
		</div>
		<!-- 페이징  -->
			<nav class="pagination" style="margin-top:20px;">
		<div class="column" id="page"></div>
		<div class="column" id="page1"></div>
		<div class="column" id="page2"></div>
		</nav>
		<div class="mb-4"></div>
	</div>
	<!-- ///////////////////// 상품리스트 그리드 끝 ///////////////////// -->
	
	<!-- ///////////////////// 상품리스트 사이드바 ///////////////////// -->
	<div class="col-lg-3 order-lg-1">
		<div class="sidebar-toggle position-left">
			<i class="icon-filter"></i>
		</div>
		<aside class="sidebar sidebar-offcanvas position-left">
			<span class="sidebar-close"><i class="icon-x"></i></span>
			<!-- 카테고리 -->
			
			
			<section class="widget widget-categories">
			<h3 class="widget-title">카테고리</h3>
			
			<ul>
					<!-- cpu 시작 -->
				<li class="has-children expanded"><a href="#">${clist[1].category_name }</a>
					<ul>
						<li><a href="#">${clist[8].category_name }</a>
							<ul>
								<li><a href="#">${clist[41].category_name }</a></li> 
								<li><a href="#">${clist[42].category_name }</a></li>
								<li><a href="#">${clist[43].category_name }</a></li>
								<li><a href="#">${clist[44].category_name }</a></li>
								<li><a href="#">${clist[45].category_name }</a></li>
								<li><a href="#">${clist[46].category_name }</a></li>
							</ul> 
						</li>
				
			
						<li><a href="#">${clist[9].category_name }</a>
							<ul>
								<li><a href="#">${clist[47].category_name }</a></li>
								<li><a href="#">${clist[48].category_name }</a></li>
								<li><a href="#">${clist[49].category_name }</a></li>
								<li><a href="#">${clist[50].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[10].category_name }</a>
							<ul>
								<li><a href="#">${clist[51].category_name }</a></li>
								<li><a href="#">${clist[52].category_name }</a></li>
								<li><a href="#">${clist[53].category_name }</a></li>
								<li><a href="#">${clist[54].category_name }</a></li>
								<li><a href="#">${clist[55].category_name }</a></li>
								<li><a href="#">${clist[56].category_name }</a></li>
								<li><a href="#">${clist[57].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[11].category_name }</a>
							<ul>
								<li><a href="#">${clist[58].category_name }</a></li>
								<li><a href="#">${clist[59].category_name }</a></li>
								<li><a href="#">${clist[60].category_name }</a></li>
								<li><a href="#">${clist[61].category_name }</a></li>
							</ul>
						</li>
						
					</ul>
				</li> 
				<!-- cpu 끝 -->
				<!-- 메인보드 시작 -->
				<li class="has-children"><a href="#">${clist[2].category_name }</a>
					<ul>
						<li><a href="#">${clist[12].category_name }</a>
							<ul>
								<li><a href="#">${clist[62].category_name }</a></li>
								<li><a href="#">${clist[63].category_name }</a></li>
								
							</ul>
						</li>
						<li><a href="#">${clist[13].category_name }</a>
							<ul>
								<li><a href="#">${clist[64].category_name }</a></li> 
								<li><a href="#">${clist[65].category_name }</a></li>
								<li><a href="#">${clist[66].category_name }</a></li>
								<li><a href="#">${clist[67].category_name }</a></li>
								<li><a href="#">${clist[68].category_name }</a></li>
								<li><a href="#">${clist[69].category_name }</a></li>
								<li><a href="#">${clist[70].category_name }</a></li>
								<li><a href="#">${clist[71].category_name }</a></li>
							
								
							</ul> 
						</li>
						<li><a href="#">${clist[14].category_name }</a>
							<ul>
								<li><a href="#">${clist[72].category_name }</a></li> 
								<li><a href="#">${clist[73].category_name }</a></li>
								<li><a href="#">${clist[74].category_name }</a></li>
								<li><a href="#">${clist[75].category_name }</a></li>
								<li><a href="#">${clist[76].category_name }</a></li>
								<li><a href="#">${clist[77].category_name }</a></li>
								<li><a href="#">${clist[78].category_name }</a></li>
								<li><a href="#">${clist[79].category_name }</a></li>
								
							</ul> 
						</li>
						<li><a href="#">${clist[15].category_name }</a>
							<ul>
								<li><a href="#">${clist[80].category_name }</a></li> 
								<li><a href="#">${clist[81].category_name }</a></li>
								<li><a href="#">${clist[82].category_name }</a></li>
								<li><a href="#">${clist[83].category_name }</a></li>
								
							</ul> 
						</li>
						<li><a href="#">${clist[16].category_name }</a>
							<ul>
								<li><a href="#">${clist[84].category_name }</a></li> 
								<li><a href="#">${clist[85].category_name }</a></li>
								
								
							</ul> 
						</li>
						
					</ul>
				</li>
				<!-- 메인보드 끝 -->
				<!-- 램 시작-->
				<li class="has-children"><a href="#">${clist[3].category_name }</a>
					<ul>
						<li><a href="#">${clist[17].category_name }</a>
							<ul>
								<li><a href="#">${clist[86].category_name }</a></li>
								<li><a href="#">${clist[87].category_name }</a></li>
							
							</ul>
						</li>
						<li><a href="#">${clist[18].category_name }</a>
							<ul>
								<li><a href="#">${clist[88].category_name }</a></li>
								<li><a href="#">${clist[89].category_name }</a></li>
								<li><a href="#">${clist[90].category_name }</a></li>
								<li><a href="#">${clist[91].category_name }</a></li>
								<li><a href="#">${clist[92].category_name }</a></li>
								<li><a href="#">${clist[93].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[19].category_name }</a>
							<ul>
								<li><a href="#">${clist[94].category_name }</a></li>
								<li><a href="#">${clist[95].category_name }</a></li>
								<li><a href="#">${clist[96].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[20].category_name }</a>
							<ul>
								<li><a href="#">${clist[97].category_name }</a></li>
							
							</ul>
						</li>
						<li><a href="#">${clist[21].category_name }</a>
							<ul>
								<li><a href="#">${clist[98].category_name }</a></li>
								
							</ul>
						</li>
					</ul>
				</li>
				<!-- 램 끝 -->
				<!-- 그래픽카드 시작 -->
				<li class="has-children"><a href="#">${clist[4].category_name }</a>
					<ul>
						<li><a href="#">${clist[22].category_name }</a>
							<ul>
								<li><a href="#">${clist[99].category_name }</a></li>
								<li><a href="#">${clist[100].category_name }</a></li>
							
							</ul>
						</li>
						<li><a href="#">${clist[23].category_name }</a>
							<ul>
								<li><a href="#">${clist[101].category_name }</a></li>
								<li><a href="#">${clist[102].category_name }</a></li>
								<li><a href="#">${clist[103].category_name }</a></li>
								<li><a href="#">${clist[104].category_name }</a></li>
								<li><a href="#">${clist[105].category_name }</a></li>
								<li><a href="#">${clist[106].category_name }</a></li>
								<li><a href="#">${clist[107].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[24].category_name }</a>
							<ul>
								<li><a href="#">${clist[108].category_name }</a></li>
								<li><a href="#">${clist[109].category_name }</a></li>
								
							</ul>
						</li>
						<li><a href="#">${clist[25].category_name }</a>
							<ul>
								<li><a href="#">${clist[110].category_name }</a></li>
								<li><a href="#">${clist[111].category_name }</a></li>
								<li><a href="#">${clist[112].category_name }</a></li>
								<li><a href="#">${clist[113].category_name }</a></li>
								<li><a href="#">${clist[114].category_name }</a></li>
							
							</ul>
						</li>
						<li><a href="#">${clist[26].category_name }</a>
							<ul>
								<li><a href="#">${clist[115].category_name }</a></li>
								<li><a href="#">${clist[116].category_name }</a></li>
								<li><a href="#">${clist[117].category_name }</a></li>
								<li><a href="#">${clist[118].category_name }</a></li>
								
							</ul>
						</li>
					</ul>
				</li>
				<!-- 그래픽카드 끝 -->
				<!--  ssd 시작 -->
				<li class="has-children"><a href="#">${clist[5].category_name }</a>
					<ul>
						<li><a href="#">${clist[27].category_name }</a>
							<ul>
								<li><a href="#">${clist[119].category_name }</a></li>
								<li><a href="#">${clist[120].category_name }</a></li>
								<li><a href="#">${clist[121].category_name }</a></li>
							
							</ul>
						</li>
						<li><a href="#">${clist[28].category_name }</a>
							<ul>
								<li><a href="#">${clist[122].category_name }</a></li>
								<li><a href="#">${clist[123].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[29].category_name }</a>
							<ul>
								<li><a href="#">${clist[124].category_name }</a></li>
								<li><a href="#">${clist[125].category_name }</a></li>
								<li><a href="#">${clist[126].category_name }</a></li>
								<li><a href="#">${clist[127].category_name }</a></li>
								<li><a href="#">${clist[128].category_name }</a></li>
								<li><a href="#">${clist[129].category_name }</a></li>
								<li><a href="#">${clist[130].category_name }</a></li>
								<li><a href="#">${clist[131].category_name }</a></li>
								<li><a href="#">${clist[132].category_name }</a></li>
								<li><a href="#">${clist[133].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[30].category_name }</a>
							<ul>
								<li><a href="#">${clist[134].category_name }</a></li>
								<li><a href="#">${clist[135].category_name }</a></li>
								<li><a href="#">${clist[136].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[31].category_name }</a>
							<ul>
								<li><a href="#">${clist[137].category_name }</a></li>
								<li><a href="#">${clist[138].category_name }</a></li>
								<li><a href="#">${clist[139].category_name }</a></li>
								<li><a href="#">${clist[140].category_name }</a></li>
								<li><a href="#">${clist[141].category_name }</a></li>
								<li><a href="#">${clist[142].category_name }</a></li>
								<li><a href="#">${clist[143].category_name }</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<!-- ssd 끝 -->
				<!-- hdd 시작 -->
				<li class="has-children"><a href="#">${clist[6].category_name }</a>
					<ul>
						<li><a href="#">${clist[32].category_name }</a>
							<ul>
								<li><a href="#">${clist[144].category_name }</a></li>
								<li><a href="#">${clist[145].category_name }</a></li>
								<li><a href="#">${clist[146].category_name }</a></li>
								<li><a href="#">${clist[147].category_name }</a></li>
								<li><a href="#">${clist[148].category_name }</a></li>
								<li><a href="#">${clist[149].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[33].category_name }</a>
							<ul>
								<li><a href="#">${clist[150].category_name }</a></li>
								<li><a href="#">${clist[151].category_name }</a></li>
								<li><a href="#">${clist[152].category_name }</a></li>
								<li><a href="#">${clist[153].category_name }</a></li>
								<li><a href="#">${clist[154].category_name }</a></li>
								<li><a href="#">${clist[155].category_name }</a></li>
								<li><a href="#">${clist[156].category_name }</a></li>
								<li><a href="#">${clist[157].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[34].category_name }</a>
							<ul>
								<li><a href="#">${clist[158].category_name }</a></li>
								<li><a href="#">${clist[159].category_name }</a></li>
								<li><a href="#">${clist[160].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[35].category_name }</a>
							<ul>
								<li><a href="#">${clist[161].category_name }</a></li>
								<li><a href="#">${clist[162].category_name }</a></li>
								<li><a href="#">${clist[163].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[36].category_name }</a>
							<ul>
								<li><a href="#">${clist[164].category_name }</a></li>
								<li><a href="#">${clist[165].category_name }</a></li>
								<li><a href="#">${clist[166].category_name }</a></li>
								<li><a href="#">${clist[167].category_name }</a></li>
								<li><a href="#">${clist[168].category_name }</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<!-- hdd 끝 -->
				<!-- power 시작 -->
				<li class="has-children"><a href="#">${clist[7].category_name }</a>
					<ul>
						<li><a href="#">${clist[37].category_name }</a>
							<ul>
								<li><a href="#">${clist[169].category_name }</a></li>
								<li><a href="#">${clist[170].category_name }</a></li>
								<li><a href="#">${clist[171].category_name }</a></li>
								<li><a href="#">${clist[172].category_name }</a></li>
								<li><a href="#">${clist[173].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[38].category_name }</a>
							<ul>
								<li><a href="#">${clist[174].category_name }</a></li>
								<li><a href="#">${clist[175].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[39].category_name }</a>
							<ul>
								<li><a href="#">${clist[176].category_name }</a></li>
								<li><a href="#">${clist[177].category_name }</a></li>
								<li><a href="#">${clist[178].category_name }</a></li>
								<li><a href="#">${clist[179].category_name }</a></li>
							</ul>
						</li>
						<li><a href="#">${clist[40].category_name }</a>
							<ul>
								<li><a href="#">${clist[180].category_name }</a></li>
								<li><a href="#">${clist[181].category_name }</a></li>
								<li><a href="#">${clist[182].category_name }</a></li>
								<li><a href="#">${clist[183].category_name }</a></li>
								<li><a href="#">${clist[184].category_name }</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<!-- 쿨러 시작 -->
				<li class="has-children"><a href="#">${all[1].category_name }</a>
					<ul>
						<li><a href="#">${all[6].category_name }</a>
							<ul>
								<li><a href="#">${all[24].category_name }</a></li>
								<li><a href="#">${all[25].category_name }</a></li>
								<li><a href="#">${all[26].category_name }</a></li>
								<li><a href="#">${all[27].category_name }</a></li>
								<li><a href="#">${all[28].category_name }</a></li>
								<li><a href="#">${all[29].category_name }</a></li>
								<li><a href="#">${all[30].category_name }</a></li>
								<li><a href="#">${all[31].category_name }</a></li>
								<li><a href="#">${all[32].category_name }</a></li>
								<li><a href="#">${all[33].category_name }</a></li>
								<li><a href="#">${all[34].category_name }</a></li>
								<li><a href="#">${all[35].category_name }</a></li>
								<li><a href="#">${all[36].category_name }</a></li>
								<li><a href="#">${all[37].category_name }</a></li>
								<li><a href="#">${all[38].category_name }</a></li>
								<li><a href="#">${all[39].category_name }</a></li>
								<li><a href="#">${all[40].category_name }</a></li>
								<li><a href="#">${all[41].category_name }</a></li>
								<li><a href="#">${all[42].category_name }</a></li>
								
							
							</ul>
						</li>
						<li><a href="#">${all[7].category_name }</a>
							<ul>
								<li><a href="#">${all[43].category_name }</a></li>
								<li><a href="#">${all[44].category_name }</a></li>
								
							</ul>
						</li>
						<li><a href="#">${clist[8].category_name }</a>
							<ul>
								<li><a href="#">${all[45].category_name }</a></li>
								<li><a href="#">${all[46].category_name }</a></li>
								<li><a href="#">${all[47].category_name }</a></li>
								<li><a href="#">${all[48].category_name }</a></li>								
							</ul>
						</li>
						<li><a href="#">${all[9].category_name }</a>
							<ul>
								<li><a href="#">${all[49].category_name }</a></li>
								<li><a href="#">${all[50].category_name }</a></li>
								<li><a href="#">${all[51].category_name }</a></li>
								
							
							</ul>
						</li>
						<li><a href="#">${all[10].category_name }</a>
							<ul>
								<li><a href="#">${all[52].category_name }</a></li>
								<li><a href="#">${all[53].category_name }</a></li>
								<li><a href="#">${all[54].category_name }</a></li>
								<li><a href="#">${all[55].category_name }</a></li>
								<li><a href="#">${all[56].category_name }</a></li>
								<li><a href="#">${all[57].category_name }</a></li>
								<li><a href="#">${all[58].category_name }</a></li>								
							</ul>
						</li>
					</ul>
				</li>
				<!-- 쿨러 끝 -->

			<!-- 컨트롤러 시작 -->
				<li class="has-children"><a href="#">${all[2].category_name }</a>
					<ul>
						<li><a href="#">${all[11].category_name }</a>
							<ul>
								<li><a href="#">${all[59].category_name }</a></li>
								<li><a href="#">${all[60].category_name }</a></li>
								<li><a href="#">${all[61].category_name }</a></li>
								<li><a href="#">${all[62].category_name }</a></li>
								<li><a href="#">${all[63].category_name }</a></li>
								<li><a href="#">${all[64].category_name }</a></li>
								<li><a href="#">${all[65].category_name }</a></li>
								<li><a href="#">${all[66].category_name }</a></li>
								<li><a href="#">${all[67].category_name }</a></li>
								<li><a href="#">${all[68].category_name }</a></li>
								<li><a href="#">${all[69].category_name }</a></li>
								<li><a href="#">${all[70].category_name }</a></li>
								<li><a href="#">${all[71].category_name }</a></li>
								
								
							
							</ul>
						</li>
						<li><a href="#">${all[12].category_name }</a>
							<ul>
								<li><a href="#">${all[72].category_name }</a></li>
								<li><a href="#">${all[73].category_name }</a></li>
								<li><a href="#">${all[74].category_name }</a></li>
								<li><a href="#">${all[75].category_name }</a></li>
								<li><a href="#">${all[76].category_name }</a></li>
								<li><a href="#">${all[77].category_name }</a></li>
								<li><a href="#">${all[78].category_name }</a></li>
								<li><a href="#">${all[79].category_name }</a></li>
								<li><a href="#">${all[80].category_name }</a></li>
								<li><a href="#">${all[81].category_name }</a></li>
								<li><a href="#">${all[82].category_name }</a></li>
								<li><a href="#">${all[83].category_name }</a></li>
								<li><a href="#">${all[84].category_name }</a></li>
								<li><a href="#">${all[85].category_name }</a></li>
								<li><a href="#">${all[86].category_name }</a></li>
								<li><a href="#">${all[87].category_name }</a></li>
								<li><a href="#">${all[88].category_name }</a></li>
								<li><a href="#">${all[89].category_name }</a></li>
								<li><a href="#">${all[90].category_name }</a></li>
								<li><a href="#">${all[91].category_name }</a></li>
								<li><a href="#">${all[92].category_name }</a></li>
															
							</ul>
						</li>
						<li><a href="#">${clist[13].category_name }</a>
							<ul>
								<li><a href="#">${all[93].category_name }</a></li>
								<li><a href="#">${all[94].category_name }</a></li>
								<li><a href="#">${all[95].category_name }</a></li>
								<li><a href="#">${all[96].category_name }</a></li>
								<li><a href="#">${all[97].category_name }</a></li>
								<li><a href="#">${all[98].category_name }</a></li>
								<li><a href="#">${all[99].category_name }</a></li>
								<li><a href="#">${all[100].category_name }</a></li>
								<li><a href="#">${all[101].category_name }</a></li>
								<li><a href="#">${all[102].category_name }</a></li>
								<li><a href="#">${all[103].category_name }</a></li>
								<li><a href="#">${all[104].category_name }</a></li>
								<li><a href="#">${all[105].category_name }</a></li>
								<li><a href="#">${all[106].category_name }</a></li>
								<li><a href="#">${all[107].category_name }</a></li>
								<li><a href="#">${all[108].category_name }</a></li>									
							</ul>
						</li>
						<li><a href="#">${all[14].category_name }</a>
							<ul>
								<li><a href="#">${all[109].category_name }</a></li>
							</ul>
						</li>
						
					</ul>
				</li>
				<!-- 컨트롤러 끝 -->

			<!-- 외장하드 시작 -->
				<li class="has-children"><a href="#">${all[3].category_name }</a>
					<ul>
						<li><a href="#">${all[15].category_name }</a>
							<ul>
								<li><a href="#">${all[110].category_name }</a></li>
								<li><a href="#">${all[111].category_name }</a></li>
								<li><a href="#">${all[112].category_name }</a></li>
								<li><a href="#">${all[113].category_name }</a></li>
								<li><a href="#">${all[114].category_name }</a></li>
								<li><a href="#">${all[115].category_name }</a></li>

								
								
							
							</ul>
						</li>
						<li><a href="#">${all[16].category_name }</a>
							<ul>
								<li><a href="#">${all[116].category_name }</a></li>
								<li><a href="#">${all[117].category_name }</a></li>
								<li><a href="#">${all[118].category_name }</a></li>
								<li><a href="#">${all[119].category_name }</a></li>
								<li><a href="#">${all[120].category_name }</a></li>
								<li><a href="#">${all[121].category_name }</a></li>
								
															
							</ul>
						</li>
						<li><a href="#">${clist[17].category_name }</a>
							<ul>
								<li><a href="#">${all[122].category_name }</a></li>
								<li><a href="#">${all[123].category_name }</a></li>
								<li><a href="#">${all[124].category_name }</a></li>
								<li><a href="#">${all[125].category_name }</a></li>
								<li><a href="#">${all[126].category_name }</a></li>
								<li><a href="#">${all[127].category_name }</a></li>
								<li><a href="#">${all[128].category_name }</a></li>
								<li><a href="#">${all[129].category_name }</a></li>
								<li><a href="#">${all[130].category_name }</a></li>
								<li><a href="#">${all[131].category_name }</a></li>
								<li><a href="#">${all[132].category_name }</a></li>
								<li><a href="#">${all[133].category_name }</a></li>
								<li><a href="#">${all[134].category_name }</a></li>
									
							</ul>
						</li>
						<li><a href="#">${all[18].category_name }</a>
							<ul>
								<li><a href="#">${all[135].category_name }</a></li>
								<li><a href="#">${all[136].category_name }</a></li>
							</ul>
						</li>
						
					</ul>
				</li>
				<!-- 외장하드 끝 -->
			<!-- 케이블 시작 -->
				<li class="has-children"><a href="#">${all[4].category_name }</a>
					<ul>
						<li><a href="#">${all[19].category_name }</a>
							<ul>
								<li><a href="#">${all[137].category_name }</a></li>
								<li><a href="#">${all[138].category_name }</a></li>
								<li><a href="#">${all[139].category_name }</a></li>
								

								
								
							
							</ul>
						</li>
						<li><a href="#">${all[20].category_name }</a>
							<ul>
								<li><a href="#">${all[140].category_name }</a></li>
								<li><a href="#">${all[141].category_name }</a></li>
								
							</ul>
						</li>
						
						
					</ul>
				</li>
				<!-- 케이블 끝 -->

				<!-- usb 시작 -->
				<li class="has-children"><a href="#">${all[5].category_name }</a>
					<ul>
						<li><a href="#">${all[21].category_name }</a>
							<ul>
								<li><a href="#">${all[142].category_name }</a></li>
								<li><a href="#">${all[143].category_name }</a></li>
								<li><a href="#">${all[144].category_name }</a></li>
								<li><a href="#">${all[145].category_name }</a></li>
								<li><a href="#">${all[146].category_name }</a></li>
								<li><a href="#">${all[147].category_name }</a></li>								
								<li><a href="#">${all[148].category_name }</a></li>
								
								
							
							</ul>
						</li>
						<li><a href="#">${all[22].category_name }</a>
							<ul>
								<li><a href="#">${all[149].category_name }</a></li>
								<li><a href="#">${all[150].category_name }</a></li>
								
							</ul>
						</li>

						
						
					</ul>
				</li>
				<!-- usb 끝 -->
			</ul> 
			
			</section>
			
			
			<c:choose>
				<c:when test="${minPrice1 ne null  }">
			<!-- 가격 범위 --> 
			<section class="widget widget-categories">
			<h3 class="widget-title">가격</h3>
				<form 
				class="price-range-slider" id="priceCheck"
				data-start-min="${minPrice1 }"
				data-start-max="${maxPrice1 }"
				data-min="0"
				data-max="10000000"
				data-step="5000">
					<div class="ui-range-slider"></div>
					<footer class="ui-range-slider-footer">
						<div class="column">
							<input type="hidden" name="category_id" value="${category_id}">
							<input type="hidden" name="keywrod" value="${keyword }">
							<button class="btn btn-outline-primary btn-sm" onclick=check()>적용</button>
						</div>
						<div class="column">
							<div class="ui-range-values mb-3">
								<div class="ui-range-value-min">
									￦<span></span> <input type="hidden" name="minPrice"  >
								</div>
								&nbsp;-&nbsp;
								<div class="ui-range-value-max">
									￦<span></span> <input type="hidden" name="maxPrice"  >
									
								</div>
							</div>
						</div>
					</footer>
				</form>
			</section>
			</c:when>
			<c:otherwise>
			
			<!-- 가격 범위 --> 
			<section class="widget widget-categories">
			<h3 class="widget-title">가격</h3>
				<form 
				class="price-range-slider" id="priceCheck"
				data-start-min="0"
				data-start-max="10000000"
				data-min="0"
				data-max="10000000"
				data-step="5000">
					<div class="ui-range-slider"></div>
					<footer class="ui-range-slider-footer">
						<div class="column">
							<input type="hidden" name="category_id" value="${category_id}">
							<input type="hidden" name="keywrod" value="${keyword }">
							<button class="btn btn-outline-primary btn-sm" onclick=check()>적용</button>
						</div>
						<div class="column">
							<div class="ui-range-values mb-3">
								<div class="ui-range-value-min">
									￦<span></span> <input type="hidden" name="minPrice"  value="${minPrice1 }">
								</div>
								&nbsp;-&nbsp;
								<div class="ui-range-value-max">
									￦<span></span> <input type="hidden" name="maxPrice" value="${maxPrice1 }" >
									
								</div>
							</div>
						</div>
					</footer>
				</form>
			</section>
			
			
			</c:otherwise>
			</c:choose>
			<!-- 브랜드 필터 -->
			<section class="widget">
			<h3 class="widget-title">브랜드</h3>
				<div class="custom-control ustom-checkbox">
					<input class="custom-control-input" type="checkbox" id="brand1">
					<label class="custom-control-label" for="brand1">
						brand1 &nbsp;<span class="text-muted">(100)</span>
					</label>
				</div>
				<div class="custom-control ustom-checkbox">
					<input class="custom-control-input" type="checkbox" id="brand2">
					<label class="custom-control-label" for="brand2">
						brand2 &nbsp;<span class="text-muted">(200)</span>
					</label>
				</div>
				<div class="custom-control ustom-checkbox">
					<input class="custom-control-input" type="checkbox" id="brand3">
					<label class="custom-control-label" for="brand3">
						brand3 &nbsp;<span class="text-muted">(300)</span>
					</label>
				</div>
				<div class="custom-control ustom-checkbox">
					<input class="custom-control-input" type="checkbox" id="brand4">
					<label class="custom-control-label" for="brand4">
						brand4 &nbsp;<span class="text-muted">(400)</span>
					</label>
				</div>
			</section>
		</aside>
	</div>
	
	<!-- ///////////////////// 상품리스트 사이드바 끝 ///////////////////// -->
</div>
</div>
<!-- 페이지 컨텐트 끝 -->


<!-- footer -->
<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp"/>

	<!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/vendor.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/scripts.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>
	
	<script type="text/javascript">
$(function(){
	var category_id=$("#category_id").val();
	var a='${param.category_id}';
	var keyword='${param.keyword}';
	var minPrice=$("input[name=minPrice]").val();
	console.log("minPrice===="+minPrice);
	var maxPrice=$("input[name=maxPrice]").val();
	function check(){
		var theForm = document.priceCheck;
		
		
		theForm.method = "post";
		theForm.action = "${pageContext.request.contextPath}/shop/product_grid";
	}
	
	if(a=='10000')
		{ 
		list(1,"new",10000,keyword,minPrice,maxPrice);
	
		}
	else 
		list(1,"new",category_id,keyword,minPrice,maxPrice); 
		
	
	$("#order").change(function(){
		
		var order=$(this).val(); 
		
		list(1,order,category_id,keyword,minPrice,maxPrice); 
		   
	}); //option값 가져오기 
	
	
//list(1); 지우니까 오류가없네여
});
	var currentPage=1; 
	function list(pageNum,order,category_id,keyword,minPrice,maxPrice){ 
		Number.prototype.format = function(){
		    if(this==0) return 0;
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		    return n;
		};
		//문자에 대한 기능 추가
		String.prototype.format = function(){
		    var num = parseFloat(this);
		    if( isNaN(num) ) return "0"; 
		    return num.format();
		};
		 
		currentPage=pageNum;
	
		$("#commList").empty();
		$.ajax({
			url:"${pageContext.request.contextPath}/shop/ajaxlist",
			data:{"pageNum":pageNum,"order":order,"category_id":category_id,"keyword":keyword,"minPrice":minPrice,"maxPrice":maxPrice},  
			dataType:"json", 
			Type:"GET", 
			success:function(data){ 
				console.log(data.list);	
				if(data.list.length==0) {
					let	html=	"<div class='col-md-4 col-sm-6'>";			
					html+=	"<div class='product-card mb-30'>";
					html+=		"<h1>찾으시는 물품이 없습니다. </h1>"
					
					html+=	"</div>";
				
					html+=	"</div>	";	
					$("#commList").append(html);
					
				}
				else{
				$(data.list).each(function(i,d){
					
						<!-- forEach 시작 부분 -->
						let	html=	"<div class='col-md-3 col-sm-6'>";			
						html+=	"<div class='product-card mb-30'>";
						html+=		"<a class='product-thumb' href='${pageContext.request.contextPath}/shop/product_detail"+"?n="+d.product_id+"&"+"m="+d.category_id+"'>";
						html+=		"	<img src='<c:url value='/upload/product_img/"+d.img_name_save+"' />' alt='<c:url value='/upload/product_img/"+d.img_name_save+"' />' />";
										html+=	"	</a> ";
										html+=	"	<div class='product-card-body'>";
										html+=		"	<div class='product-category'><a href='#'>"+d.brand+"</a></div>";
										html+=			"<h3 class='product-title'><a href='#'>"+d.product_name +"</a></h3>"; 
										html+=		"	<h4 class='product-price'>"+d.selling_price.format()+'원'+"</h4>";
										html+=		"	</div> ";
										html+=	"	<div class='product-button-group'>";
									<!-- 위시리스트 토스트 수정은 scripts.min.js 파일 -->
									html+=			"	<a class='product-button btn-wishlist' href='#'><i class='icon-heart'></i><span>관심상품</span></a>";
									html+=	"	<a class='product-button' href='#'" ;
										html+=		"	data-toast " ;
										html+=		"	data-toast-type='success'" ;
											html+=		"	data-toast-position='topRight'" ;
												html+=		"	data-toast-icon='icon-check-circle' " ;
													html+=		"	data-toast-title=' ' " ;
														html+=		"	data-toast-message='장바구니에 상품을 담았습니다!'> ";
									html+=	"	<i class='icon-shopping-cart'></i><span>장바구니</span> ";
									html+=	"	</a>";
									html+=	"</div>";
									html+=	"</div>";
									html+=	"</div>";
									
						<!-- forEach 끝 부분 -->
						html+=	"</div>";
					
						html+=	"</div>	";	
					$("#commList").append(html);					
				});
				}
				//페이징 처리
				$("#page").empty();
				$("#page1").empty();
				$("#page2").empty();
				let startPage=data.startPageNum;
				let endPage=data.endPageNum;
				let prev=data.prev;
				let next=data.next;
				
				
				
				console.log("order=="+order);
				 console.log("minPrice=="+minPrice);
				 console.log("maxPrice=="+maxPrice);
				 console.log("keyword=="+keyword);
				 console.log("category_id=="+category_id)
				let pageCount=data.pageCount;
			
				let pageHtml="";
				let pageHtml2="";
				let pageHtml3="";
				if(keyword==null || keyword==""){
					keyword=undefined;
				}
				if(prev==true){
					pageHtml += "<a class='btn btn-outline-secondary btn-sm' href='javascript:list("+ (startPage-1)+",order,category_id,keyword,minPrice,maxPrice)'><i class='icon-chevron-left'></i>이전</a>";
				}else{
					pageHtml += "<a class='btn btn-outline-secondary btn-sm disabled'><i class='icon-chevron-left'></i> 이전</a>";
				}
				
				pageHtml2 +="<ul class='pages' style='margin-top:20px;'>";
				for(let i=startPage;i<=endPage;i++){
					if(pageNum==i){
						
						pageHtml2 +="<li class='active'>";
						pageHtml2 += "<a href='javascript:list("+ i +","+order+","+category_id+","+keyword+","+minPrice+","+maxPrice+");'>"+ i + "</a> ";
						pageHtml2 +="</li>";
					}else{                                 
						pageHtml2 += "<a href='javascript:list("+ i +","+order+","+category_id+","+keyword+","+minPrice+","+maxPrice+");'>"+ i + "</a> ";
					}	
				}
				
				if(next==true){
					pageHtml3 += "<a class='btn btn-outline-secondary btn-sm' href='javascript:list("+ (endPage+1)+",order,category_id,keyword,minPrice,maxPrice)'>다음<i class='icon-chevron-right'></i></a>";
				}else{
					pageHtml3 += "<a class='btn btn-outline-secondary btn-sm disabled'>다음 <i class='icon-chevron-right'></i></a>";
				}
				$("#page").append(pageHtml);
				$("#page1").append(pageHtml2);
				$("#page2").append(pageHtml3);
			}		
		});	
	}
	
</script>
</body>
</html>