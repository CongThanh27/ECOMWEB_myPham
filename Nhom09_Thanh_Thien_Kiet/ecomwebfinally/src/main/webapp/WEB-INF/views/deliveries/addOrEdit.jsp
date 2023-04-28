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

<title>Hello, world!</title>
</head>
<body>

	<section class="row">

		<div class="col mt-4">
			<form action=<c:url value = "/admin/deliveries/saveOrUpdate"/>
				method=POST>
				<div class="card">
					<div class="card-header">
						<h2>${delivery.isEdit ? 'Edit Deliveries' : 'Add New Deliveries'}</h2>
					</div>

				</div>
				<div class="card-body">

					<div class="mb-3">
						<label for="categoryId" class="form-lablel"> ID:</label> <input
							type="hidden" value="${delivery.isEdit}"> 
							
							<input
							type="text" class="form-control" readonly="readonly" name="id"
							value="${delivery.id}" id="id" aria-describedby="id"
							placeholder=" Id" />
					</div>

					<div class="mb-3">
						<label for="categoryname" class="form-lablel"> Name:</label> <input
							type="text" value="${delivery.name}" id="name" name="name"
							aria-describedby="name" placeholder=" Name">
					</div>

					<div class="mb-3">
						<label for="categorycode" class="form-lablel">Price :</label> <input
							type="text" value="${delivery.price}" id="price" name="price">

					</div>

					<div class="mb-3">
						<label for="Satus" class="form-lablel">Status:</label> <select
							class="form-select" name="isdeleted" aria-describedby="isdeleted"
							id="isdeleted">

							<option ${delivery.isdeleted == true ? 'selected':'' }
								value="true">Active</option>
							<option ${delivery.isdeleted == false ? 'selected':'' }
								value="false">Not Active</option>
						</select>

					</div>

					<div class="card-footer text-muted">
						<a href=<c:url value="/admin/deliveries/add"/>
							class="btn btn-secondary"><i class="fas fa-new"></i>New</a> <a
							href=<c:url value="/admin/deliveries"/> class="btn btn-success"><i
							class="fas bars"></i>List Category</a>
						<button class="btn btn-primary" type="submit">
							<i class="fas fa-save"></i>
							<c:if test="${delivery.isEdit }">
								<span>Update</span>
							</c:if>

							<c:if test="${!delivery.isEdit }">
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