<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Trang chủ</title>
</head>
<body>
	<section class="row">

		<div class="col mt-4">
			<div class="card-header py-3"></div>

			<form action=<c:url value="/user/reviews/saveOrUpdate" />
				method="POST" enctype="multipart/form-data">
				<div class="card-body mx-auto">
					<div class="mb-3">

						<div class="mb-3">
							<label for="id" class="form-lablel">Review ID :</label> <input
								type="text" class="form-control" readonly="readonly" name="id"
								value="${review.id}" id="id" aria-describedby="id"
								placeholder="Review Id" />
						</div>

						<div class="mb-3">
							<label for="content" class="form-lablel">Mã user :</label> <input
								type="text" value="${review.userid}" id="content"
								name="userid">
						</div>

						<div class="mb-3">
							<label for="content" class="form-lablel">Mã sản phẩm :</label> <input
								type="text" value="${review.productid}" id="content"
								name="productid">
						</div>
					
						
						<div class="mb-3">
							<label for="content" class="form-lablel">Content :</label> <input
								type="text" value="${review.content}" id="content"
								name="content">
						</div>

						<div class="mb-3">
							<label for="rating" class="form-lablel">Rating :</label> <input
								type="text" value="${review.rating}" id="rating" name="rating">
						</div>

					
						<button type="submit" class="btn btn-primary">Update</button>
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