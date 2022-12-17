
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/resources/" var="URL"></c:url>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">Thông tin sản phẩm</h1>

				</div>
				<!-- /.col -->
				<div class="col-sm-6">

					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="/admin/ThongKe/1">Home</a></li>
						<li class="breadcrumb-item active">List</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<section class="content">

		<!-- Default box -->
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">Danh sách</h3>

				<div class="card-tools">
					<button type="button" class="btn btn-tool"
						data-card-widget="collapse" title="Collapse">
						<i class="fas fa-minus"></i>
					</button>
					<button type="button" class="btn btn-tool"
						data-card-widget="remove" title="Remove">
						<i class="fas fa-times"></i>
					</button>
				</div>
			</div>
			<div class="card-body p-0">
				<table class="table table-striped projects">
					<thead>
						<tr>
							<th style="width: 12%">Mã sản phẩm</th>
							<th style="width: 13%">Tên sản phẩm</th>
							<th style="width: 13%">Hình ảnh sản phẩm</th>
							<th style="width: 12%">Tên cửa hàng</th>
							<th>Giá</th>
							<th style="width: 8%"">Điểm số</th>
							<th>Số lượng bán được</th>
							<th>Chủ shop</th>
							<th>Xem sản phẩm</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${product}" var="product">
							<tr>
								<td style="text-align: center;">${product.id}</td>
								<td><a> ${product.name} </a> <br> <small> Ngày
										đăng bán: ${product.createat} </small></td>
								<td><c:url value="/images/${product.listimage}"
										var="imgUrl"></c:url>
									<ul class="list-inline">
										<li class="list-inline-item"><img alt="Avatar"
											class="table-avatar" src="${imgUrl}"></li>
									</ul></td>

								<td><a> ${product.store.name} </a></td>

								<td><span class="badge badge-success">$${product.promotionaprice}</span>
								</td>
								<td class="project_progress">

									<div class="progress progress-sm">
										<div class="progress-bar bg-green" role="progressbar"
											aria-valuenow="57" aria-valuemin="0" aria-valuemax="100"
											style="width: ${(product.rating/5)*100}%"></div>
									</div> <small> ${product.rating}/5 Sao </small>

								</td>
								<td class="project-state"><span>${product.sold}</span></td>
								<td class="project-state"><a
									href="/admin/profileuser/${product.store.user.id}">${product.store.user.firstName}
										${product.store.user.lastName}</a></td>
								<td class="project-actions text-right"><a
									class="btn btn-primary btn-sm"
									href="/product/user/list/${product.id}"> <i
										class="fas fa-folder"> </i> View
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->

	</section>
</div>