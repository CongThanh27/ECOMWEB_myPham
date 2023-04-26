<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="super_container">

	<!-- Header -->

	<header class="header trans_300">

		<!-- Top Navigation -->

		<div class="top_nav">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="top_nav_left">Free shipping on all u.s orders
							over $50</div>
					</div>
					<div class="col-md-6 text-right">
						<div class="top_nav_right">
							<ul class="top_nav_menu">

								<!-- / My Account -->
								<!-- <li class="account"><a href="#"> My Account <i
										class="fa fa-angle-down"></i>
								</a> -->
								<c:if test="${user == null}">
									<li class="account"><a href="#" style="width: 110px">
											Guest <i class="fa fa-angle-down"></i>
									</a>
										<ul class="account_selection">
											<li><a href="/login"><i class="fa fa-sign-in"
													aria-hidden="true"></i>Đăng nhập</a></li>
											<li><a href="/register"><i class="fa fa-user-plus"
													aria-hidden="true"></i>Đăng ký</a></li>
										</ul>
								</c:if>
								<c:if test="${user != null}">
									<li class="account"><a href="#" style="width: 140px">
											My Account <i class="fa fa-angle-down"></i>
									</a>
										<ul class="account_selection">
											<li><a href="/user/profile/${user.id }"><i
													class="fa fa-sign-in" aria-hidden="true"></i>Tài khoản của
													tôi</a></li>
											<li><a href="/seller"><i class="fa fa-shopping-bag"
													aria-hidden="true"></i>Kênh bán hàng</a></li>
											<li><a href="/user/cart/Order"><i
													class="fa fa-shopping-cart" aria-hidden="true"></i>Đơn mua</a></li>
											<li><a href="/user/logout"><i
													class="fa fa-user-plus" aria-hidden="true"></i>Đăng xuất</a></li>
										</ul></li>
								</c:if>

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Main Navigation -->

		<!-- Main Navigation -->

		<div class="main_nav_container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="logo_container">
							<a href="/">t2k<span>Shop</span></a>
						</div>
						<nav class="navbar">
							<ul class="navbar_menu">
								<li><a href="/">home</a></li>
								<li><a href="/product/user">shop</a></li>
								<!-- <li><a href="/product/user">promotion</a></li> -->
								<li><a href="#">Notify</a></li>
								<li><a href="/">contact</a></li>
							</ul>
							<ul class="navbar_user">
								<li><a href="#"><i class="fa fa-search"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-user"
										aria-hidden="true"></i></a></li>
								<!--Cate -->
								<c:if test="${user == null}">
									<li class="checkout"><a href="/login"> <i
											class="fa fa-shopping-cart" aria-hidden="true"></i> <span
											id="checkout_items" class="checkout_items">0</span>
									</a></li>
								</c:if>
								<c:if test="${user != null}">
									<li class="checkout"><a href="/user/cart/List"> <i
											class="fa fa-shopping-cart" aria-hidden="true"></i> <span
											id="checkout_items" class="checkout_items">${count}</span>
									</a></li>
								</c:if>

							</ul>

							<div class="hamburger_container">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>

	</header>




	<div class="main_nav_container">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-right">
					<div class="logo_container">
						<a href="/">t2k<span>Shop</span></a>
					</div>
					<nav class="navbar">
						<ul class="navbar_menu">
							<li><a href="/">home</a></li>
							<li><a href="/product/user">shop</a></li>
							<li><a href="#">promotion</a></li>
							<li><a href="#">Notify</a></li>
							<li><a href="/">contact</a></li>
						</ul>
						<ul class="navbar_user">
							<li><a href="#"><i class="fa fa-search"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-user" aria-hidden="true"></i></a></li>
							<!--Cate -->
							<li class="checkout"><a href="#"> <i
									class="fa fa-shopping-cart" aria-hidden="true"></i> <span
									id="checkout_items" class="checkout_items">10</span>
							</a></li>
						</ul>
						<div class="hamburger_container">
							<i class="fa fa-bars" aria-hidden="true"></i>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>

	</header>