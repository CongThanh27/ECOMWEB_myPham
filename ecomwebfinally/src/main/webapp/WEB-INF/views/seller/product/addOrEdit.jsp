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
		<a href="/" class="brand-link"> <%-- <img src="${URL}dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> --%>
			<span class="brand-text font-weight-light">AdminLTE 3</span>
		</a>

		<!-- Sidebar -->
		<div class="sidebar" style="width: 250px;">
			<!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 input-group mb-3 d-flex">
				<%-- <div class="image">
          <img src="${URL}dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div> --%>
				<div class="info">
					<a href="/seller" class="d-block">Alexander Pierce</a> <a>${user.id }
						Id</a>
				</div>
			</div>

			<!-- SidebarSearch Form -->
			<div class="form-inline">
				<div class="input-group" data-widget="sidebar-search">
					<input class="form-control form-control-sidebar" type="search"
						placeholder="Search" aria-label="Search">
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
            <a href="/seller/order" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Quản lý đơn hàng
                
              </p>
            </a>
            
          </li>
            <li class="nav-item menu-open">
            <a href="/seller/product" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Quản lý sản phẩm
                
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/seller/product" class="nav-link ">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tất cả sản phẩm</p>
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

	<div class="content-wrapper" style="top: -20px">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<!-- <h1 class="m-0">Dashboard</h1> -->
						<h2>${product.isEdit ? 'Chỉnh sửa sản phẩm' : 'Thêm sản phẩm'}</h2>
					</div>
					<!-- /.col -->
					<!-- <div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Thông tin của
									hàng</a></li>
						</ol>
					</div> -->
					<%-- <div class="card">
					<div class="card-header">
						<h2>${product.isEdit ? 'Edit' : 'Add'}</h2>
					</div>

				</div> --%>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content" style="top: -50px; left: -10px">
			<div class="col mt-4">
				<form action="saveOrUpdate" method="POST"
					enctype="multipart/form-data">

					<div class="card-body">



						<div class="input-group mb-3">
							<label for="name" class="form-lablel"> Name: </label> <br> <input
								type="text" value="${product.name}" name="name">
						</div>
						<div class="input-group mb-3">
							<label for="desciption" class="form-lablel"> Mô tả: </label> <br>
							<input type="text" value="${product.desciption}"
								name="desciption">
						</div>
						<div class="input-group mb-3">
							<label for="desciption" class="form-lablel"> Mô tả 1: </label> <br>
							<input type="text" value="${product.desciption1}"
								name="desciption1">
						</div>
						<div class="input-group mb-3">
							<label for="desciption" class="form-lablel"> Mô tả 2: </label> <br>
							<input type="text" value="${product.desciption2}"
								name="desciption2">
						</div>
						<div class="input-group mb-3">
							<label for="trademark" class="form-lablel"> Thương hiệu: </label>
							<br> <input type="text" value="${product.trademark}"
								name="trademark">
						</div>
						<div class="input-group mb-3">
							<label for="price" class="form-lablel"> Price: </label> <br>
							<input type="text" value="${product.price}" name="price">
						</div>
						<div class="input-group mb-3">
							<label for="promotionaprice" class="form-lablel">
								Promotionaprice: </label> <br> <input type="text"
								value="${product.promotionaprice}" name="promotionaprice">
						</div>
						<div class="input-group mb-3">
							<label for="quantity" class="form-lablel">Quantity: </label> <br>
							<input type="text" value="${product.quantity}" name="quantity">
						</div>

						<div class="input-group mb-3">
							<input type="text" name="listImage" value="${product.listimage}"
								hidden="hidden" /> <input type="file" name="listImageFile"
								value="${product.listimage}" />
						</div>
						<div class="input-group mb-3">
							<input type="text" name="listImage1"
								value="${product.listimage1}" hidden="hidden" /> <input
								type="file" name="listImageFile1" value="${product.listimage1}" />
						</div>
						<div class="input-group mb-3">
							<input type="text" name="listImage2"
								value="${product.listimage2}" hidden="hidden" /> <input
								type="file" name="listImageFile2" value="${product.listimage2}" />
						</div>

						<div class="input-group mb-3">
							<label for="categoryid" class="form-lablel">Categoryid: </label>
							<br> <input type="number" value="${product.categoryid}"
								name="categoryid"> 
								
								

						</div>
						<div class="input-group mb-3">
							<label for="storeid" class="form-lablel"> Storeid:</label> <br>
							<input type="text" value="${product.storeid}" name="storeid">
						</div>
						<%-- <div class="input-group mb-3">
							<label for="rating" class="form-lablel"> Rating:</label> <br>
							<input type="text" value="${product.rating}" name="rating">
							</div> --%>
							
							<input type="hidden" value="${product.rating}" name="rating">


							<div class="card-footer text-muted">
								<a href="/seller/addOrEdit" class="btn btn-secondary"><i
									class="fas fa-new"></i>New</a> <a href="/seller/product"
									class="btn btn-success"><i class="fas bars"></i>Quay lại</a>
								<button class="btn btn-primary" type="submit">
									<i class="fas fa-save"></i>
									<!-- true là cập nhật -->
									<c:if test="${product.isEdit }">
										<span>Update</span>
									</c:if>

									<c:if test="${!product.isEdit }">
										<span>Save</span>
									</c:if>

								</button>
							</div>
				</form>

			</div>



		</section>
		<!-- /.content -->
	</div>
</c:if>