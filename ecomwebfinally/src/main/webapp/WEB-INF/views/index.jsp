<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>





<!-- Slider -->

<div class="main_slider"
	style="background-image: url(images/slider_1.jpg)">
	<div class="container fill_height">
		<div class="row align-items-center fill_height">
			<div class="col">
				<div class="main_slider_content">
					<h6>Shopping / Winter Collection 2022</h6>
					<h1>Get up to 30% Off New Products</h1>
					<div class="red_button shop_now_button">
						<a href="/product/user">shop now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Banner -->

<div class="banner">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="banner_item align-items-center"
					style="background-image: url(images/skincare.jpg)">
					<div class="banner_category">
						<a href="/product/user">skincare</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="banner_item align-items-center"
					style="background-image: url(images/makeup.jpg)">
					<div class="banner_category">
						<a href="/product/user">makeup</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="banner_item align-items-center"
					style="background-image: url(images/Accessory.jpg)">
					<div class="banner_category">
						<a href="/product/user">accessory</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- New Arrivals -->

<div class="new_arrivals">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<div class="section_title new_arrivals_title">
					<h2>New Arrivals</h2>
				</div>
			</div>
		</div>
		<div class="row align-items-center">
			<div class="col text-center">
				<div class="new_arrivals_sorting">
					<ul
						class="arrivals_grid_sorting clearfix button-group filters-button-group">
						<li
							class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked"
							data-filter="*">all</li>
						<li
							class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
							data-filter=".women">skincare</li>
						<li
							class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
							data-filter=".accessories">makeup</li>
						<li
							class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
							data-filter=".men">accessory</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="product-grid"
					data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
					<!-- Product Grid 1 -->
					<c:forEach items="${product}" var="product">
						<div class="product-item men">
							<div class="product discount product_filter">
								<div class="product_image">
									<c:url value="/images/${product.listimage}" var="imgUrl"></c:url>
									<img src="${imgUrl}" alt="">
								</div>
								<div class="favorite favorite_left"></div>
								<c:if test="${product.price - product.promotionaprice > 0}">
									<div
										class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
										<span>-$${product.price-product.promotionaprice}</span>
									</div>
								</c:if>
								<div class="product_info">
									<h6 class="product_name">
										<a href="/product/user/list/${product.id}">${product.name}</a>
									</h6>
									<div class="product_price">
										$${product.promotionaprice}<span>$${product.price}</span>
									</div>
								</div>
							</div>
							<div class="red_button add_to_cart_button">
								<a href="#">add to cart</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Deal of the week -->

<div class="deal_ofthe_week">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-6">
				<div class="deal_ofthe_week_img">
					<img src="images/deal_ofthe_week.png" alt="">
				</div>
			</div>
			<div class="col-lg-6 text-right deal_ofthe_week_col">
				<div
					class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
					<div class="section_title">
						<h2>Deal Of The Week</h2>
					</div>
					<ul class="timer">
						<li
							class="d-inline-flex flex-column justify-content-center align-items-center">
							<div id="day" class="timer_num">03</div>
							<div class="timer_unit">Day</div>
						</li>
						<li
							class="d-inline-flex flex-column justify-content-center align-items-center">
							<div id="hour" class="timer_num">15</div>
							<div class="timer_unit">Hours</div>
						</li>
						<li
							class="d-inline-flex flex-column justify-content-center align-items-center">
							<div id="minute" class="timer_num">45</div>
							<div class="timer_unit">Mins</div>
						</li>
						<li
							class="d-inline-flex flex-column justify-content-center align-items-center">
							<div id="second" class="timer_num">23</div>
							<div class="timer_unit">Sec</div>
						</li>
					</ul>
					<div class="red_button deal_ofthe_week_button">
						<a href="/product/user">shop now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Best Sellers -->

