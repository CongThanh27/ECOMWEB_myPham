
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
              <li class="breadcrumb-item active">List Store</li>
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
                         Đã duyệt
                      </th>
                      <th style="width: 20%">
                          Name
                      </th>
                      <th style="width: 20%">
                          Nhận diện
                      </th>
                      <th style="width: 8%" class="text-center">
                          Chủ shop
                      </th>
                      <th style="width: 20%">
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach items="${store}" var="store">
                  <tr>
                      <td>
                          ${store.isactive}
                      </td>
                      <td>
                          <a>
                            ${store.name}  
                          </a>
                          <br>
                          <small>
                             Ngày đăng ký: ${store.createat}
                          </small>
                      </td>
                      <td>
                      <c:url value="/images/${store.avatar}" var="imgUrl"></c:url>
                          <ul class="list-inline">
                              <li class="list-inline-item">
                                  <img alt="Avatar" class="table-avatar" src="${imgUrl}">
                              </li>
                          </ul>
                      </td>
                      <td>
                        <a  href="/admin/profileuser/${store.user.id}"> ${store.user.firstName}  ${store.user.lastName}</a>
                         
                      </td>
                      <td>
                      <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="/admin/profistore/${store.id}">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          
                          <a class="btn btn-info btn-sm" href="/admin/KhoaMo/${store.id}">
                              <i class="fas fa-pencil-alt">
                              </i>
                              <c:if test="${store.isactive==true}">
                              Khóa shop
                              </c:if>
                              <c:if test="${store.isactive==false}">
                              Mở/Duyệt shop
                              </c:if>
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