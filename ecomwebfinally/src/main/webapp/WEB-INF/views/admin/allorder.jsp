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
            <h1 class="m-0">Dashboard</h1>
            
          </div><!-- /.col -->
          <div class="col-sm-6">
          
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/ThongKe/1">Home</a></li>
              <li class="breadcrumb-item active">All order</li>
            </ol>
          </div><!-- /.col -->	
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- TABLE: LATEST ORDERS -->
            <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">Latest Orders</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <div class="table-responsive">
                  <table class="table m-0">
                    <thead>
                    <tr>
                      <th>Order ID</th>
                      <th>Đơn vị vận chuyển</th>
                      <th>Trạng thái</th>
                      <th>Khách hàng</th>
                    </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${orderall}" var="orderganday">
                    <tr>
                      <td><a href="/admin/orderdetail/${orderganday.id}">${orderganday.id}</a></td>
                      <td>${orderganday.delivery.name}</td>
                      <td>
                      <c:if test="${orderganday.giaohang==1}"><span class="badge badge-warning">Chờ xác nhận</span></c:if>
                      <c:if test="${orderganday.giaohang==0}"><span class="badge badge-badge-danger">Đã Hủy</span></c:if>
                      <c:if test="${orderganday.giaohang==2}"><span class="badge badge-badge-info">Đang giao</span></c:if>
                       <c:if test="${orderganday.giaohang==3}"><span class="badge badge-badge-info">Đang giao</span></c:if>
                      <c:if test="${orderganday.giaohang==4}"><span class="badge badge-success">Đã nhận</span></c:if>
                      </td>                      
                      <td>
                      <a href="/admin/profileuser/${orderganday.user.id}">${orderganday.user.lastName}</a>
                        <%-- <div class="sparkbar" data-color="#00a65a" data-height="20">${orderganday.user.lastName}</div> --%>
                      </td>
                    </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <!-- <a href="javascript:void(0)" class="btn btn-sm btn-info float-left">Place New Order</a> -->
                <!-- <a href="javascript:void(0)" class="btn btn-sm btn-secondary float-right">View All Orders</a> -->
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->