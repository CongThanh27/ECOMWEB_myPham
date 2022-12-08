<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div style="margin: 0px;">
	<!-- BEGIN EXAMPLE TABLE PORTLET-->
	<div class="portlet">
		<div class="portlet-title">
			<div class="caption">
				<h2>${student.isEdit ? 'Edit Student' : 'Add New Student' }</h2>
				<i class="fa fa-globe"></i>
			</div>
		</div>
		<div class="portlet-body d-flex justify-content-center">
			<div class="table-toolbar">
				<!-- Hiển thị thông báo -->
				<%@include file="/common/info.jsp"%>
				<!-- Kết thúc hiển thị thông báo -->
				<div class="row" style="margin: 0px;">
					<div class="">
						<div class="row" style="margin: 0px;">
							<div class="">
								<form action="<c:url value="/admin/student/saveofUpdate"/>"
									method="post" enctype="multipart/form-data">
									<br />
									<div class="form-group">
										<label for="UserID">Mã số sinh viên:</label> <input
											type="text" name="mssv" value="${student.mssv}" id="mssv"
											class="form-control" />
									</div>
									<div class="form-group">
										<label for="categoryName">Họ và tên:</label> <input
											type="text" class="form-control" name="name" id="name"
											value="${student.name}" />
									</div>
									<div class="form-group">
										<label for="categoryCode">Ngày sinh:</label> <input
											type="text" class="form-control" name="dateofbirth"
											value="${student.dateofbirth}" id="dateofbirth" />
									</div>
									<div class="form-group">
										<label for="images">Images:</label> <input type="file"
											class="form-control" name="image" id="image"
											value="${student.image}" />
									</div>

									<div class="form-group">
										<label for="email">Email sinh viên:</label> <input type="text"
											class="form-control" name="email" id="email"
											value="${student.email}" />
									</div>
									<div class="form-group">
										<label for="deparment">Chuyên ngành sinh viên:</label> <input
											type="text" class="form-control" name="deparment"
											id="deparment" value="${student.deparment}" />
									</div>

									<div class="form-check form-check-inline">
										<label for="status">Status:</label> <input id="statuson"
											class="form-check-input" type="radio" name="status"
											${student.status?'checked':''} value="true"> <label
											for="statuson" class="form-check-label">Hoạt động</label> <input
											id="statusoff" class="form-check-input" type="radio"
											name="status" ${!student.status?'checked':''} value="false">
										<label for="statusoff" class="form-check-label">Khóa</label>
									</div>
									<br />
									<hr>
									<div class="form-group">
										<button class="btn green">
											Save <i class="fa fa-plus"></i>
										</button>

									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END EXAMPLE TABLE PORTLET-->
</div>

<div class="" style="">
	<h2>${student.isEdit ? 'Edit Student' : 'Add New Student' }</h2>
	<form:form action="/admin/student/saveofUpdate" method="POST"
		modelAttribute="student" enctype="multipart/form-data">
	
	Mã số sinh viên: <form:input path="mssv" />
		<br />
	Họ tên :<form:input path="name" />
		<br />
	Email : <form:input path="email" />
		<br />
	Ngày sinh : <form:input path="dateofbirth" />
		<br />
	Chuyên ngành : <form:input path="faculty" />
		<br />
		<form:hidden path="image" />
		<input type="file" name="imageFile" />
		<br />
		<form:radiobutton path="is_active" value="false" />Khóa <form:radiobutton
			path="is_active" value="true" />Hoạt động 
		<br />
		<button>Save</button>
	</form:form>
</div> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!doctype html>

<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Sinh Viên </title>
</head>

<body>

    <section class="container">

        <div class="col mt-4">
            <form action=<c:url value="/admin/student/saveofUpdate" /> method="POST" enctype="multipart/form-data">
            <div class="card">
                <div class="card-header">
                    <h2>${student.isEdit ? 'Edit Sinh Viên' : 'Add Sinh Viên'}</h2>
                </div>

            </div>
            <div class="card-body">

                <div class="mb-3">
                    <label for="mssv" class="form-lablel">Mã số sinh viên:</label>   
                    <input type="text" class="form-control" name="mssv" value="${student.mssv}" id="mssv" aria-describedby="mssv" placeholder="mssv" />
                    <!-- readonly="readonly" : chỉ cho phép đọc-->
                </div>

                <div class="mb-3">
                    <label for="name" class="form-lablel">Họ và tên</label>
                    <input type="text" value="${student.name}" id="name" name="name" aria-describedby="name" placeholder="Name">
                </div>

                <div class="mb-3">
                    <label for="dateofbirth" class="form-lablel">Ngày sinh:</label>
                    <input type="date" value="${student.dateofbirth}" id="dateofbirth" name="dateofbirth">

                </div>
               <div class="mb-3">
                <input type="text" name="image"  value="${student.image}"hidden="hidden"/>
                <input type="file" name="imageFile" />
				</div>
                <div class="mb-3">
                    <label for="email" class="form-lablel">email:</label>
                    <input type="email" value="${student.email}" id="email" name="email">

                </div>
                <div class="mb-3">
                    <label for="student" class="form-lablel">Faculty</label>
                    <input type="text" value="${student.faculty}" id="faculty" name="faculty">

                </div>

                <div class="mb-3">
                    <label for="is_leader" class="form-lablel">Is_leader:</label>
                    <select class="form-select" name="isleader" aria-describedby="is_leader" id="isleader">
						
						<option ${student.isleader == true ? 'selected':'' } value = "true"> Yes</option>
						<option ${student.isleader == false ? 'selected':'' } value = "false" >No</option>
						</select>

                </div>
                <div class="mb-3">
                    <label for="student" class="form-lablel">Id_project</label>
                    <input type="text" value="${student.idproject}" id="idproject" name="idproject">

                </div>

                <div class="mb-3">
                    <label for="is_active" class="form-lablel"> Is_active:</label>
                    <select class="form-select" name="is_active" aria-describedby="is_active" id="isleader">
						
						<option ${student.is_active == true ? 'selected':'' } value = "true">Yes</option>
						<option ${student.is_active == false ? 'selected':'' } value = "false" >No</option>
						</select>
                </div>
                <div class="card-footer text-muted">
                    <a href=<c:url value="/admin/student/add" /> class="btn btn-secondary"><i class="fas fa-new"></i>New</a> 
                    <a href=<c:url value="/admin/student" /> class="btn btn-success"><i class="fas bars"></i>List Student</a>
                    <button class="btn btn-primary" type="submit">
						<i class="fas fa-save"></i>
						<!-- true là cập nhật -->
						<c:if test="${student.isEdit }">
							<span>Update</span>
						</c:if>
						
						<c:if test="${!student.isEdit }">
							<span>Save</span>
						</c:if>

					</button>
                </div>

                </form>

            </div>

    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

</html>