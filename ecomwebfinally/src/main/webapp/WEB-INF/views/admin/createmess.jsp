
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/resources/" var="URL"></c:url>
<div class="content-wrapper" style="min-height: 1302.4px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Soạn, biên soạn:(Chưa sử dụng được)</font></font></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Trang Chủ</font></font></a></li>
              <li class="breadcrumb-item active"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Soạn, biên soạn</font></font></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <a href="mailbox.html" class="btn btn-primary btn-block mb-3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Quay lại Hộp thư đến</font></font></a>

            <div class="card">
              <div class="card-header">
                <h3 class="card-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Thư mục</font></font></h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body p-0">
                <ul class="nav nav-pills flex-column">
                  <li class="nav-item active">
                    <a href="#" class="nav-link">
                      <i class="fas fa-inbox"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Hộp thư đến
                      </font></font><span class="badge bg-primary float-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">12</font></font></span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-envelope"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Đã gửi
                    </font></font></a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-file-alt"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">bản thảo
                    </font></font></a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="fas fa-filter"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Rác
                      </font></font><span class="badge bg-warning float-right"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">65</font></font></span>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-trash-alt"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Rác
                    </font></font></a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">nhãn</font></font></h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <ul class="nav nav-pills flex-column">
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="far fa-circle text-danger"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Quan trọng</font></font></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="far fa-circle text-warning"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">khuyến mãi</font></font></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#"><i class="far fa-circle text-primary"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Xã hội</font></font></a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-primary card-outline">
              <div class="card-header">
                <h3 class="card-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">soạn tin nhắn mới</font></font></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="form-group">
                  <input class="form-control" placeholder="Đến:">
                </div>
                <div class="form-group">
                  <input class="form-control" placeholder="Vấn đề:">
                </div>
               
                <div class="form-group">
                  <div class="btn btn-default btn-file">
                    <i class="fas fa-paperclip"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Tập tin đính kèm
                    </font></font><input type="file" name="attachment">
                  </div>
                  <p class="help-block"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">tối đa. </font><font style="vertical-align: inherit;">32MB</font></font></p>
                </div>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <div class="float-right">
                  <button type="button" class="btn btn-default"><i class="fas fa-pencil-alt"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Bản thảo</font></font></button>
                  <button type="submit" class="btn btn-primary"><i class="far fa-envelope"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Gửi</font></font></button>
                </div>
                <button type="reset" class="btn btn-default"><i class="fas fa-times"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">loại bỏ</font></font></button>
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>