<div class="best_sellers">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<div class="section_title new_arrivals_title">
					<h2>Best Sellers</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="product_slider_container">
					<div class="owl-carousel owl-theme product_slider">

						<c:forEach items="${product}" var="product">
							<!-- Slide n -->

							<div class="owl-item product_slider_item">
								<div class="product-item">
									<div class="product discount">
										<div class="product_image">
											<c:url value="/images/${product.listimage}" var="imgUrl"></c:url>
											<img src="${imgUrl}" alt="">
										</div>
										<div class="favorite favorite_left"></div>
										<c:if test="${product.price - product.promotionaprice > 0}">
											<div
												class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
												<span>-$${product.price-product.promotionaprice}</span>
											</div>
										</c:if>
										<div class="product_info">
											<h6 class="product_name">
												<a href="/product/user/list/${product.id}">${product.name}</a>
											</h6>
											<div class="product_price">
												$${product.promotionaprice}<span>$${product.price}</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

						<!-- Slide 1 -->

						<div class="owl-item product_slider_item">
							<div class="product-item">
								<div class="product discount">
									<div class="product_image">
										<img src="images/product_1.png" alt="">
									</div>
									<div class="favorite favorite_left"></div>
									<div
										class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
										<span>-$20</span>
									</div>
									<div class="product_info">
										<h6 class="product_name">
											<a href="single.html">Fujifilm X100T 16 MP Digital Camera
												(Silver)</a>
										</h6>
										<div class="product_price">
											$520.00<span>$590.00</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Slide 2 -->

						<div class="owl-item product_slider_item">
							<div class="product-item women">
								<div class="product">
									<div class="product_image">
										<img src="images/product_2.png" alt="">
									</div>
									<div class="favorite"></div>
									<div
										class="product_bubble product_bubble_left product_bubble_green d-flex flex-column align-items-center">
										<span>new</span>
									</div>
									<div class="product_info">
										<h6 class="product_name">
											<a href="single.html">Samsung CF591 Series Curved 27-Inch
												FHD Monitor</a>
										</h6>
										<div class="product_price">$610.00</div>
									</div>
								</div>
							</div>
						</div>


						<!-- Slide 9 -->

						<div class="owl-item product_slider_item">
							<div class="product-item men">
								<div class="product">
									<div class="product_image">
										<img src="images/product_9.png" alt="">
									</div>
									<div
										class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
										<span>sale</span>
									</div>
									<div class="favorite favorite_left"></div>
									<div class="product_info">
										<h6 class="product_name">
											<a href="single.html">DYMO LabelWriter 450 Turbo Thermal
												Label Printer</a>
										</h6>
										<div class="product_price">$410.00</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Slide 10 -->

						<div class="owl-item product_slider_item">
							<div class="product-item men">
								<div class="product">
									<div class="product_image">
										<img src="images/product_10.png" alt="">
									</div>
									<div class="favorite"></div>
									<div class="product_info">
										<h6 class="product_name">
											<a href="single.html">Pryma Headphones, Rose Gold & Grey</a>
										</h6>
										<div class="product_price">$180.00</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Slider Navigation -->

					<div
						class="product_slider_nav_left product_slider_nav d-flex align-items-center justify-content-center flex-column">
						<i class="fa fa-chevron-left" aria-hidden="true"></i>
					</div>
					<div
						class="product_slider_nav_right product_slider_nav d-flex align-items-center justify-content-center flex-column">
						<i class="fa fa-chevron-right" aria-hidden="true"></i>
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

<!-- Blogs -->

<div class="blogs">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<div class="section_title">
					<h2>Latest Blogs</h2>
				</div>
			</div>
		</div>
		<div class="row blogs_container">
			<div class="col-lg-4 blog_item_col">
				<div class="blog_item">
					<div class="blog_background"
						style="background-image: url(images/blog_1.jpg)"></div>
					<div
						class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
						<h4 class="blog_title">Here are the trends I see coming this
							fall</h4>
						<span class="blog_meta">by admin | dec 01, 2017</span> <a
							class="blog_more" href="#">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 blog_item_col">
				<div class="blog_item">
					<div class="blog_background"
						style="background-image: url(images/blog_2.jpg)"></div>
					<div
						class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
						<h4 class="blog_title">Here are the trends I see coming this
							fall</h4>
						<span class="blog_meta">by admin | dec 01, 2017</span> <a
							class="blog_more" href="#">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 blog_item_col">
				<div class="blog_item">
					<div class="blog_background"
						style="background-image: url(images/blog_3.jpg)"></div>
					<div
						class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
						<h4 class="blog_title">Here are the trends I see coming this
							fall</h4>
						<span class="blog_meta">by admin | dec 01, 2017</span> <a
							class="blog_more" href="#">Read more</a>
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

<script src="${URL}js/jquery-3.2.1.min.js"></script>
<script src="${URL}styles/bootstrap4/popper.js"></script>
<script src="${URL}styles/bootstrap4/bootstrap.min.js"></script>
<script src="${URL}plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${URL}plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${URL}plugins/easing/easing.js"></script>
<script src="${URL}js/custom.js"></script>