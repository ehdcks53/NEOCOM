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
<link rel="stylesheet" media="screen" href="static/frontend/assets/css/vendor.min.css">
<!-- Main Template Styles-->
<link id="mainStyles" rel="stylesheet" media="screen"
	href="static/frontend/assets/css/styles.min.css">
<!-- Modernizr-->
<script src="js/modernizr.min.js"></script>

</head>
<body>
	<div class="col-xl-9 col-md-12">
		<div class="steps flex-sm-nowrap mb-5">
			<a class="step" href="checkout-address.html">
				<h4 class="step-title">
					<i class="icon-check-circle"></i>1. Address
				</h4>
			</a><a class="step active" href="checkout-shipping.html">
				<h4 class="step-title">2. Shipping</h4>
			</a><a class="step" href="checkout-payment.html">
				<h4 class="step-title">3. Payment</h4>
			</a><a class="step" href="checkout-review.html">
				<h4 class="step-title">4. Review</h4>
			</a>
		</div>
		<h4>Choose Shipping Method</h4>
		<hr class="padding-bottom-1x">
		<div class="table-responsive">
			<table class="table table-hover">
				<thead class="thead-default">
					<tr>
						<th></th>
						<th>Shipping method</th>
						<th>Delivery time</th>
						<th>Handling fee</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="courier"
									name="shipping-method" checked> <label
									class="custom-control-label" for="courier"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">Courier</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone), United States & Canada</span></td>
						<td class="align-middle">2 - 4 days</td>
						<td class="align-middle">$26.50</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="local"
									name="shipping-method"> <label
									class="custom-control-label" for="local"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">Local
								Shipping</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone), United States & Canada</span></td>
						<td class="align-middle">up to one week</td>
						<td class="align-middle">$10.00</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="flat"
									name="shipping-method"> <label
									class="custom-control-label" for="flat"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-darkm">Flat
								Rate</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone)</span></td>
						<td class="align-middle">5 - 7 days</td>
						<td class="align-middle">$33.85</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="ups"
									name="shipping-method"> <label
									class="custom-control-label" for="ups"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">UPS
								Ground Shipping</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone)</span></td>
						<td class="align-middle">4 - 6 days</td>
						<td class="align-middle">$18.00</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="pickup"
									name="shipping-method"> <label
									class="custom-control-label" for="pickup"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">Local
								Pickup from store</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone)</span></td>
						<td class="align-middle">&mdash;</td>
						<td class="align-middle">$0.00</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="locker"
									name="shipping-method"> <label
									class="custom-control-label" for="locker"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">Pick
								Up at Unishop Locker</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone), United States & Canada</span></td>
						<td class="align-middle">&mdash;</td>
						<td class="align-middle">$9.99</td>
					</tr>
					<tr>
						<td class="align-middle">
							<div class="custom-control custom-radio mb-0">
								<input class="custom-control-input" type="radio" id="global"
									name="shipping-method"> <label
									class="custom-control-label" for="global"></label>
							</div>
						</td>
						<td class="align-middle"><span class="text-gray-dark">Unishop
								Global Export</span><br>
						<span class="text-muted text-sm">All Addresses(default
								zone), outside United States</span></td>
						<td class="align-middle">3 - 4 days;</td>
						<td class="align-middle">$25.00</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>