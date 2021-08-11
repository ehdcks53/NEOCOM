<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Color Admin | HTML Startup</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN core-css ================== -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/static/admin/assets/css/vendor.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/static/admin/assets/css/default/app.min.css" rel="stylesheet" />
	<!-- ================== END core-css ================== -->
	
<style>
section{
	
	width: 100%; height: 500px; 
	margin-left: 10%;margin-right: 10%;
	margin-bottom: 300px;
}
#box1{
	width: 50%;
	height: 60%;
	float: left;
}
#box2{
	width: 50%;
	height: 60%;
	float: left;
}
</style>

</head>
<body>

	<!-- BEGIN #loader -->
	<div id="loader" class="app-loader">
		<span class="spinner"></span>
	</div>
	<!-- END #loader -->
	<!-- BEGIN #app -->
	<div id="app" class="app app-header-fixed app-sidebar-fixed">
		<!-- BEGIN #header -->
		<div id="header" class="app-header">
			<!-- BEGIN navbar-header -->
			<div class="navbar-header">
				<a href="index.html" class="navbar-brand"><span class="navbar-logo"></span> <b>Color</b> Admin</a>
				<button type="button" class="navbar-mobile-toggler" data-toggle="app-sidebar-mobile">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<!-- END navbar-header -->
			
			<!-- BEGIN header-nav -->
			<div class="navbar-nav">
				<div class="navbar-item navbar-form">
					<form action="" method="POST" name="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter keyword" />
							<button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
						</div>
					</form>
				</div>
				<div class="navbar-item dropdown">
					<a href="#" data-bs-toggle="dropdown" class="navbar-link dropdown-toggle fs-14px">
						<i class="fa fa-bell"></i>
						<span class="badge">0</span>
					</a>
					<div class="dropdown-menu media-list dropdown-menu-end">
						<div class="dropdown-header">NOTIFICATIONS (0)</div>
						<div class="text-center w-300px py-3">
							No notification found
						</div>
					</div>
				</div>
				<div class="navbar-item navbar-user dropdown">
					<a href="#" class="navbar-link dropdown-toggle d-flex align-items-center" data-bs-toggle="dropdown">
						<div class="image image-icon bg-gray-800 text-gray-600">
							<i class="fa fa-user"></i>
						</div>
						<span class="d-none d-md-inline">Adam Schwartz</span> <b class="caret ms-10px"></b>
					</a>
					<div class="dropdown-menu dropdown-menu-end me-1">
						<a href="javascript:;" class="dropdown-item">Edit Profile</a>
						<a href="javascript:;" class="dropdown-item"><span class="badge badge-danger float-end">2</span> Inbox</a>
						<a href="javascript:;" class="dropdown-item">Calendar</a>
						<a href="javascript:;" class="dropdown-item">Setting</a>
						<a href="${pageContext.request.contextPath }/admin/cate/cateinsert" class="dropdown-item">카테고리추가</a>
                   		<a href="${pageContext.request.contextPath }/admin/product/productInsert" class="dropdown-item">상품추가</a>
						<div class="dropdown-divider"></div>
						<a href="javascript:;" class="dropdown-item">Log Out</a>
					</div>
				</div>
			</div>
			<!-- END header-nav -->
		</div>
		<!-- END #header -->
		<!-- BEGIN #sidebar -->
		<div id="sidebar" class="app-sidebar">
			<!-- BEGIN scrollbar -->
			<div class="app-sidebar-content" data-scrollbar="true" data-height="100%">
				<!-- BEGIN menu -->
				<div class="menu">
					<div class="menu-profile">
						<a href="javascript:;" class="menu-profile-link" data-toggle="app-sidebar-profile" data-target="#appSidebarProfileMenu">
							<div class="menu-profile-cover with-shadow"></div>
							<div class="menu-profile-image menu-profile-image-icon bg-gray-900 text-gray-600">
								<i class="fa fa-user"></i>
							</div>
							<div class="menu-profile-info">
								<div class="d-flex align-items-center">
									<div class="flex-grow-1">
										Sean Ngu
									</div>
									<div class="menu-caret ms-auto"></div>
								</div>
								<small>Front end developer</small>
							</div>
						</a>
					</div>
					<div id="appSidebarProfileMenu" class="collapse">
						<div class="menu-item pt-5px">
							<a href="javascript:;" class="menu-link">
								<div class="menu-icon"><i class="fa fa-cog"></i></div>
								<div class="menu-text">Settings</div>
							</a>
						</div>
						<div class="menu-item">
							<a href="javascript:;" class="menu-link">
								<div class="menu-icon"><i class="fa fa-pencil-alt"></i></div>
								<div class="menu-text"> Send Feedback</div>
							</a>
						</div>
						<div class="menu-item pb-5px">
							<a href="javascript:;" class="menu-link">
								<div class="menu-icon"><i class="fa fa-question-circle"></i></div>
								<div class="menu-text"> Helps</div>
							</a>
						</div>
						<div class="menu-divider m-0"></div>
					</div>
					<div class="menu-header">Navigation</div>
					<div class="menu-item active">
						<a href="index.html" class="menu-link">
							<div class="menu-icon">
								<i class="fa fa-th-large"></i>
							</div>
							<div class="menu-text">Home</div>
						</a>
					</div>
					
					<div class="menu-item has-sub">
						<a href="javascript:;" class="menu-link">
							<div class="menu-icon">
								<i class="fa fa-align-left"></i>
							</div>
							<div class="menu-text">Menu Level</div>
							<div class="menu-caret"></div>
						</a>
						<div class="menu-submenu">
							<div class="menu-item has-sub">
								<a href="javascript:;" class="menu-link">
									<div class="menu-text">Menu 1.1</div>
									<div class="menu-caret"></div>
								</a>
								<div class="menu-submenu">
									<div class="menu-item has-sub">
										<a href="javascript:;" class="menu-link">
											<div class="menu-text">Menu 2.1</div>
											<div class="menu-caret"></div>
										</a>
										<div class="menu-submenu">
											<div class="menu-item"><a href="javascript:;" class="menu-link"><div class="menu-text">Menu 3.1</div></a></div>
											<div class="menu-item"><a href="javascript:;" class="menu-link"><div class="menu-text">Menu 3.2</div></a></div>
										</div>
									</div>
									<div class="menu-item"><a href="javascript:;" class="menu-link"><div class="menu-text">Menu 2.2</div></a></div>
									<div class="menu-item"><a href="javascript:;" class="menu-link"><div class="menu-text">Menu 2.3</div></a></div>
								</div>
							</div>
							<div class="menu-item"><a href="javascript:;" class="menu-link"><div class="menu-text">Menu 1.2</div></a></div>
							<div class="menu-item"><a href="javascript:;" class="menu-link"><div class="menu-text">Menu 1.3</div></a></div>
						</div>
					</div>
					
					<!-- BEGIN minify-button -->
					<div class="menu-item d-flex">
						<a href="javascript:;" class="app-sidebar-minify-btn ms-auto" data-toggle="app-sidebar-minify"><i class="fa fa-angle-double-left"></i></a>
					</div>
					<!-- END minify-button -->
					
				</div>
				<!-- END menu -->
			</div>
			<!-- END scrollbar -->
		</div>
		<div class="app-sidebar-bg"></div>
		<div class="app-sidebar-mobile-backdrop"><a href="#" data-dismiss="app-sidebar-mobile" class="stretched-link"></a></div>
		<!-- END #sidebar -->
		
		<!-- BEGIN #content -->
		<div id="content" class="app-content">
			<!-- BEGIN breadcrumb -->
			<ol class="breadcrumb float-xl-end">
				<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
				<li class="breadcrumb-item"><a href="javascript:;">Library</a></li>
				<li class="breadcrumb-item active">Data</li>
			</ol>
			<!-- END breadcrumb -->
			<!-- BEGIN page-header -->
			<h1 class="page-header">Page Header <small>header small text goes here...</small></h1>
			<!-- END page-header -->
			
			<!-- BEGIN panel -->
			<div class="panel panel-inverse">
				<div class="panel-heading">
					<h4 class="panel-title">Panel Title here</h4>
					<div class="panel-heading-btn">
						<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
						<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload"><i class="fa fa-redo"></i></a>
						<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse"><i class="fa fa-minus"></i></a>
						<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove"><i class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="panel-body">
					<h1>전체 카테고리</h1>
