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
      <span class="brand-text font-weight-light">T2KShop</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar" style="width: 250px;">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <%-- <div class="image">
          <img src="${URL}dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div> --%>
        <div class="info">
          <a href="/seller" class="d-block">Nhóm 9</a>
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
            <a href="/seller" class="nav-link ">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
            
          </li>
          <li class="nav-item ">
            <a href="/seller/order" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Quản lý đơn hàng
                
              </p>
            </a>
            
          </li>
            <li class="nav-item menu-open">
            <a href="/seller/product" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Tất cả sản phẩm
                
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
                <a href="/seller/addOrEdit" class="nav-link">
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

<div class="content-wrapper" style="top: -23px">
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
								class="info-box-number"> ${choxacnhan}</span> <small>Đơn</small>

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
								<td width="233px">
										<c:if test="${order.giaohang==0}">
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
				<c:if test="${ order.giaohang == 0}"><a href="/seller/delete/${order.id }"><span class="badge bg-danger">Xóa đơn hàng</span></a></c:if>
				<c:if test="${ order.giaohang == 1}"><a href="/seller/process/${order.id }"><span class="badge bg-danger">Xác nhận</span></a></c:if>
				<c:if test="${ order.giaohang == 2}"><a href="/seller/ship/${order.id }"><span class="badge bg-danger">Giao hàng</span></a></c:if>
			</c:forEach>
		</div>
		<!-- /.card-body -->

	</div>
</div>


<!-- Newsletter -->


    <!-- /.content -->
  </div>
  </c:if>