<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/images/${product.listimage}" var="imgUrl"></c:url>
<c:url value="/images/${product.listimage1}" var="imgUrl1"></c:url>
<c:url value="/images/${product.listimage2}" var="imgUrl2"></c:url>

<div class="container single_product_container">
	<div class="row">
		<div class="col">

			<!-- Breadcrumbs -->

			<div class="breadcrumbs d-flex flex-row align-items-center">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="/product/user"><i class="fa fa-angle-right"
							aria-hidden="true"></i>Product</a></li>
					<li class="active"><a href="/product/user/list/${product.id}"><i
							class="fa fa-angle-right" aria-hidden="true"> ${product.name}</i></a></li>
				</ul>
			</div>

		</div>
	</div>

	<div class="row">
		<div class="col-lg-7">
			<div class="single_product_pics">
				<div class="row">
					<div class="col-lg-3 thumbnails_col order-lg-1 order-2">
						<div class="single_product_thumbnails">
							<ul>
								<li><img src="${imgUrl}" alt="" data-image="${imgUrl}"></li>
								<li class="active"><img src="${imgUrl1}" alt=""
									data-image="${imgUrl1}"></li>
								<li><img src="${imgUrl2}" alt="" data-image="${imgUrl2}"></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-9 image_col order-lg-2 order-1">
						<div class="single_product_image">
							<div class="single_product_image_background"
								style="background-image:url(${imgUrl})"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-5">
			<div class="product_details">
				<div class="product_details_title">
					<h2>${product.name}</h2>

				</div>
				<div
					class="free_delivery d-flex flex-row align-items-center justify-content-center">
					<span class="ti-truck"></span><span>free delivery</span>
				</div>
				<div class="original_price">$${product.price}</div>
				<div class="product_price">$${product.promotionaprice}</div>
				<ul class="star_rating">
					<c:forEach var="i" begin="1" end="${product.rating}">
						<li><i class="fa fa-star" aria-hidden="true"></i></li>
					</c:forEach>
					<c:forEach var="i" begin="1" end="${5-product.rating}">
						<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
					</c:forEach>
				</ul>

				<!-- 					<div class="product_color">
						<span>Select Color:</span>
						<ul>
							<li style="background: #e54e5d"></li>
							<li style="background: #252525"></li>
							<li style="background: #60b3f3"></li>
						</ul>
					</div> -->
				<div
					class="quantity d-flex flex-column flex-sm-row align-items-sm-center">
					<span>Quantity:</span>
					<div class="quantity_selector">
						<span class="minus"><i class="fa fa-minus"
							aria-hidden="true"></i></span>
						<!-- <input type="text" name="listImage" value="1"  id="quantity_value" /> -->
						<span id="quantity_value">1</span> <span class="plus"><i
							class="fa fa-plus" aria-hidden="true"></i></span>
					</div>
					<c:if test="${user == null}">
						<form id="review_form" action=<c:url value = "/login"/>
							method="POST" enctype="multipart/form-data">
							<input hidden="hidden" type="text" name="count" value="1"
								id="soluong" /> <input hidden="hidden" type="text"
								name="storeid" value="${Storeid}" /> <input hidden="hidden"
								type="text" name="userid" value="1" /> <input hidden="hidden"
								type="text" name="productid" value="${product.id}" />

							<button type="submit" class="red_button add_to_cart_button">add
								to cart</button>
						</form>
					</c:if>
					<c:if test="${user != null}">
						<form id="review_form" action=<c:url value = "/product/AddCart"/>
							method="POST" enctype="multipart/form-data">
							<input hidden="hidden" type="text" name="count" value="1"
								id="soluong" /> <input hidden="hidden" type="text"
								name="storeid" value="${Storeid}" /> <input hidden="hidden"
								type="text" name="userid" value="1" /> <input hidden="hidden"
								type="text" name="productid" value="${product.id}" />

							<button type="submit" class="red_button add_to_cart_button">add
								to cart</button>
						</form>
					</c:if>
					<div
						class="product_favorite d-flex flex-column align-items-center justify-content-center"></div>

				</div>
			</div>
		</div>
	</div>

</div>

<!-- Tabs -->