<section>
<div id="box1">
<a href="${pageContext.request.contextPath }/admin/cate/catelist">전체카테고리 보기</a> | <a href="${pageContext.request.contextPath }/admin/cate/cateinsert">이전으로</a><br>
<table width="600" border="1" height="500">
	<tr>
		<th>고유번호</th>
		<th>카테고리명</th>
		<th>상위 카테고리 코드</th>
		<th>정렬 순서 코드</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.category_id }</td>
			<td>${vo.category_name }</td>
			<td>${vo.category_parent }</td>
			<td>${vo.category_order }</td>
			<td><a href="${pageContext.request.contextPath }/admin/cate/delete?category_id=${vo.category_id }">삭제</a></td>
			<td><a href="${pageContext.request.contextPath }/admin/cate/update?category_id=${vo.category_id }">수정</a></td>
			
			
		</tr>
	</c:forEach>
	
	
</table>
<div >
	<c:if test="${pu.prevPage }">
				<a href="${pageContext.request.contextPath }/admin/cate/catelist?pageNum=${pu.pageNum-1}&field=${field}&keyword=${keyword}"><span>이전</span></a></c:if>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		
		<c:choose>
			<c:when test="${pu.pageNum==i }"><!-- 현재페이지 -->
				<a href="${pageContext.request.contextPath }/admin/cate/catelist?pageNum=${i }&field=${field}&keyword=${keyword}">
				<span style='color:blue;font-weight: bold'>[${i }]</span>
				</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath }/admin/cate/catelist?pageNum=${i }&field=${field}&keyword=${keyword}">
				<span style='color:gray;'>[${i }]</span>
				</a>
				
				
			</c:otherwise>
		</c:choose>
		
     
	</c:forEach>
	<c:if test="${pu.nextPage }">
				<a href="${pageContext.request.contextPath }/admin/cate/catelist?pageNum=${pu.pageNum+1 }&field=${field}&keyword=${keyword}"><span>다음</span></a></c:if>
	

	
