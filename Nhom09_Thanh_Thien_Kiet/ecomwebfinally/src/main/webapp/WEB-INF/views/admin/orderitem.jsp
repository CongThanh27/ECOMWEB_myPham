<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="container product_section_container">

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Chi tiết danh thu</h1> 
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/ThongKe/1">Home</a></li>
              <li class="breadcrumb-item active">OrderItem</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
     <h5 class="mb-2">Trạng thái</h5>
	<div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-warning elevation-1"><i class="far fa-envelope"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Chờ xác nhận</span>
                <span class="info-box-number">
                  ${chosatnhan}</span>
                  <small>Đơn</small>
                
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-cog"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Đã hủy</span>
                <span class="info-box-number">${dahuy}</span>
                
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-primary elevation-1"><i class="fas fa-shopping-cart"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Đang giao</span>
                <span class="info-box-number">${danggiaohang}</span>
                 
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Đã nhận</span>
                <span class="info-box-number">${danhanhang}</span>
                 
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
        </div>
      </section>
      <div class="card">
              <div class="card-header">
                <h3 class="card-title">Danh sách đơn hàng</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
               <c:forEach items="${order}" var="order">
               <br>
               <br>
               <span class="info-box-number">${order.createat}</span>
                
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th style="width: 10px">IMG</th>
                      <th>Tên sản phẩm</th>
                      <th>Store</th>
                      <th>User</th>
                      <th style="width: 40px">Giá</th>
                      
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${order.orderitems}" var="orderitem">
                    <tr>
                      <td width="105px">
                      <c:url value="/images/${orderitem.product.listimage}" var="imgUrl"></c:url>
						<img width="100px" height="100px" src="${imgUrl}" alt="">
                      </td>
                      <td width="639px"><a href="/product/user/list/${orderitem.product.id}">${orderitem.product.name}</a></td>
                      
                       <td ><a href="">${order.store.name}</a></td>  
                       <td ><a href="/admin/profileuser/${order.user.id}">${order.user.firstName} ${order.user.lastName}</a></td>                     
                      
                      <td width="44px"><span  class="badge bg-info">$${orderitem.count*orderitem.product.promotionaprice}</span>
                      </td>
 						
                    </tr>
                   
                    <br>
           			 </c:forEach>
           			
                  </tbody>
                </table>
                 <span  class="badge bg-danger"> Tổng:$${order.price}</span>
                 <span  class="badge bg-primary"> <a href="/admin/orderdetail/${order.id}">Chi tiết</a></span>
                 
                </c:forEach>
              </div>
              <!-- /.card-body -->

            </div>
</div>



