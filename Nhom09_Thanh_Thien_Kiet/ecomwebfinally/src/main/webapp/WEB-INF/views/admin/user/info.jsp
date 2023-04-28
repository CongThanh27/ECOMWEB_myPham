
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
            <h1 class="m-0">Thông tin User</h1>
            
          </div><!-- /.col -->
          <div class="col-sm-6">
          
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/ThongKe/1">Home</a></li>
              <li class="breadcrumb-item active">User</li>
            </ol>
          </div><!-- /.col -->	
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <div class="col">
<div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                <c:url value="/images/${user.avatar}" var="imgUrl"></c:url>
                  <img class="profile-user-img img-fluid img-circle" src="${imgUrl}" alt="User profile picture">
                </div>

                <h3 class="profile-username text-center"> ${user.firstName}  ${user.lastName}</h3>

                <p class="text-muted text-center">${user.isSeller==true?Seller:User}</p>
                <p class="text-muted text-center">Ngày tham gia: ${user.createat}</p>
 				<p class="text-muted text-center">Email: ${user.email}</p>
 				<p class="text-muted text-center">SDT: ${user.phone}</p>
 				<p class="text-muted text-center">Address: ${user.address}</p>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Tổng đơn hàng</b> <a class="float-right"> ${sumdonhang}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Tổng đánh giá</b> <a class="float-right"> ${sumdanhgia}</a>
                  </li>
                </ul>

                <a href="/admin/profile/${user.id}" class="btn btn-primary btn-block"><b>Edit</b></a>
              </div>
              <!-- /.card-body -->
</div>
</div>
 </div>