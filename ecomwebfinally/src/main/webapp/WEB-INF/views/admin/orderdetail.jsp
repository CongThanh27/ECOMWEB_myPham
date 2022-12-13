
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
            <h1 class="m-0">Thông tin chi tiết đơn hàng</h1>
            
          </div><!-- /.col -->
          <div class="col-sm-6">
          
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/order">Thông tin đơn hàng</a></li>
              <li class="breadcrumb-item active">Thông tin chi tiết đơn hàng</li>
            </ol>
          </div><!-- /.col -->	
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
<div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
                    <i class="fas fa-globe"></i> T2KShop
                    <small class="float-right"> Ngày xuất phiếu: ${date} </small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
                <div class="col-sm-4 invoice-col">
                  Từ Store
                  <address>
                    <strong>${order.store.name}</strong><br>
                   
                  <a href="/admin/profileuser/${order.store.user.id}"> ${order.store.user.firstName} ${order.store.user.lastName}</a> <br>
                    
                      Địa chỉ: ${order.store.user.address}
                    <br>
                     Email: ${order.store.user.phone}
                    <br>
                    Email: ${order.store.user.email}
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  To
                  <address>
                     <a href="/admin/profileuser/${order.user.id}"> ${order.user.firstName} ${order.user.lastName}</a> <br>
                    Địa chỉ: ${order.user.address}<br>
   
                    Phone: ${order.user.phone}<br>
                    Email: ${order.user.email}
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  <b>Invoice: #${random}</b><br>
                  <br>
                  <b>Order ID:</b> ${order.id}<br>

                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
                <div class="col-12 table-responsive">
                  <table class="table table-striped">
                    <thead>
                    <tr>
                      <th>Qty</th>
                      <th>Product</th>                  
                      <th>Description</th>
                      <th>Subtotal</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${order.orderitems}" var="orderitem">
                    <tr>
                      <td> ${orderitem.count}</td>
                      <td>${orderitem.product.name}</td>
            
                      <td>${orderitem.product.desciption}</td>
                      <td>$${orderitem.product.promotionaprice}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <div class="row">
                <!-- accepted payments column -->
                <div class="col-6">
                  <p class="lead">Payment Methods:</p>
                  
                  <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">
                    Thanh toán khi nhận hàng.
                  </p>
                </div>
                <!-- /.col -->
                <div class="col-6">
                  <p class="lead">Sum</p>

                  <div class="table-responsive">
                    <table class="table">
                      <tbody><tr>
                        <th style="width:50%">Subtotal:</th>
                        <td>$${order.price }</td>
                      </tr>
                      <tr>
                        <th>Shipping:</th>
                        <td>$${order.delivery.price }</td>
                      </tr>
                      <tr>
                        <th>Total:</th>
                        <td>$${order.price + order.delivery.price}</td>
                      </tr>
                    </tbody></table>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- this row will not appear when printing -->
              <div class="row no-print">
                <div class="col-12">
                  <a href="invoice-print.html" rel="noopener" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Print</a>
                  
                </div>
              </div>
            </div>