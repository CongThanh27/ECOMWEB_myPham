<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/resources/fe/" var="URL"></c:url>

<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist"
	aria-orientation="vertical" style="margin: auto; margin-top: 150px">
	<a class="nav-link active" id="v-pills-home-tab" data-toggle="pill"
		href="#v-pills-home" role="tab" aria-controls="v-pills-home"
		aria-selected="true">Overview</a> <a class="nav-link"
		id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile"
		role="tab" aria-controls="v-pills-profile" aria-selected="false">Change
		Password</a>
</div>

<div class="tab-content" id="v-pills-tabContent"
	style="margin: auto; margin-top: 10px">
	<div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
		aria-labelledby="v-pills-profile-tab">

		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-lg-6 mb-4 mb-lg-0">
				<div class="card mb-3" style="border-radius: .5rem;">
					<form action="/user/changePassword" method="post"
						enctype="multipart/form-data">
						<div class="row g-0">

							<div class="col-md-4 gradient-custom text-center text-white"
								style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">

								<c:if test="${!user.avatar.substring(0,4).equals('http')}">
									<img src="/images/user/${user.avatar}" alt="Avatar"
										class="img-fluid my-5 rounded-circle" style="width: 100px;">
								</c:if>
								<c:if test="${user.avatar.substring(0,4).equals('http')}">
									<img src="${user.avatar}" alt="Avatar"
										class="img-fluid my-5 rounded-circle" style="width: 100px;">
								</c:if>
								<h5>${user.firstName}${user.lastName}</h5>
								<input type="text" name="avatar" value="${user.avatar }"
									hidden="true">
								<div class="d-flex justify-content-start">
									<a href="#!"><i class="fa fa-facebook-square"
										aria-hidden="true" style="margin: 15px;"></i></a> <a href="#!"><i
										class="fa fa-twitter-square" aria-hidden="true"
										style="margin: 15px;"></i></a> <a href="#!"><i
										class="fa fa-instagram" aria-hidden="true"
										style="margin: 15px;"></i></a>
								</div>
							</div>


							<div class="col-md-8">
								<div class="card-body p-4">
									<h6>Change Password</h6>
									<hr class="mt-0 mb-4">
									<div class="row pt-1">

										<input type="text" class="form-control" name="firstName"
											value="${user.firstName }" hidden="true"> <input
											type="text" class="form-control" name="lastName"
											value="${user.lastName }" hidden="true"> <input
											type="text" class="form-control" name="email"
											value="${user.email }" hidden="true"> <input
											type="text" class="form-control" name="phone"
											value="${user.phone }" hidden="true"> <input
											type="text" class="form-control" name="address"
											value="${user.address }" hidden="true">

										<div class="col-6 mb-3">
											<h6>Current Password</h6>
											<input type="password" class="form-control"
												name="hashedpassword" style="width: 115%;">
										</div>



										<div class="col-7 mb-4">
											<h6>New password</h6>
											<input type="password" class="form-control"
												name="newPassword" value="${user.newPassword }"
												style="width: 98%;">
										</div>

										<div class="col-8 mb-3">
											<h6>Retype new password</h6>
											<input type="password" class="form-control"
												name="confirmPassword" value="${user.confirmPassword }"
												style="width: 85%;">
										</div>

										<input type="hidden" name="isSeller" value="${user.isSeller }">
										<input type="hidden" name="role" value="${user.role }">

										<div class="col-9 mb-3">
											<input type="hidden" name="id" value="${user.id }">
											<button type="submit" class="btn btn-primary btn-sm">
												<span>Save</span>
											</button>
										</div>
									</div>



								</div>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<div class="tab-pane fade show active" id="v-pills-home"
		role="tabpanel" aria-labelledby="v-pills-home-tab">

		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-lg-6 mb-4 mb-lg-0">
				<div class="card mb-3" style="border-radius: .5rem;">
					<form action="/user/saveProfile" method="post"
						enctype="multipart/form-data">
						<div class="row g-0">

							<div class="col-md-4 gradient-custom text-center text-white"
								style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
								<!-- <img
								src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
								alt="Avatar" class="img-fluid my-5" style="width: 80px;" /> -->
								<c:if test="${!user.avatar.substring(0,4).equals('http')}">
									<img src="/images/user/${user.avatar}" alt="Avatar"
										class="img-fluid my-5 rounded-circle" style="width: 100px;">
								</c:if>
								<c:if test="${user.avatar.substring(0,4).equals('http')}">
									<img src="${user.avatar}" alt="Avatar"
										class="img-fluid my-5 rounded-circle" style="width: 100px;">
								</c:if>
								<h5>${user.firstName}${user.lastName}</h5>
								<p>Web Designer</p>
								<div class="m-2">

									<input type="text" name="avatar" value="${user.avatar }"
										hidden="true"> <input type="file" class="form-control"
										name="avatarFile" value="${user.avatarFile }"
										accept=".jpg,.jpeg,.png">
								</div>

								<div class="d-flex justify-content-start">
									<a href="#!"><i class="fa fa-facebook-square"
										aria-hidden="true" style="margin: 15px;"></i></a> <a href="#!"><i
										class="fa fa-twitter-square" aria-hidden="true"
										style="margin: 15px;"></i></a> <a href="#!"><i
										class="fa fa-instagram" aria-hidden="true"
										style="margin: 15px;"></i></a>
								</div>
							</div>




							<div class="col-md-8">
								<div class="card-body p-4">
									<h6>Information</h6>
									<hr class="mt-0 mb-4">
									<div class="row pt-1">

										<div class="col-5 mb-3">
											<h6>First Name</h6>
											<input type="text" class="form-control" name="firstName"
												value="${user.firstName }" style="width: 115%;">
										</div>

										<div class="col-5 mb-3">
											<h6>Last Name</h6>
											<input type="text" class="form-control" name="lastName"
												value="${user.lastName }" style="width: 115%;">
										</div>

										<div class="col-6 mb-3">
											<h6>Email</h6>
											<input type="text" class="form-control" name="email"
												value="${user.email }" style="width: 190%;"
												readonly="readonly">
										</div>
										<div class="col-7 mb-3">
											<h6>Phone</h6>
											<input type="text" class="form-control" name="phone"
												value="${user.phone }" style="width: 158%;">
										</div>
										<div class="col-8 mb-3">
											<h6>Address</h6>
											<input type="text" class="form-control" name="address"
												value="${user.address }" style="width: 135%;">
										</div>
										<input type="hidden" name="hashedpassword"
											value="${user.hashedpassword }"> <input type="hidden"
											name="role" value="${user.role }"> <input
											type="hidden" name="isSeller" value="${user.isSeller }">

										<div class="col-9 mb-3">
											<input type="hidden" name="id" value="${user.id }">
											<button type="submit" class="btn btn-primary btn-sm">
												<span>Save</span>
											</button>
										</div>
									</div>



								</div>
							</div>

							<div class="col-md-8"></div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

