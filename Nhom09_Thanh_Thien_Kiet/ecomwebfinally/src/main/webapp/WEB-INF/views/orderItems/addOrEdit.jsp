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

<title>${orderitem.isEdit ? 'Edit OrderItem' : 'Add OrderItem'}</title>
</head>
<body>

	<section class="container">

		<div class="col mt-4">
			<form action=<c:url value = "/product/saveofUpdate"/>
				method="POST" enctype="multipart/form-data">
				<div class="card">
					<div class="card-header">
						<h2>${orderitem.isEdit ? 'Edit' : 'Add'}</h2>
					</div>

				</div>
				<div class="card-body">

					<div class="mb-3">
						<label for="id" class="form-lablel">ID:</label> 
							<input
							type="text" class="form-control" 
							name="id" value="${orderitem.id}" id="id"
							aria-describedby="id" />
							<!-- readonly="readonly" : chỉ cho phép đọc-->
					</div>

					<div class="mb-3">
						<label for="name" class="form-lablel">
							Order ID:</label> <br> <input type="text" value="${orderitem.orderid}"
							 name="name" >
					</div>
						<div class="mb-3">
						<label for="desciption" class="form-lablel">
							Product ID:</label> <br> <input type="text" value="${orderitem.productid}"
							 name="desciption" >
					</div>
						<div class="mb-3">
						<label for="price" class="form-lablel">
							Count:</label> <br> <input type="text" value="${orderitem.count}"
							 name="price" >
					</div>
						<div class="mb-3">
						<label for="createat" class="form-lablel">
							createat:</label> <br> <input type="date" value="${orderitem.createat}"
							 name="createat" >
					</div>
					</div>
						<div class="mb-3">
						<label for="updateat" class="form-lablel">
							updateat:</label> <br> <input type="date" value="${orderitem.updateat}"
							 name="updateat" >
					</div>

				<div class="card-footer text-muted">
					<a href=<c:url value="/user/orderItems/add"/>
						class="btn btn-secondary"><i class="fas fa-new"></i>New</a> <a
						href=<c:url value="/user/orderItems"/> class="btn btn-success"><i
						class="fas bars"></i>Quay lại</a>
					<button class="btn btn-primary" type="submit">
						<i class="fas fa-save"></i>
						<!-- true là cập nhật -->
						<c:if test="${orderitem.isEdit }">
							<span>Update</span>
						</c:if>
						
						<c:if test="${!orderitem.isEdit }">
							<span>Save</span>
						</c:if>

					</button>
				</div>

			</form>

		</div>

	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>