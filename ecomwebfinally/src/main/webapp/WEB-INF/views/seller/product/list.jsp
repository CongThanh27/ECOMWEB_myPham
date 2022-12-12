<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/resources/fe/" var="URL"></c:url>
<a href="sellerRegister">Dang ky tro thanh nguoi ban</a>
<c:if test="${user.isSeller == false}">

</c:if>


<c:if test="${user.isSeller == true}">
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/" class="brand-link">
      <%-- <img src="${URL}dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> --%>
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <%-- <div class="image">
          <img src="${URL}dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div> --%>
        <div class="info">
          <a href="/seller" class="d-block">Alexander Pierce</a>
          <a>${user.id } Id</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="/seller" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
            
          </li>
          <li class="nav-item menu-open">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Quản lý vận chuyển
                
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="./index.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v1</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./index2.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./index3.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v3</p>
                </a>
              </li>
            </ul>
          </li><li class="nav-item menu-open">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Quản lý đơn hàng
                
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="./index.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v1</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./index2.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="./index3.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v3</p>
                </a>
              </li>
            </ul>
          </li>
            <li class="nav-item menu-open">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Quản lý sản phẩm
                
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/seller/product" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Quản lý sản phẩm</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/seller/addProduct" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Thêm sản phẩm</p>
                </a>
              </li>
              
                  
            </ul>
          </li>
         </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Thông tin của hàng</a></li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container product_section_container">
	<div class="row">
		<div class="col product_section clearfix">

			<!-- Breadcrumbs -->

			<div class="breadcrumbs d-flex flex-row align-items-center">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li class="active"><a href="/product/user"><i
							class="fa fa-angle-right" aria-hidden="true"></i>Product</a></li>
				</ul>
			</div>

			<!-- Sidebar -->

			<div class="sidebar">
				<div class="sidebar_section">
					<div class="sidebar_title">
						<h5>Product Category</h5>
					</div>
					<ul class="sidebar_categories">
					<c:forEach items="${category}" var="category">
						<li><a href="/product/search/${category.id}">${category.name}</a></li>
					</c:forEach>
						
					<!-- 	<li class="active"><a href="#"><span><i
									class="fa fa-angle-double-right" aria-hidden="true">
						</i></span>Chăm sóc da mặt</a></li>
						<li><a href="#">Tắm & chăm sóc cơ thể</a></li>
						<li><a href="#">Trang điểm</a></li>
						<li><a href="#">Chăm sóc tóc</a></li>
						<li><a href="#">Chăm sóc nam giới</a></li> -->
						<li><a href="#">Khác</a></li>
						<li><a href="#"></a></li>
					</ul>
					<div class="show_more">
						<span><span>+</span>Show More</span>
					</div>
				</div>

				<!-- Price Range Filtering -->
				<div class="sidebar_section">
					<div class="sidebar_title">
						<h5>Giá</h5>
					</div>
					<p>
						<input type="text" id="amount" name="rank" readonly
							style="border: 0; color: #f6931f; font-weight: bold;">
					</p>
					<div id="slider-range"></div>
					<div class="filter_button">
						<span>filter</span>
					</div>
				</div>

				<!-- Sizes -->
				<div class="sidebar_section">
					<div class="sidebar_title">
						<h5>Thương hiệu</h5>
					</div>
					<ul class="checkboxes">
					<c:forEach items="${product}" var="product">
						<li><a href="/product/SearchTrademark/${product.trademark}">${product.trademark}</a></li>
					</c:forEach>
						<!-- 
						<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Cocoon</span></li>
						<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Merzy</span></li>
						<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Senka</span></li>
						<li><i class="fa fa-square-o" aria-hidden="true"></i><span>The Ordinary</span></li>
						<li><i class="fa fa-square-o" aria-hidden="true"></i><span>L'Oreal Paris</span></li>
						<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Gamma</span></li>
						<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Diana</span></li>
						<li><i class="fa fa-square-o" aria-hidden="true"></i><span>BioAQUA</span></li>
						<li><i class="fa fa-square-o" aria-hidden="true"></i><span>FOCALLURE</span></li> -->
						<li><a href="/product/user">Khác</a></li>
					</ul>	
					<div class="show_more">
						<span><span>+</span>Show More</span>
					</div>
				</div>

				<!-- Color -->
				<div class="sidebar_section">
					<div class="sidebar_title">
						<h5>Đánh giá</h5>
					</div>
					<ul>
						<li>
						<a href="#"> 
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						</a>
						</li>
												<li>
						<a href="#"> 
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						</a>
						</li>
												<li>
						<a href="#"> 
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						</a>
						</li>
												<li>
						<a href="#"> 
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						</a>
						</li>
												<li>
						<a href="#"> 
						<i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						<i class="fa fa-star-o" aria-hidden="true"></i>
						</a>
						</li>
					</ul>	
						
				</div>

			</div>

			<!-- Main Content -->

			<div class="main_content">

				<!-- Products -->

				<div class="products_iso">
					<div class="row">
						<div class="col">

							<!-- Product Sorting -->

							<div
								class="product_sorting_container product_sorting_container_top">
								<ul class="product_sorting">
									<li><span class="type_sorting_text">Default Sorting</span>
										<i class="fa fa-angle-down"></i>
										<ul class="sorting_type">
											<li class="type_sorting_btn"
												data-isotope-option='{ "sortBy": "original-order" }'><span>Default
													Sorting</span></li>
											<li class="type_sorting_btn"
												data-isotope-option='{ "sortBy": "price" }'><span>Price</span></li>
											<li class="type_sorting_btn"
												data-isotope-option='{ "sortBy": "name" }'><span>Product
													Name</span></li>
										</ul></li>
									<li><span>Show</span> <span class="num_sorting_text">6</span>
										<i class="fa fa-angle-down"></i>
										<ul class="sorting_num">
											<li class="num_sorting_btn"><span>6</span></li>
											<li class="num_sorting_btn"><span>12</span></li>
											<li class="num_sorting_btn"><span>24</span></li>
										</ul></li>
								</ul>
								<div class="pages d-flex flex-row align-items-center">
									<div class="page_current">
										<span>1</span>
										<ul class="page_selection">
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
										</ul>
									</div>
									<div class="page_total">
										<span>of</span> 3
									</div>
									<div id="next_page" class="page_next">
										<a href="#"><i class="fa fa-long-arrow-right"
											aria-hidden="true"></i></a>
									</div>
								</div>

							</div>

							<!-- Product Grid -->

							<div class="product-grid" >
						
								<c:forEach items="${product}" var="product">
									
									<div class="product-item men">
										<div class="product discount product_filter">
											<div class="product_image">
												<c:url value="/images/${product.listimage}" var="imgUrl"></c:url>
												<img src="${imgUrl}" alt="">
											</div>
											<div class="favorite favorite_left"></div>
											<c:if test="${product.price - product.promotionaprice > 0}">
											<div class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">						
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
											<a href="/product/user/list/${product.id}">add to cart</a>
										</div>
									</div>
									
									
								</c:forEach>
								
							</div>

							<!-- Product Sorting -->

							<div
								class="product_sorting_container product_sorting_container_bottom clearfix">
								<ul class="product_sorting">
									<li><span>Show:</span> <span class="num_sorting_text">04</span>
										<i class="fa fa-angle-down"></i>
										<ul class="sorting_num">
											<li class="num_sorting_btn"><span>01</span></li>
											<li class="num_sorting_btn"><span>02</span></li>
											<li class="num_sorting_btn"><span>03</span></li>
											<li class="num_sorting_btn"><span>04</span></li>
										</ul></li>
								</ul>
								<span class="showing_results">Showing 1–3 of 12 results</span>
								<div class="pages d-flex flex-row align-items-center">
									<div class="page_current">
										<span>1</span>
										<ul class="page_selection">
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
										</ul>
									</div>
									<div class="page_total">
										<span>of</span> 3
									</div>
									<div id="next_page_1" class="page_next">
										<a href="#"><i class="fa fa-long-arrow-right"
											aria-hidden="true"></i></a>
									</div>
								</div>

							</div>

						</div>
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
      
    </section>
    <!-- /.content -->
  </div>
  </c:if>