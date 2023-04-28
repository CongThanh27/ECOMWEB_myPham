
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
              <li class="breadcrumb-item active">List user</li>
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
                         Là Seller
                      </th>
                      <th style="width: 20%">
                          Name
                      </th>
                      <th style="width: 20%">
                          Nhận diện
                      </th>
                      <th>
                          Danh thu
                      </th>
                      <th style="width: 8%" class="text-center">
                          Chi
                      </th>
                      <th style="width: 20%">
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach items="${user}" var="user">
                  <tr>
                      <td>
                          ${user.isSeller}
                      </td>
                      <td>
                          <a>
                              ${user.firstName}  ${user.lastName}
                          </a>
                          <br>
                          <small>
                             Ngày tham gia: ${user.createat} 
                          </small>
                      </td>
                      <td>
                      <c:url value="/images/${user.avatar}" var="imgUrl"></c:url>
                          <ul class="list-inline">
                              <li class="list-inline-item">
                                  <img alt="Avatar" class="table-avatar" src="${imgUrl}">
                              </li>
                          </ul>
                      </td>
                      <td class="project_progress">
                       <c:forEach items="${usermodel}" var="usermodel">
                       <c:if test="${ usermodel.id == user.id}">
                          <div class="progress progress-sm">
                              <div class="progress-bar bg-green" role="progressbar" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100" style="width: ${(usermodel.sum/danhthutoong)*100}%">
                              </div>
                          </div>
                          <small>
                              ${(usermodel.sum/danhthutoong)*100}%  so với danh thu
                          </small>
                          </c:if>
                          </c:forEach>
                      </td>
                      <td class="project-state">
                       <c:forEach items="${usermodel}" var="usermodel">
                       <c:if test="${ usermodel.id == user.id}">
                          <span class="badge badge-success">$${usermodel.sum}</span>
                           </c:if>
                          </c:forEach>
                      </td>
                      <td class="project-actions text-right">
                          <a class="btn btn-primary btn-sm" href="/admin/profileuser/${user.id}">
                              <i class="fas fa-folder">
                              </i>
                              View
                          </a>
                          <a class="btn btn-info btn-sm" href="/admin/profile/${user.id}">
                              <i class="fas fa-pencil-alt">
                              </i>
                              Edit
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