
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
            <h1 class="m-0">Thông tin Order</h1>
            
          </div><!-- /.col -->
          <div class="col-sm-6">
          
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/admin/ThongKe/1">Home</a></li>
              <li class="breadcrumb-item active">Danh sách các đơn hàng</li>
            </ol>
          </div><!-- /.col -->	
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
<section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Danh sách</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
        <div class="card-body p-0">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 10%">
                        Mã số đơn
                      </th>
                      <th style="width: 70%">
                        Bởi
                      </th>

                      <th style="width: 10%">
                          Giá
                      </th>
                      
                      <th style="width: 10%">
                          Chi tiết
                      </th>
   
                  </tr>
              </thead>
              <tbody>
              <c:forEach items="${order}" var="order">
                  <tr>
                      <td style="width: 10%">
                          ${order.id}
                      </td>
                      <td style="width: 70%">
                          <a>
                              ${order.store.name} 
                          </a>
                          <br>
                          <small>
                             Ngày tạo: ${order.createat} 
                          </small>
                      </td>
						<td class="project-state" style="width: 10%" >
                          <span class="badge badge-success">$${order.price}</span>
                      </td>

                      <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="/admin/orderdetail/${order.id}">
                              <i class="fas fa-folder">
                              </i>
                              Chi tiết
                          </a>

                      </td>
                  </tr>
                  </c:forEach>
              </tbody>
          </table>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    </div>