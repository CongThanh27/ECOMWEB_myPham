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

	<section class="container">

		<div class="col mt-4">
			<form action=<c:url value = "/product/saveofUpdate"/>
				method="POST" enctype="multipart/form-data">
				<div class="card">
					<div class="card-header">
						<h2>${product.isEdit ? 'Edit' : 'Add'}</h2>
					</div>

				</div>
				<div class="card-body">

					<div class="mb-3">
						<label for="id" class="form-lablel">ID:</label> 
						


							<input
							type="text" class="form-control" 
							name="id" value="${product.id}" id="id"
							aria-describedby="id" />
							<!-- readonly="readonly" : chỉ cho phép đọc-->
					</div>

					<div class="mb-3">
						<label for="name" class="form-lablel">
							Name:</label> <br> <input type="text" value="${product.name}"
							 name="name" >
					</div>
						<div class="mb-3">
						<label for="desciption" class="form-lablel">
							Mô tả:</label> <br> <input type="text" value="${product.desciption}"
							 name="desciption" >
					</div>
											<div class="mb-3">
						<label for="desciption" class="form-lablel">
							Mô tả1:</label> <br> <input type="text" value="${product.desciption1}"
							 name="desciption1" >
					</div>
											<div class="mb-3">
						<label for="desciption" class="form-lablel">
							Mô tả2:</label> <br> <input type="text" value="${product.desciption2}"
							 name="desciption2" >
					</div>
					<div class="mb-3">
						<label for="trademark" class="form-lablel">
							Thương hiệu:</label> <br> <input type="text" value="${product.trademark}"
							 name="trademark" >
					</div>
						<div class="mb-3">
						<label for="price" class="form-lablel">
							Price:</label> <br> <input type="text" value="${product.price}"
							 name="price" >
					</div>
						<div class="mb-3">
						<label for="promotionaprice" class="form-lablel">
							promotionaprice:</label> <br> <input type="text" value="${product.promotionaprice}"
							 name="promotionaprice" >
					</div>
						<div class="mb-3">
						<label for="quantity" class="form-lablel">
							quantity:</label> <br> <input type="text" value="${product.quantity}"
							 name="quantity" >
					</div>
						<div class="mb-3">
						<label for="slod" class="form-lablel">
							slod:</label> <br> <input type="text" value="${product.sold}"
							 name="sold" >
					</div>
					     <div class="mb-3">
                		<input type="text" name="listImage"  value="${product.listimage}" hidden="hidden" />
               			 <input type="file" name="listImageFile"  value="${product.listimage}" />
						</div>
						<div class="mb-3">
                		<input type="text" name="listImage1"  value="${product.listimage1}" hidden="hidden" />
               			 <input type="file" name="listImageFile1"  value="${product.listimage1}" />
						</div>
						<div class="mb-3">
                		<input type="text" name="listImage2"  value="${product.listimage2}" hidden="hidden" />
               			 <input type="file" name="listImageFile2"  value="${product.listimage2}" />
						</div>
				
						<div class="mb-3">
						<label for="categoryid" class="form-lablel">
							categoryid:</label> <br> <input type="text" value="${product.categoryid}"
							 name="categoryid" >
					</div>
						<div class="mb-3">
						<label for="storeid" class="form-lablel">
							storeid:</label> <br> <input type="text" value="${product.storeid}"
							 name="storeid" >
					</div>
						<div class="mb-3">
						<label for="rating" class="form-lablel">
							rating:</label> <br> <input type="text" value="${product.rating}"
							 name="rating" >
					</div>
						<div class="mb-3">
						<label for="createat" class="form-lablel">
							createat:</label> <br> <input type="date" value="${product.createat}"
							 name="createat" >
					</div>
					</div>
						<div class="mb-3">
						<label for="updateat" class="form-lablel">
							updateat:</label> <br> <input type="date" value="${product.updateat}"
							 name="updateat" >
					</div>

					
					<div class="mb-3">
						<label for="isselling" class="form-lablel">Status:</label>
						<select class="form-select" name = "isselling" aria-describedby="isselling" id = "isselling">
						
						<option ${product.isselling == true ? 'selected':'' } value = "true">Mở bán</option>
						<option ${product.isselling == false ? 'selected':'' } value = "false" >Chưa Mở bán</option>
						</select>

				</div>

				<div class="card-footer text-muted">
					<a href=<c:url value="/product/add"/>
						class="btn btn-secondary"><i class="fas fa-new"></i>New</a> <a
						href=<c:url value="/product"/> class="btn btn-success"><i
						class="fas bars"></i>Quay lại</a>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>

