<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Danh sách OrderItem</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- font -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" 
integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" 
crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<section class="row">
		<div class="col mt-4">
			<div class="card">
				<div class="alert alert-primary shadow p-3 mb-5 bg-body rounded text-center fw-bold">List OrderItem</div>

					<div class="card-footer text-muted">
						<span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Disabled popover">
						 <!--  <button class="btn btn-primary" type="button" disabled>Disabled button</button> -->
						  <a href=<c:url value="/user/orderItems/add"/>
						class="btn btn-dark"><i class="fa fa-new"></i>Thêm OrderItem</a> 
						</span> 						
					
					</div>

					
					
					<div class="card-footer text-muted">	
					Tìm kiếm theo tên OrderItem	
					<form action = "/user/orderItems/Search">
					<input type="text" id="categoryName" name="name"
							 placeholder="Category Name" >					
					<button class="btn btn-primary" type="submit">
					 <i class="fas fa-search"></i>
					</button>
					</form>
									<br>
					Chỉnh sửa theo id
					<form action=<c:url value = "/user/orderItems/edit/${id}"/>
					method="GET">
					<input type="text" 
							id="categoryEdit" name="id"
							 placeholder="Enter Category ID">				
					<button class="btn btn-primary" type="submit">
					 <i class="fas fa-edit"></i>
					</button>
					</form>
						
					</div>
				
				<div class="card-body">
					<!-- Hiển thông báo -->
						<%@include file="/common/info.jsp"%>
					<!-- Hêt thông báo -->
					<table class="table table-dark table-striped">
						<thead class="thead-inverse">
							<tr>
								<th>ID</th>
								<th>Order ID</th>
								<th>Product ID</th>
								<th>Count</th>
								<th>Create</th>
								<th>Update</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listOderItem}" var="oi">
								<tr>
									<td scope="row">${oi.id}</td>
									<td>${oi.orderid}</td>
									<td>${oi.productid}</td>
									<td>${oi.count}</td>
									<td>${oi.createat}</td>
									<td>${oi.updateat}</td>							
									<td>
    									<!-- Button trigger modal -->
								
										<a href="/user/orderItems/edit/${oi.id}"
										class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>
										<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${product.id}">
										  <i class="fa fa-trash"></i>
										</button>								
										</td>	
								</tr>
								<!-- Modal -->
								<div class="modal fade" id="exampleModal${oi.id}" tabindex="-1" aria-labelledby="exampleModalLabel${oi.id}" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel${oi.id}">Delete</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        Bạn có chắc chắn muốn xóa?
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								        <!-- <button type="button" class="btn btn-primary" >Yes</button> -->
								        <a class="btn btn-primary" href="/user/orderItems/delete/${product.id}" class="btn btn-outline-danger">Yes</a> 
								      </div>
								    </div>
								  </div>
								</div>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
 
	</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>