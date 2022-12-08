<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Student</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
                         <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Danh sách Sinh Viên</h1>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Xem Danh sách</h6>
                        </div>
                        <div class="card-footer text-muted">
                         <a href=<c:url value="/admin/student/add"/>
						class="btn btn-dark"><i class="fa fa-new"></i>Tạo Sinh viên</a> 
						</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã số</th>
                                            <th>Tên</th>
                                            <th>Ngày sinh</th>
                                            <th>Nhận diện</th>
                                            <th>Email</th>
                                            <th>Faculty</th>
                                            <th>Is_leader</th>
                                            <th>Id_project</th>
                                            <th>Is_active</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Mã số</th>
                                            <th>Tên</th>
                                            <th>Ngày sinh</th>
                                            <th>Nhận diện</th>
                                            <th>Email</th>
                                            <th>Faculty</th>
                                            <th>Is_leader</th>
                                            <th>Id_project</th>
                                            <th>Is_active</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${students}" var="student">
                                            <tr>
                                                <td>${student.mssv}</td>
                                                <td>${student.name}</td>
                                                <td>${student.dateofbirth}</td>
                         <td><c:url value="/images/${student.image}" var="imgUrl"></c:url>
						<img width="100px" height="100px" name="imageFile" src="${imgUrl}"></td>
                                                <td>${student.email}</td>
                                                <td>${student.faculty}</td>
                                                <td>${student.isleader}</td> 
                                                <td>${student.idproject}</td> 
                                                <td>${student.is_active ? 'Actived' : 'Not Active'}</td> 
                                                <td>
                                                    <!-- Button trigger modal -->
                                                    <a href="Thông tin" class="btn btn-outline-info"><i class="fa fa-info"></i></a>

                                                    <a href="/admin/student/edit/${student.mssv}" class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>
                                                    <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#exampleModal${student.mssv}">
                                                      <i class="fa fa-trash"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal${student.mssv}" tabindex="-1" aria-labelledby="exampleModalLabel${student.mssv}" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel${student.mssv}">Delete</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Bạn có chắc chắn muốn xóa?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <!-- <button type="button" class="btn btn-primary" >Yes</button> -->
                                                            <a class="btn btn-primary" href="/admin/student/delete/${student.mssv}" class="btn btn-outline-danger">Yes</a>
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

                </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>