<div class="tabs_section_container">

	<div class="container">
		<div class="row">
			<div class="col">
				<div class="tabs_container">
					<ul
						class="tabs d-flex flex-sm-row flex-column align-items-left align-items-md-center justify-content-center">
						<li class="tab active" data-active-tab="tab_1"><span>Description</span></li>
						<li class="tab" data-active-tab="tab_2"><span>Additional
								Information</span></li>
						<li class="tab" data-active-tab="tab_3"><span>Reviews
								( ${slreview} )</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">

				<!-- Tab Description -->

				<div id="tab_1" class="tab_container active">
					<div class="row">
						<div class="col-lg-5 desc_col">
							<div class="tab_title">
								<h4>Description</h4>
							</div>
							<div class="tab_text_block">
								<h2>${product.name}</h2>
								<p>${product.desciption}</p>
							</div>
							<div class="tab_image">
								<img src="${imgUrl}" alt="">
							</div>
							<div class="tab_text_block">
								<h2>${product.name}</h2>
								<p>${product.desciption1}</p>
							</div>
						</div>
						<div class="col-lg-5 offset-lg-2 desc_col">
							<div class="tab_image">
								<img src="${imgUrl1}" alt="">
							</div>
							<div class="tab_text_block">
								<h2>${product.name}</h2>
								<p>${product.desciption2}</p>
							</div>
							<div class="tab_image desc_last">
								<img src="${imgUrl2}" alt="">
							</div>
						</div>
					</div>
				</div>

				<!-- Tab Additional Info -->

				<div id="tab_2" class="tab_container">
					<div class="row">
						<div class="col additional_info_col">
							<div class="tab_title additional_info_title">
								<h4>Additional Information</h4>
							</div>
							<p>
								COLOR:<span>Trong suốt</span>
							</p>
							<p>
								Dung tích<span>150ml</span>
							</p>
						</div>
					</div>
				</div>

				<!-- Tab Reviews -->

				<div id="tab_3" class="tab_container">
					<div class="row">

						<!-- User Reviews -->

						<div class="col-lg-6 reviews_col">
							<div class="tab_title reviews_title">
								<h4>Reviews ( ${slreview} )</h4>
							</div>

							<!-- User Review -->
							<c:forEach items="${review}" var="review">
								<c:url value="/images/user/${review.imgages}" var="imgUser"></c:url>
								<div
									class="user_review_container d-flex flex-column flex-sm-row">
									<div class="user">
										<div class="user_pic">
											<img width="70px" height="70px" style="border-radius: 50%;"
												src="${imgUser}" alt="">
										</div>
										<div class="user_rating">
											<ul class="star_rating">
												<c:forEach var="i" begin="1" end="${review.rating}">
													<li><i class="fa fa-star" aria-hidden="true"></i></li>
												</c:forEach>
												<c:forEach var="i" begin="1" end="${5-review.rating}">
													<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
												</c:forEach>
											</ul>
										</div>
									</div>
									<div class="review">
										<div class="review_date">${review.createat}</div>
										<div class="user_name">${review.fistname}
											${review.lastname}</div>
										<p>${review.content}.</p>
									</div>
								</div>
							</c:forEach>

						</div>

						<!-- Add Review -->

						<%-- <div class="col-lg-6 add_review_col">

							<div class="add_review">

								<form id="review_form"
									action=<c:url value = "/product/saveofUpdateRating"/>
									method="POST" enctype="multipart/form-data">
									<div>
										<h1>Add Review</h1>
										<input hidden="hidden" readonly="readonly"
											value="${product.id}" type="text" name="productid"
											id="review_name" class="form_input input_name"
											required="required" data-error="Name is required."> <input
											hidden="hidden" readonly="readonly" id="review_name"
											value="1" class="form_input input_name" type="text"
											name="userid" placeholder="Xử lý hiện tên"
											required="required" data-error="Name is required.">
										<!-- <input id="review_email" class="form_input input_email" type="email" name="email" placeholder="Email*" required="required" data-error="Valid email is required."> -->
									</div>
									<div>
										<h1>Your Rating:</h1>
										<ul class="user_star_rating">
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
											<li><i class="fa fa-star" aria-hidden="true"></i></li>
											<li><i class="fa fa-star-o" aria-hidden="true"></i></li>
										</ul>

										<input hidden="hidden" type="text" class="form-control"
											readonly="readonly" name="rating" value="" id="rating" />
										<textarea id="review_message" class="input_review"
											name="content" placeholder="Your Review" rows="4" required
											data-error="Please, leave us a review."></textarea>
									</div>
									<div class="text-left text-sm-right">
										<button id="review_submit" type="submit"
											class="red_button review_submit_btn trans_300" value="Submit">submit</button>
									</div>


								</form>
							</div>

						</div>
 --%>
					</div>
				</div>

			</div>
		</div>
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
						<h6>Miễn phí vận chuyển</h6>
						<p>Trong Một Số Hình Thức</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 benefit_col">
				<div class="benefit_item d-flex flex-row align-items-center">
					<div class="benefit_icon">
						<i class="fa fa-money" aria-hidden="true"></i>
					</div>
					<div class="benefit_content">
						<h6>Thanh toán COD</h6>
						<p>Được Kiểm Tra Hàng Trước</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 benefit_col">
				<div class="benefit_item d-flex flex-row align-items-center">
					<div class="benefit_icon">
						<i class="fa fa-undo" aria-hidden="true"></i>
					</div>
					<div class="benefit_content">
						<h6>45 ngày hoàn hàng</h6>
						<p>Nếu Sản Phẩm Có Vấn Đề</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 benefit_col">
				<div class="benefit_item d-flex flex-row align-items-center">
					<div class="benefit_icon">
						<i class="fa fa-clock-o" aria-hidden="true"></i>
					</div>
					<div class="benefit_content">
						<h6>Mở của cả tuần</h6>
						<p>9h Sáng - 10h Tối</p>
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
				<form action="post">
					<div
						class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
						<input id="newsletter_email" type="email" placeholder="Your email"
							required="required" data-error="Valid email is required.">
						<button id="newsletter_submit" type="submit"
							class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
