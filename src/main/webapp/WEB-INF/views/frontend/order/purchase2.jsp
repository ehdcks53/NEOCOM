<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</head>
<body>
	<jsp:include page="/WEB-INF/views/frontend/inc/header.jsp"/>
	
	 <!-- Page Title-->
    <div class="page-title">
      <div class="container">
        <div class="column">
          <h1>주문서 작성/결제</h1>
        </div>
        <div class="column">
          <ul class="breadcrumbs">
            <li><a href="index.html">Home</a>
            </li>
            <li class="separator">&nbsp;</li>
            <li>주문/결제</li>
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
              <h4 class="step-title"><i class="icon-check-circle"></i>1. 주소</h4></a><a class="step active" href="checkout-shipping.html">
              <h4 class="step-title">2. 결제</h4></a></div>
          <h4>Choose Payment Method</h4>
          <hr class="padding-bottom-1x">
          <div class="accordion" id="accordion" role="tablist">
            <div class="card">
              <div class="card-header" role="tab">
                <h6><a href="#card" data-toggle="collapse"><i class="icon-credit-card"></i>Pay with Credit Card</a></h6>
              </div>
              <div class="collapse show" id="card" data-parent="#accordion" role="tabpanel">
                <div class="card-body">
                  <p>We accept following credit cards:&nbsp;&nbsp;<img class="d-inline-block align-middle" src="img/credit-cards.png" style="width: 120px;" alt="Cerdit Cards"></p>
                  <div class="card-wrapper"></div>
                  <form class="interactive-credit-card row">
                    <div class="form-group col-sm-6">
                      <input class="form-control" type="text" name="number" placeholder="Card Number" required>
                    </div>
                    <div class="form-group col-sm-6">
                      <input class="form-control" type="text" name="name" placeholder="Full Name" required>
                    </div>
                    <div class="form-group col-sm-3">
                      <input class="form-control" type="text" name="expiry" placeholder="MM/YY" required>
                    </div>
                    <div class="form-group col-sm-3">
                      <input class="form-control" type="text" name="cvc" placeholder="CVC" required>
                    </div>
                    <div class="col-sm-6">
                      <button class="btn btn-outline-primary btn-block mt-0" type="submit">Submit</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header" role="tab">
                <h6><a class="collapsed" href="#paypal" data-toggle="collapse"><i class="socicon-paypal"></i>Pay with PayPal</a></h6>
              </div>
              <div class="collapse" id="paypal" data-parent="#accordion" role="tabpanel">
                <div class="card-body">
                  <p>PayPal - the safer, easier way to pay</p>
                  <form class="row" method="post">
                    <div class="col-sm-6">
                      <div class="form-group">
                        <input class="form-control" type="email" placeholder="E-mail" required>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <input class="form-control" type="password" placeholder="Password" required>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="d-flex flex-wrap justify-content-between align-items-center"><a class="navi-link" href="#"><u>Forgot password?</u></a>
                        <button class="btn btn-outline-primary margin-top-none" type="submit">Log In</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="card">
              <div class="card-header" role="tab">
                <h6><a class="collapsed" href="#points" data-toggle="collapse"><i class="icon-award"></i>Redeem Reward Points</a></h6>
              </div>
              <div class="collapse" id="points" data-parent="#accordion" role="tabpanel">
                <div class="card-body">
                  <p>You currently have<span class="text-medium"> 2,549</span> Reward Points to spend.</p>
                  <div class="custom-control custom-checkbox d-block">
                    <input class="custom-control-input" type="checkbox" id="use_points">
                    <label class="custom-control-label" for="use_points">Use my Reward Points to pay for this order.</label>
                  </div>
                </div>
              </div>
            </div>
          </div>
      		<div class="d-flex justify-content-between paddin-top-1x mt-4">
					<a class="btn btn-outline-secondary" href="cart.html"><i
						class="icon-arrow-left"></i><span class="hidden-xs-down">&nbsp;장바구니로
						</span></a><button id="check_module" class="btn btn-primary" 
							type="button"><span
						class="hidden-xs-down">결제하기&nbsp;</span><i
						class="icon-arrow-right"></i></button>
			</div>
       </div>
        <!-- Sidebar          -->
        <div class="col-xl-3 col-lg-4">
          <aside class="sidebar">
            <div class="padding-top-2x hidden-lg-up"></div>
            <!-- Order Summary Widget-->
            <section class="widget widget-order-summary">
              <h3 class="widget-title">Order Summary</h3>
              <table class="table">
                <tr>
                  <td>Cart Subtotal:</td>
                  <td class="text-gray-dark">$2,548.50</td>
                </tr>
                <tr>
                  <td>Shipping:</td>
                  <td class="text-gray-dark">$26.50</td>
                </tr>
                <tr>
                  <td>Estimated tax:</td>
                  <td class="text-gray-dark">$9.72</td>
                </tr>
                <tr>
                  <td></td>
                  <td class="text-lg text-gray-dark">$2,584.72</td>
                </tr>
              </table>
            </section>
            <!-- Featured Products Widget-->
            <section class="widget widget-featured-products">
              <h3 class="widget-title">Recently Viewed</h3>
              <!-- Entry-->
              <div class="entry">
                <div class="entry-thumb"><a href="shop-single.html"><img src="img/shop/widget/01.jpg" alt="Product"></a></div>
                <div class="entry-content">
                  <h4 class="entry-title"><a href="shop-single.html">GoPro Hero4 Silver</a></h4><span class="entry-meta">$287.99</span>
                </div>
              </div>
              <!-- Entry-->
              <div class="entry">
                <div class="entry-thumb"><a href="shop-single.html"><img src="img/shop/widget/02.jpg" alt="Product"></a></div>
                <div class="entry-content">
                  <h4 class="entry-title"><a href="shop-single.html">Puro Sound Labs BT2200</a></h4><span class="entry-meta">$95.99</span>
                </div>
              </div>
              <!-- Entry-->
              <div class="entry">
                <div class="entry-thumb"><a href="shop-single.html"><img src="img/shop/widget/03.jpg" alt="Product"></a></div>
                <div class="entry-content">
                  <h4 class="entry-title"><a href="shop-single.html">HP OfficeJet Pro 8710</a></h4><span class="entry-meta">$89.70</span>
                </div>
              </div>
              <!-- Entry-->
              <div class="entry pb-2">
                <div class="entry-thumb"><a href="shop-single.html"><img src="img/shop/widget/05.jpg" alt="Product"></a></div>
                <div class="entry-content">
                  <h4 class="entry-title"><a href="shop-single.html">iPhone X 256 GB Space Gray</a></h4><span class="entry-meta">$1,450.00</span>
                </div>
              </div>
            </section>
            <!-- Promo Banner--><a class="card border-0 bg-secondary" href="shop-grid-ls.html">
              <div class="card-body"><span class="d-block text-lg text-thin mb-2">Limited Time Deals</span>
                <h3>Surface Pro 4</h3>
                <p class="d-inline-block bg-warning text-white">&nbsp;&nbsp;Shop Now&nbsp;<i class="icon-chevron-right d-inline-block align-middle"></i>&nbsp;</p>
              </div><img class="d-block mx-auto" src="img/shop/widget/promo.jpg" alt="Surface Pro"></a>
          </aside>
        </div>
      </div>	
				<div>
					주문번호 보내기<input type="text" id="order_no" value="${order_no }">
					<input type="hidden" id="orderer_name" value="${orderer_name }">
					<input type="hidden" id="zip_code" value="${zip_code }">
					<input type="hidden" id="order_address" value="${order_address }">
					<input type="hidden" id="order_address_detail" value="${order_address_detail }">
					<input type="text" id="request_item" value="${request_item }">
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
	$("#check_module").click(function() {
		var IMP = window.IMP; // 생략가능
		var order_no=$("#order_no").val();
		var orderer_name=$("#orderer_name").val();
		console.log(order_no);
		IMP.init('imp55782149');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			/*
			 'kakao':카카오페이,
			 html5_inicis':이니시스(웹표준결제)
			 'nice':나이스페이
			 'jtnet':제이티넷
			 'uplus':LG유플러스
			 'danal':다날
			 'payco':페이코
			 'syrup':시럽페이
			 'paypal':페이팔
			 */

			pay_method : 'card',
			/*
			 'samsung':삼성페이,
			 'card':신용카드,
			 'trans':실시간계좌이체,
			 'vbank':가상계좌,
			 'phone':휴대폰소액결제
			 */
			merchant_uid : 'merchant_' + new Date().getTime(),
			/*
			 merchant_uid에 경우
			 https://docs.iamport.kr/implementation/payment
			 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 참고하세요.
			 나중에 포스팅 해볼게요.
			 */
			name : '상품',
			//결제창에서 보여질 이름
			amount : 100,
			//가격
			buyer_email : 'iamport@siot.do',
			buyer_name : '${orderer_name }',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		/*
		 모바일 결제시,
		 결제가 끝나고 랜딩되는 URL을 지정
		 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
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
			            "mid_num":rsp.merchant_uid
			        },
					type:"post",
					dataType:"json",
				}).done(function(data) {
					//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( rsp.success ) {
						var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num;
						msg += 'pay_method : ' + rsp.pay_method;
						
						alert(msg);
						location.href = "${pageContext.request.contextPath}/paymentSuccess?order_no="+order_no;
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				location.href = "${pageContext.request.contextPath}/paymentFail?order_no="+order_no;
			}
			alert(msg);
		});
	});
	
	
		
</script>
</html>