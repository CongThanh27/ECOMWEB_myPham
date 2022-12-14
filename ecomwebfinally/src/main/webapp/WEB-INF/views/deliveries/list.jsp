<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="container product_section_container">
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<h5 class="mb-2">Trạng thái</h5>
			<div class="row">
				<div class="col-12 col-sm-6 col-md-3">
					<div class="info-box">
						<span class="info-box-icon bg-warning elevation-1"><i
							class="far fa-envelope"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Chờ xác nhận</span> <span
								class="info-box-number"> ${chosatnhan}</span> <small>Đơn</small>

						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-12 col-sm-6 col-md-3">
					<div class="info-box mb-3">
						<span class="info-box-icon bg-danger elevation-1"><i
							class="fas fa-cog"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Đã hủy</span> <span
								class="info-box-number">${dahuy}</span>

						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->

				<!-- fix for small devices only -->
				<div class="clearfix hidden-md-up"></div>

				<div class="col-12 col-sm-6 col-md-3">
					<div class="info-box mb-3">
						<span class="info-box-icon bg-primary elevation-1"><i
							class="fas fa-shopping-cart"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Đang giao</span> <span
								class="info-box-number">${danggiaohang}</span>

						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-12 col-sm-6 col-md-3">
					<div class="info-box mb-3">
						<span class="info-box-icon bg-success elevation-1"><i
							class="fas fa-users"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Đã nhận</span> <span
								class="info-box-number">${danhanhang}</span>

						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
			</div>
		</div>
	</section>
	<div class="card">
		<div class="card-header">
			<h3 class="card-title">Danh sách đơn hàng</h3>
		</div>
		<!-- /.card-header -->
		<div class="card-body">
			<c:forEach items="${order}" var="order">
				<br>
				<br>
				<span class="info-box-number">${order.createat}</span>

				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="width: 10px">IMG</th>
							<th>Tên sản phẩm</th>
							<th>Tiến trình giao hàng</th>
							<th style="width: 40px">Giá</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${order.orderitems}" var="orderitem">
							<tr>
								<td width="105px"><c:url
										value="/images/${orderitem.product.listimage}" var="imgUrl"></c:url>
									<img width="100px" height="100px" src="${imgUrl}" alt="">
								</td>
								<td width="639px"><a
									href="/product/user/list/${orderitem.product.id}">${orderitem.product.name}</a></td>
								<td width="233px"><c:if test="${order.giaohang==0}">
										<div class="progress progress-xs">
											<div class="progress-bar bg-danger" style="width: 20%"></div>
										</div>
									</c:if> <c:if test="${order.giaohang==1}">
										<div class="progress progress-xs">
											<div class="progress-bar bg-warning" style="width: 40%"></div>
										</div>
									</c:if> <c:if test="${order.giaohang==2}">
										<div class="progress progress-xs">
											<div class="progress-bar bg-primary" style="width: 60%"></div>
										</div>
									</c:if> <c:if test="${order.giaohang==3}">
										<div class="progress progress-xs">
											<div class="progress-bar bg-primary" style="width: 80%"></div>
										</div>
									</c:if> <c:if test="${order.giaohang==4}">
										<div class="progress progress-xs">
											<div class="progress-bar bg-success" style="width: 100%"></div>
										</div>
									</c:if></td>
								<td width="44px"><span class="badge bg-info">$${orderitem.count*orderitem.product.promotionaprice}</span>
								</td>

							</tr>

							<br>
						</c:forEach>

					</tbody>
				</table>
				<span class="badge bg-danger"> Tổng:$${order.price}</span>
				<c:if test="${ order.giaohang == 1}"><a href="/user/cart/process/${order.id }"><span class="badge bg-danger">Hủy đơn</span></a></c:if>
			<c:if test="${ order.giaohang == 3}"><a href="/user/cart/process/${order.id }"><span class="badge bg-success">Đã nhận</span></a></c:if>
	
			</c:forEach>
		</div>
		<!-- /.card-body -->

	</div>
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


