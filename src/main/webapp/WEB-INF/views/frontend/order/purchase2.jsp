<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="description"
	content="Unishop - Universal E-Commerce Template">
<meta name="keywords"
	content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
<meta name="author" content="Rokaux">
<!-- Mobile Specific Meta Tag-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- Favicon and Apple Icons-->
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link rel="icon" type="image/png" href="favicon.png">
<link rel="apple-touch-icon" href="touch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="152x152" href="touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="167x167"
	href="touch-icon-ipad-retina.png">
<!-- Vendor Styles including: Bootstrap, Font Icons, Plugins, etc.-->
<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/static/frontend/assets/css/vendor.min.css">
<!-- Main Template Styles-->
<link id="mainStyles" rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/static/frontend/assets/css/styles.min.css">
<!-- Modernizr-->
<script src="${pageContext.request.contextPath}/static/frontend/assets/js/modernizr.min.js"></script>
<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	.myth {
		font-size: 23px;
		line-height:100px;
	}
	.mytable {
		height: 250px;
		margin-top: 30px;
		margin-bottom: 150px;
		border:none;
	}
	.mytable th{
		border:none;
	}
	.mytable thead td{
		border:none;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>
	
	 <!-- Page Title-->
    <div class="page-title">
      <div class="container">
        <div class="column">
          <h1>????????? ??????/??????</h1>
        </div>
        <div class="column">
          <ul class="breadcrumbs">
            <li><a href="index.html">Home</a>
            </li>
            <li class="separator">&nbsp;</li>
            <li>??????/??????</li>
          </ul>
        </div>
      </div>
    </div>

	
	<!-- Page Content-->
    <div class="container padding-bottom-3x mb-2">
      <div class="row">
        <!-- Checkout Adress-->
        <div class="col-xl-9 col-lg-8">
          <div class="steps flex-sm-nowrap mb-5"><a class="step" href="checkout-address.html">
              <h4 class="step-title"><i class="icon-check-circle"></i>1. ??????</h4></a><a class="step active" href="checkout-shipping.html">
              <h4 class="step-title">2. ??????</h4></a></div>
          <h4>?????? ??????</h4>
          
          
          <hr class="padding-bottom-1x">
          <div class="accordion" id="accordion" role="tablist">
          <div class="col-xl-12  col-lg-8">
	      	<table class="table mytable table-hover">
	        	<thead style="height:125px;">
	          		<tr>
	          			<th class="myth text-center">????????????</th>
	          			<th class="myth text-center">?????????</th>
	          			<th class="myth text-center">??? ???????????? ??????</th>          			
	          		</tr>
	          	</thead>
	          	<tbody style="height:100%">
	          		<c:choose>
	          			<c:when test="${!empty vo }">
	          				<tr>
			          			<th class="myth text-center">${vo.tot_price} ???</th>
			          			<th class="myth text-center">0 ???</th>
			          			<th class="myth text-center">${vo.tot_price} ???</th>
			          		</tr>
	          			</c:when>
	          			<c:otherwise>
	          				<tr>
			          			<th class="myth text-center">${tot_price} ???</th>
			          			<th class="myth text-center">0 ???</th>
			          			<th class="myth text-center">${tot_price} ???</th>
			          		</tr>
	          			</c:otherwise>
	          		</c:choose>
	          	</tbody>
	      	</table>
          </div>
            
            
            
          </div>
      		<div class="d-flex justify-content-between paddin-top-1x mt-4">
					<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath }/member/cart"><i
						class="icon-arrow-left"></i><span class="hidden-xs-down">&nbsp;???????????????
						</span></a><button id="check_module" class="btn btn-primary" 
							type="button"><span
						class="hidden-xs-down">????????????&nbsp;</span><i
						class="icon-arrow-right"></i></button>
			</div>
       </div>
        
        <!-- Sidebar          -->
			<div class="col-xl-3 col-lg-4" id="sidebar">
				<aside class="sidebar" >
					<div class="padding-top-2x hidden-lg-up"></div>
					<!-- Order Summary Widget-->
					<section class="widget widget-order-summary">
						<h3 class="widget-title">????????????(Order Summary)</h3>
						<table class="table">
							<c:choose>
			          			<c:when test="${!empty vo }">
			          				<tr>
										<td>??? ???????????? : </td>
										<td class="text-gray-dark">${vo.tot_price } ???</td>
									</tr>		
									<tr>
										<td>?????????(Shipping):  </td>
										<td class="text-gray-dark">0???</td>
									</tr>
									<tr>
										<td></td>
										<td class="text-lg text-gray-dark">${vo.tot_price } ???</td>
									</tr>
			          			</c:when>
			          			<c:otherwise>
			          				<tr>
										<td>??? ???????????? : </td>
										<td class="text-gray-dark">${tot_price } ???</td>
									</tr>		
									<tr>
										<td>?????????(Shipping):  </td>
										<td class="text-gray-dark">0???</td>
									</tr>
									<tr>
										<td></td>
										<td class="text-lg text-gray-dark">${tot_price } ???</td>
									</tr>
			          			</c:otherwise>
			          		</c:choose>
						</table>
					</section>
					<!-- Featured Products Widget-->
					<section class="widget widget-featured-products">
						<h3 class="widget-title">?????? ??? ??????</h3>
						<!-- Entry-->
						<div class="entry">
							<div class="entry-thumb">
								<a href="shop-single.html">
									<img   src="<c:url value='/upload/product_img/2021\08\31/0531dcae-2721-4cdf-afe2-f4a5fe205420_ASRock B560M PRO4 ?????????.jpg' />"
									alt="<c:url value='/upload/product_img/2021\08\31/0531dcae-2721-4cdf-afe2-f4a5fe205420_ASRock B560M PRO4 ?????????.jpg' />" />
								</a>
							</div>
							<div class="entry-content">
								<h4 class="entry-title">
									<a href="shop-single.html">ASRock B560M PRO4 ?????????</a>
								</h4>
								<span class="entry-meta">150000 ???</span>
							</div>
						</div>
						<!-- Entry-->
						<div class="entry">
							<div class="entry-thumb">
								<a href="shop-single.html">
									<img   src="<c:url value='/upload/product_img/2021\08\31/f11b59b4-b7e1-422d-8473-396a5720877a_???????????? DDR4 8G PC4-25600 (??????).jpg' />"
									alt="<c:url value='/upload/product_img/2021\08\31/f11b59b4-b7e1-422d-8473-396a5720877a_???????????? DDR4 8G PC4-25600 (??????).jpg' />" />
								</a>
							</div>
							<div class="entry-content">
								<h4 class="entry-title">
									<a href="shop-single.html">???????????? DDR4 8G PC4-25600 (??????)</a>
								</h4>
								<span class="entry-meta">250000 ???</span>
							</div>
						</div>
						<!-- Entry-->
						<div class="entry">
							<div class="entry-thumb">
								<a href="shop-single.html">
									<img   src="<c:url value='/upload/product_img/2021\08\31/1c8a65ae-e3db-4641-91be-28d2e25ec077_MSI ????????? GTX1050 Ti OC D5 4GB ????????????.jpg' />"
									alt="<c:url value='/upload/product_img/2021\08\31/1c8a65ae-e3db-4641-91be-28d2e25ec077_MSI ????????? GTX1050 Ti OC D5 4GB ????????????.jpg' />" />
								</a>
							</div>
							<div class="entry-content">
								<h4 class="entry-title">
									<a href="shop-single.html">MSI ????????? GTX1050 Ti OC D5 4GB ????????????.jpg</a>
								</h4>
								<span class="entry-meta">410400???</span>
							</div>
						</div>
					</section>
					<!-- Promo Banner-->
					<a class="card border-0 bg-secondary" href="shop-grid-ls.html">
						<div class="card-body">
							<span class="d-block text-lg text-thin mb-2">Limited Time
								Deals</span>
								<img   src="<c:url value='/upload/product_img/2021\08\31/a7cdfca9-ca62-4dd8-a53a-f98eaf2d655e_?????? CNPS9X OPTIMA WHITE LED.jpg' />"
									alt="<c:url value='/upload/product_img/2021\08\31/a7cdfca9-ca62-4dd8-a53a-f98eaf2d655e_?????? CNPS9X OPTIMA WHITE LED.jpg' />" />
							
							<p class="d-inline-block bg-warning text-white">
								&nbsp;&nbsp;Shop Now&nbsp;<i
									class="icon-chevron-right d-inline-block align-middle"></i>&nbsp;
							</p>
						</div>
					</a>
				</aside>
			</div>
        
      </div>	
				<div>
					<input type="hidden" id="order_no" value="${order_no }">
					<c:choose>
						<c:when test="${!empty vo }">
							<input type="hidden" name="orderer_name" id="orderer_name" value=${vo.orderer_name }>
						</c:when>
						<c:otherwise>
							<input type="hidden" id="orderer_name" value="${orderer_name }">
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="tot_price" value="${tot_price }">
					<input type="hidden" id="zip_code" value="${zip_code }">
					<input type="hidden" id="order_address" value="${order_address }">
					<input type="hidden" id="order_address_detail" value="${order_address_detail }">
					<input type="hidden" id="request_item" value="${request_item }">
					<c:forEach items="${cart_no }" varStatus="i">
						<input type="hidden" name="cart_no" id="cart_no" value=${cart_no[i.index] }>
					</c:forEach>
					
					</div>
			
				
				<form method="post">
				
				</form>
		</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/frontend/inc/footer.jsp" />


	<!-- Back To Top Button-->
	<a class="scroll-to-top-btn" href="#"><i class="icon-chevron-up"></i></a>
	<!-- Backdrop-->
	<div class="site-backdrop"></div>
