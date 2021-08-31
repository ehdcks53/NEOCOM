<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
	<!-- SEO Meta Tags-->
	<meta name="description" content="Unishop - Universal E-Commerce Template">
	<meta name="keywords" content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
	<meta name="author" content="Rokaux">
	<!-- Favicon and Apple Icons-->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/favicon.ico">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/static/frontend/assets/favicon&icon/favicon.png">
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
	<style type="text/css">
            .errormsg {
                color: red;
            }
        </style>
</head>
<body>
	
	<!-- footer -->
<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>
	
	
	<!-- 페이지 타이틀 -->
<div class="page-title">
	<div class="container">
		<div class="column">
			<h1>회원가입</h1>
		</div>
		<div class="column">
			<ul class="breadcrumbs">
				<li><a href="#">Home</a></li>
				<li class="separator">&nbsp;</li>
				<li>가입</li>
			</ul>
		</div>
	</div>
</div>
	<!-- 페이지 타이틀 끝 -->
	
	<!-- 페이지  컨텐트 -->
<div class="container padding-bottom-3x mb-2">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		
			<form:form class="card" method="post" modelAttribute="memberVo" id="form" action="${pageContext.request.contextPath }/account/join2">
				<div class="card-body">
					<h4 class="margin-bottom-1x text-center">회원가입</h4>
					<div class="form-group input-group" id="idbox">
						아이디
						<form:input class="form-control" type="text" path="id" id="id" name="id" placeholder="아이디를 입력하세요"/>
						<form:errors path="id" cssClass="errormsg" />					
						<!--  <input type="button" class="btn btn-default" id="idck" style="width: 30%;" value="중복확인"/>-->
						
					</div>
					<div class="form-group input-group">
						비밀번호
						<form:input class="form-control" type="password" path="password" id="pwd1" placeholder="5~12자 사이의 영문 숫자로 입력하세요"/>
						<form:errors path="password" cssClass="errormsg" /><br>
						비밀번호 확인
						<form:input class="form-control" type="password" path="password" id="pwd2"/>
					</div>
					<div class="form-group input-group">
						닉네임
						<form:input class="form-control" type="text" path="nickname" placeholder="5~12자 사이의 영문 또는 한글로 입력하세요"/>
						<form:errors path="nickname" cssClass="errormsg"/>
					</div>
					<div class="form-group input-group">
						이름
						<form:input class="form-control" type="text" path="name" placeholder="ex) 홍길동"/>
						<form:errors path="name" cssClass="errormsg"/>
					</div>
					<div class="form-group input-group">
						이메일
						<form:input class="form-control" type="text" path="email" placeholder="ex) aaa@aaa.com"/>
						<form:errors path="email" cssClass="errormsg"/>
					</div>
					<div class="form-group input-group">
						전화번호
						<form:input class="form-control" type="text" path="phone" placeholder="- 제외하고 입력하세요"/>
						<form:errors path="phone" cssClass="errormsg"/>
					</div>
					<div class="form-group input-group">
						생년월일
						<form:input class="form-control" type="text" path="birth_date" placeholder="0000/00/00"/>
						<form:errors path="birth_date" cssClass="errormsg"/>
					</div>
					<!-- regdate잇던자리 -->
					<div class="form-group input-group">
						
						<form:input class="form-control" type="hidden" path="mem_no"/>
					
					</div>
					<div class="text-center text-sm-right">
						<button class="btn btn-primary margin-bottom-none" id="joinBtn" type="submit">가입</button>
					</div>
				</div>
			</form:form>
		</div>
		<div class="col-md-3"></div>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/frontend/assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	var idck = 0;
	$(function() {
		$("#idck").click(function() {
	        
	        //userid 를 param.
	        var id =  $("#id").val(); 
	        
	        $.ajax({
	            async: true,
	            type : 'POST',
	            data : id,
	            url : "{pageContext.request.contextPath}/idcheck.do",
	            dataType : "json",
	            contentType: "application/json; charset=UTF-8",
	            success : function(data) {
	                if (data.cnt > 0) {
	                    
	                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
	                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
	                    $("#idbox").addClass("has-error")
	                    $("#idbox").removeClass("has-success")
	                    $("#id").focus();
	                    
	                
	                } else {
	                    alert("사용가능한 아이디입니다.");
	                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
	                    $("#divInputId").addClass("has-success")
	                    $("#divInputId").removeClass("has-error")
	                    $("#pwd1").focus();
	                    //아이디가 중복하지 않으면  idck = 1 
	                    idck = 1;
	                    
	                }
	            },
	            error : function(error) {
	                
	                alert("error : " + error);
	            }
	        });
	    });
		/*
		$("#id").keyup(function() {
			let id=$("#id").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/isMember?"+id,
				type : "json",
				
				success : function(data) {
					
					if (result == 1) {
						$("#id_check").html("중복된 아이디가 있습니다.");
						$("#joinBtn").attr("disabled", "disabled");
					} else {
						$("#id_check").html("");
						$("#joinBtn").removeAttr("disabled");
					}
					
					if(data.using==true){
						$("#idcheck").html("사용중인 아이디입니다.");
					}else{
						$("#idcheck").html("사용가능한 아이디입니다.");
					}
				},
			})
		});
		
		$('.id_input').on("propertychange change keyup paste input", function(){
			var id = $('.id_input').val();			// .id_input에 입력되는 값
			var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
			$.ajax({
				type : "post",
				url : "{pageContext.request.contextPath}/memberIdChk",
				data : data,
				success : function(result){
					 console.log("성공 여부" + result);
					 if(result != 'fail'){
							$('.id_input_re_1').css("display","inline-block");
							$('.id_input_re_2').css("display", "none");				
						} else {
							$('.id_input_re_2').css("display","inline-block");
							$('.id_input_re_1').css("display", "none");				
						}
				}
			});

		});*/
	    if($("#form").submit(function(){
	    	if($("#pwd1").val() != $("#pwd2").val()){
	    		alert("비밀번호가 일치하지 않습니다.");
	    		$("#pwd1").val("").focus();
				$("#pwd2").val("");
				return false;
	    	}
	    }));
	});
 
 
</script>

</body>
</html>