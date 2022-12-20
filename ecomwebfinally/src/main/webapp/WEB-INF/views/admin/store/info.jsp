
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
            <h1 class="m-0">Thông tin Store</h1>
            
          </div><!-- /.col -->
          <div class="col-sm-6">
          
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/ThongKe/1">Home</a></li>
              <li class="breadcrumb-item active">Store</li>
            </ol>
          </div><!-- /.col -->	
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <div class="col">
<div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                <c:url value="/images/${store.avatar}" var="imgUrl"></c:url>
                  <img class="profile-user-img img-fluid img-circle" src="${imgUrl}" alt="User profile picture">
                </div>
				<h3 class="profile-username text-center"> ${store.name} </h3>
               
  				<p class="text-muted text-center">Chủ shop: ${store.user.firstName}  ${store.user.lastName} </p>
                <p class="text-muted text-center">Trang thái: ${store.isactive}</p>
                <p class="text-muted text-center">Ngày tham gia: ${store.createat}</p>
 				<p class="text-muted text-center">Email: ${store.user.email}</p>
 				<p class="text-muted text-center">SDT: ${store.user.phone}</p>
 				<p class="text-muted text-center">Address: ${store.user.address}</p>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Tổng đơn hàng của shop</b> <a class="float-right"> ${sumdonhang}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Điểm đánh giá</b> <a class="float-right"> ${sumdanhgia} sao</a>
                  </li>
                </ul>
<c:if test="${store.isactive==true}">
<a href="/admin/KhoaMo/${store.id}" class="btn btn-primary btn-block"><b>Khóa</b></a>
</c:if>
<c:if test="${store.isactive==false}">
<a href="/admin/KhoaMo/${store.id}" class="btn btn-primary btn-block"><b>Duyệt/Mở</b></a>
</c:if>               
              </div>
              <!-- /.card-body -->
</div>
</div>
 </div>