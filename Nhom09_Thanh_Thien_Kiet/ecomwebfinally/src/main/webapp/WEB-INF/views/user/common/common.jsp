<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="container product_section_container">
	<!-- Start Checkout -->
	<section class="shop checkout section">
		
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-12">
						<div class="checkout-form">
							<h2>Thông tin giao hàng</h2>
							<p>Hoàn tất thông tin để đặt hàng!!</p>
							<!-- Form -->
						<form class="form" id="review_form" action=<c:url value = "/user/cart/SaveOrder"/>
							method="POST">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>First Name<span>*</span></label> <input
											readonly="readonly" type="text" name="firstName"
											placeholder="" required="required" value="${user.firstName}">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>Last Name<span>*</span></label> <input
											readonly="readonly" type="text" name="lastName"
											placeholder="" required="required" value="${user.lastName}">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>Email<span>*</span></label> <input readonly="readonly"
											type="email" name="email" placeholder="" required="required"
											value="${user.lastName}@gmail.com">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>Phone <span>*</span></label> <input readonly="readonly"
											type="number" name="phone" placeholder="" required="required"
											value="${user.phone}">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>Đơn vị vận chuyển giao hàng<span>*</span></label> 
										<select id="delivery" onchange="deliveryChanged(this)">
											<option>--Vui lòng chọn hình thức giao hàng--</option>
											<c:forEach items="${delivery}" var="delivery">
												<option value="${delivery.price},${delivery.id}">${delivery.name}</option>
											</c:forEach>
										</select>
									<input hidden="hidden" readonly="readonly" value="1" id="deliveryid" name="delivereid">

									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>Tỉnh / Thành phố<span>*</span></label> <select
											name="state-province" id="state-province">
											<option value="Thành phố HCM" selected="selected">Thành
												phố HCM</option>

										</select>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>Địa chỉ<span>*</span></label> <input type="text"
											name="address" placeholder="" required="required">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>Đường<span>*</span></label> <input type="text"
											name="address1" placeholder="" required="required">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>Nhập mã giảm giá<span></span></label> <input
											type="text" name="post" placeholder="" required="required">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>Company<span>*</span></label> <select
											name="company_name" id="company">
											<option value="company" selected="selected">Giao đến</option>
											<option>Trường Học</option>
											<option>Nhà Riêng</option>

										</select>
									</div>
								</div>

							</div>
														<!-- Button Widget -->
							<div class="single-widget get-button">
								<div class="content">
									<div class="button">
										<button type="submit" class="btn" value="Submit">Đặt
											Hàng</button>
										<!-- <a href="/user/cart/SaveOrder" class="btn">Đặt Hàng</a> -->
									</div>
								</div>
							</div>
							<div class="single-widget get-button">
								<div class="content">
									<div class="button">
										
										 <a href="/user/cart/List" class="btn">Hủy</a>
									</div>
								</div>
							</div>
							<!--/ End Button Widget -->
						</form>
							<!--/ End Form -->
						</div>
					</div>
					<div class="col-lg-4 col-12">
						<div class="order-details">
							<!-- Order Widget -->
							<div class="single-widget">
								<h2>CART TOTALS</h2>
								<div class="content">
									<ul>
										<li>Sub Total $<span id="bandau">${sum}</span></li>
										<li>(+) Shipping $<span id="vanchuyen"></span></li>
										<li>(-) Shipping $<span id="giamvanchuyen">0</span></li>
										<li>Total $<span id="tong">${sum}</span></li>
									</ul>
								</div>
							</div>
							<!--/ End Order Widget -->
							<!-- Order Widget -->
							<div class="single-widget">
								<h2>Payments</h2>
								<div class="content">
									<div class="checkbox">
										<label><input name="updates" id="1" type="checkbox"
											checked="checked">Thanh toán khi nhận hàng</label> <label><input
											name="news" id="2" type="checkbox"> Thẻ tín dụng</label> <label><input
											name="news" id="3" type="checkbox"> Ví T2K</label>
									</div>
								</div>
							</div>
							<!--/ End Order Widget -->
							<!-- Payment Method Widget -->
							<div class="single-widget payement">
								<div class="content">
									<img src="/resources/cart/images/payment-method.png" alt="#">
								</div>
							</div>
							<!--/ End Payment Method Widget -->

						</div>
					</div>
				</div>
			</div>

			<!--  hidden="hidden" -->
			<script language="javascript">
				function deliveryChanged(obj) {
					var value = obj.value;
					var idvc = value.slice(value.indexOf(",") + 1);
					var gia = value.slice(0, value.indexOf(","));
					var vanchuyen = $('#vanchuyen');
					var tong = $('#tong');
					var bandau = $('#bandau');
					vanchuyen.text(gia);
					tong.text(parseInt(bandau.text()) + parseInt(gia));
					document.getElementById('deliveryid').value = idvc;
				}
			</script>
		
	</section>
	<!--/ End Checkout -->
</div>

<!-- Benefit -->

<div class="benefit">
	<div class="container">
		<div class="row benefit_row">
			<div class="col-lg-3 benefit_col">
				<div class="benefit_item d-flex flex-row align-items-center">
					<div class="benefit_icon">
						<i class="fa fa-truck" aria-hidden="true"></i>
					</div>
					<div class="benefit_content">
						<h6>free shipping</h6>
						<p>Suffered Alteration in Some Form</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 benefit_col">
				<div class="benefit_item d-flex flex-row align-items-center">
					<div class="benefit_icon">
						<i class="fa fa-money" aria-hidden="true"></i>
					</div>
					<div class="benefit_content">
						<h6>cach on delivery</h6>
						<p>The Internet Tend To Repeat</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 benefit_col">
				<div class="benefit_item d-flex flex-row align-items-center">
					<div class="benefit_icon">
						<i class="fa fa-undo" aria-hidden="true"></i>
					</div>
					<div class="benefit_content">
						<h6>45 days return</h6>
						<p>Making it Look Like Readable</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 benefit_col">
				<div class="benefit_item d-flex flex-row align-items-center">
					<div class="benefit_icon">
						<i class="fa fa-clock-o" aria-hidden="true"></i>
					</div>
					<div class="benefit_content">
						<h6>opening all week</h6>
						<p>8AM - 09PM</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Newsletter -->

<div class="newsletter">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div
					class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
					<h4>Newsletter</h4>
					<p>Subscribe to our newsletter and get 20% off your first
						purchase</p>
				</div>
			</div>
			<div class="col-lg-6">
				<div
					class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
					<input id="newsletter_email" type="email" placeholder="Your email"
						required="required" data-error="Valid email is required.">
					<button id="newsletter_submit" type="submit"
						class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
				</div>
			</div>
		</div>
	</div>
</div>




































































