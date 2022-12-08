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

				<div class="card-header">List Store</div>

				<div class="card-body">

					<!-- Hiển thông báo -->

					<c:if test="${message != null}">

						<div class="alert alert-primary" role="alert">

							<i>${message}</i>

						</div>

					</c:if>

					<!-- Hêt thông báo -->

					<table class="table table-striped table-responsive">

						<thead class="thead-inverse">

							<tr>
								<th>Store name</th>
								<th>Ảnh đại diện</th>
								<th>Anh bia</th>
								<th>Store bio</th>
								<th>Status</th>
								<th>Action</th>
							</tr>

						</thead>

						<tbody>

							<c:forEach var="store" items="${stores}">

								<tr>
									<td>${store.name}</td>
									<td><c:url value="/images/user/${store.avatar}"
											var="imgUrl"></c:url> <img width="100px" height="100px"
										src="${imgUrl}"></td>
									<td><c:url value="/images/user/${store.featuredimages}"
											var="imgUrl"></c:url> <img width="100px" height="100px"
										src="${imgUrl}"></td>
									<td>${store.bio}</td>
									<td>${store.isactive ? 'Còn' : 'Hết'}</td>

									<td><a href="/admin/store/edit/${store.id}"
										class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>

										<a href="/admin/store/delete/${store.id}"
										class="btn btn-outline-danger"><i class="fa fa-trash"></i></a></td>

								</tr>

							</c:forEach>

						</tbody>

					</table>

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