</div>
<div>
	<form method="post" action="${pageContext.request.contextPath }/admin/cate/catelist">
		<select name="field">
			<option value="category_parent" <c:if test="${field=='category_parent' }">selected</c:if> >상위카테고리</option>
			<option value="category_name" <c:if test="${field=='category_name' }">selected</c:if>>카테고리명</option>
			<option value="category_order" <c:if test="${field=='category_order' }">selected</c:if>>정렬순서</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="검색">
	</form>
</div>
</div>
<div id="box2">
<h5>상위 카테고리 코드 설명</h5>
<ul style=list-style:none;>
	
	<li>부품코드는 1</li>
	<li>cpu 코드: 3 메인보드 코드: 4 램 코드: 5</li>
	<li>그래픽카드(vga) 코드: 6 ssd 코드: 7 hdd: 8 power 코드: 9</li>
	<li>주변기기는 2</li>
	<li>쿨러 코드: 10 컨트롤러 코드: 11</li>
	<li>외장하드 코드: 12 케이블 코드: 13 hdd: 8 USB 코드: 14</li>
	<li> 상위 카테고리 코드에 필시 적으세요</li>
	<li style=font-size:20px;>정렬순서 : 1->최상위 부품 
	<li style=font-size:20px;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2-> 카테고리별 분류 항목 </li>
	<li style=font-size:20px;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3-> 세부 항목</li>
</ul>

</div>

</section>
				</div>
			</div>
			<!-- END panel -->
		</div>
		<!-- END #content -->
		
		<!-- BEGIN scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top" data-toggle="scroll-to-top"><i class="fa fa-angle-up"></i></a>
		<!-- END scroll to top btn -->
	</div>
	<!-- END #app -->
	
	<!-- ================== BEGIN core-js ================== -->
	<script src="${pageContext.request.contextPath }/static/admin/assets/js/vendor.min.js"></script>
	<script src="${pageContext.request.contextPath }/static/admin/assets/js/app.min.js"></script>
	<script src="${pageContext.request.contextPath }/static/admin/assets/js/theme/default.min.js"></script>
	<!-- ================== END core-js ================== -->
	
</body>
</html>