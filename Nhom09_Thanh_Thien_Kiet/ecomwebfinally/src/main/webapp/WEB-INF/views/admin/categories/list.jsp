<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>Hello, world!</title>
</head>
<body>

	<section class="row">

		<div class="col mt-4">

			<div class="card">

				<div class="card-header">List Category</div>

				<div class="card-body">

					<!-- Hiển thông báo -->

					<c:if test="${message != null}">

						<div class="alert alert-primary" role="alert">

							<i>${message}</i>

						</div>

					</c:if>

					<!-- Hêt thông báo -->

					<!-- Search -->
					<div class="row mt-2 mb-2">
						<div class="col-md-6">
							<form action="/admin/categories/searchpagenated">
								<div class="input-group">
									<input type="text" class="form-control ml-2" name="name1"
										id="name1" placeholder="Nhap tu khoa tim kiem">
									<button class="btn btn-outline-primary ml-2">Search</button>
								</div>
							</form>
						</div>

						<div class="col-md-6">
							<div class="float-right">
								<a class="btn btn-outline-success" href="/admin/categories/add">Add
									New Category</a>
							</div>
						</div>

					</div>
					<c:if test="${!categoryPage.hasContent()}">


						<div class="row">
							<div class="col">
								<div class="arlet arlet-danger">Not Find Category</div>

							</div>

						</div>
					</c:if>


					<c:if test="${categoryPage.hasContent()}">
						<!-- List -->

						<table class="table table-striped table-responsive">

							<thead class="thead-inverse">

								<tr>
									<th>Ảnh</th>
									<th>Mã Loại Sản Phẩm</th>
									<th>Loại Sản Phẩm</th>
									<th>Ngày Tạo</th>
									<th>Trạng Thái</th>
									<th>Action</th>
								</tr>

							</thead>

							<tbody>

								<c:forEach items="${categoryPage.content}" var="category">

									<tr>

										<td scope="row">${category.image}</td>
										<td>${category.id}</td>
										<td>${category.name}</td>
										<td>${category.createat}</td>
										<td>${category.isdeleted ? 'Actived' : 'Deleted'}</td>

										<td><a href="/admin/categories/view/${category.id}"
											class="btn btn-outline-info"><i class="fa fa-info"></i></a> <a
											href="/admin/categories/edit/${category.id}"
											class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>

											<a href="/admin/categories/delete/${category.id}"
											class="btn btn-outline-danger"><i class="fa fa-trash"></i></a></td>

									</tr>

								</c:forEach>

							</tbody>



						</table>

					</c:if>


					<!-- Phan trang Pageable-->


					<!-- end of pageable -->

					<!-- Phân trang  -->
					<c:if test="${categoryPage.totalPages > 0}">

						<nav aria-label="Page navigation">
							<ul class="pagination">
								<li
									class="${1==categoryPage.number + 1  ? 'page-item active' : 'page-item' }">
									<a class="page-link"
									href="<c:url value='/admin/categories/list?name=${name}&size=${categoryPage.size}&page=${pageNumber}'/>"
									tabindex="-1" aria-disabled="true">First</a>
								</li>


								<c:forEach items="${pageNumbers}" var="pageNumber">
									<c:if test="${categoryPage.totalPages >1}">
										<li
											class="${pageNumber == categoryPage.number +1 ? 'page-item active' : 'page-item'}">
											<a class="page-link"
											href="<c:url value='/admin/categories/list?name=${name}&size=${categoryPage.size}&page=${pageNumber}'/>">${pageNumber}</a>
										</li>
									</c:if>
								</c:forEach>



								<li
									class="${categoryPage.totalPages == categoryPage.number + 1 ? 'page-item active' : 'page-item'}">
									<a class="page-link"
									href="<c:url value='/admin/categories/list?name=${name}&size=${categoryPage.size}&page=${categoryPage.totalPages}'/>">Last</a>
								</li>

							</ul>
						</nav>
					</c:if>

				</div>

			</div>

		</div>

	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>