</body>


<script>
	$(function(){
		const scrollHeight = 260;
		var body = document.body,
	
	    html = document.documentElement;
		var height = Math.max( body.scrollHeight, body.offsetHeight, 
			 html.clientHeight, html.scrollHeight, html.offsetHeight );
		$(".sidebar").css({
			"top":-height+1703
		});
		var endScroll=height-1321
		var endPx=height-1571
		//???????????? ?????????
	
		function sidebar(){
			if($(window).scrollTop()>endScroll){
				document.getElementById('sidebar').style.top = endPx + 'px';
			}else if($(window).scrollTop() > scrollHeight){
				let top = $(window).scrollTop() - scrollHeight + 10;
				document.getElementById('sidebar').style.top = top + 'px';
				console.log($(window).scrollTop());
				console.log(height);
			}else if($(window).scrollTop()<scrollHeight){
				document.getElementById('sidebar').style.top = '0px';
			}
		}
	
		sidebar();
	
		$(window).scroll(()=>{
			sidebar();
		});
	
	});

	$("#check_module").click(function() {
		var IMP = window.IMP; // ????????????
		var order_no=$("#order_no").val();
		var cart_no=[];
		var cart_no_size = $("input[name='cart_no']").length;
	        for(i=0;i< cart_no_size; i++){	           
	        	cart_no[i]=$("input[name='cart_no']").eq(i).attr("value");
	        	console.log(cart_no[i]);
	        }
			if(cart_no_size==0){
				cart_no=0;
				console.log("cart_no???" +cart_no);
			}
		var orderer_name=$("#orderer_name").val();
		console.log(order_no+" A "+cart_no);
		IMP.init('imp55782149');
		// 'iamport' ?????? ???????????? "????????? ????????????"??? ??????
		// i'mport ????????? ????????? -> ????????? -> ?????????????????????
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0?????? ??????.
			/*
			 'kakao':???????????????,
			 html5_inicis':????????????(???????????????)
			 'nice':???????????????
			 'jtnet':????????????
			 'uplus':LG????????????
			 'danal':??????
			 'payco':?????????
			 'syrup':????????????
			 'paypal':?????????
			 */

			pay_method : 'card',
			/*
			 'samsung':????????????,
			 'card':????????????,
			 'trans':?????????????????????,
			 'vbank':????????????,
			 'phone':?????????????????????
			 */
			merchant_uid : 'merchant_' + new Date().getTime(),
			/*
			 merchant_uid??? ??????
			 https://docs.iamport.kr/implementation/payment
			 ?????? url??? ??????????????? ?????? ??? ?????? ????????? ????????????.
			 ???????????????.
			 ????????? ????????? ????????????.
			 */
			name : 'Neocom',
			//??????????????? ????????? ??????
			amount : 100,
			//??????
			buyer_email : 'iamport@siot.do',
			buyer_name : '${orderer_name }',
			buyer_tel : '010-1234-5678',
			buyer_addr : '??????????????? ????????? ?????????',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		/*
		 ????????? ?????????,
		 ????????? ????????? ???????????? URL??? ??????
		 (???????????????, ?????????, ????????? ????????? ????????????. PC??? ??????????????? callback????????? ????????? ?????????)
		 */
		}, function(rsp) {
			
			console.log(rsp);
			if (rsp.success) {
				jQuery.ajax({
					url:"${pageContext.request.contextPath}/paymentInsert",
					
					data:{
						imp_uid : rsp.imp_uid,
						"pg" :rsp.pg,
						"pay_method":rsp.card,
			            "order_no":order_no,
			            "payment_amount":rsp.paid_amount,
			            "payer_name":orderer_name,
			            "payment_status":rsp.status,
			            "mid_num":rsp.merchant_uid,
			            "cart_no":cart_no
			        },
					type:"post",
					dataType:"json",
				}).done(function(data) {
					//[2] ???????????? REST API??? ?????????????????? ??? ?????????????????? ???????????? ??????
		    		if ( rsp.success ) {
						var msg = '????????? ?????????????????????.  ';
						msg += '???????????? : ' + order_no;
						msg += '  ????????? ??????: ' + orderer_name;
						msg += '  ?????? ?????? : ' + rsp.paid_amount + '???' ;
						
						msg += ' ?????? ?????? : ' + rsp.pay_method;
						
						alert(msg);
						location.href = "${pageContext.request.contextPath}/paymentSuccess?order_no="+order_no+"&cart_no="+cart_no;
		    		} else {
		    			//[3] ?????? ????????? ????????? ?????? ???????????????.
		    			//[4] ????????? ????????? ????????? ????????? ?????? ????????? ?????????????????????????????????.
		    		}
		    	});
			} else {
				var msg = '????????? ?????????????????????.';
				msg += '???????????? : ' + rsp.error_msg;
				location.href = "${pageContext.request.contextPath}/paymentFail?order_no="+order_no;
				alert(msg);
			}
			
		});
	});
	
	
		
</script>
</html>