<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/resources/" var="URL"></c:url>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Log in (v2)</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${URL}plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${URL}plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${URL}dist/css/adminlte.min.css">

<!-- Logo -->
<link rel="stylesheet" type="text/css"
	href="${URL}styles/bootstrap4/bootstrap.min.css">
<link href="${URL}plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${URL}plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="${URL}plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="${URL}plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="${URL}styles/main_styles.css">
<link rel="stylesheet" type="text/css"
	href="${URL}styles/responsive.css">
</head>
<body>

	<%-- <%@ include file="/common/category/header.jsp"%> --%>




	<!-- body -->
	<sitemesh:write property='body'></sitemesh:write>
	<!-- body -->

	<!--=== Footer v4 ===-->

	<%-- <jsp:include page="/common/category/footer.jsp"></jsp:include> --%>

	<!--=== End Footer v4 ===-->

	<!-- jQuery -->
	<script src="${URL}plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${URL}plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${URL}dist/js/adminlte.min.js"></script>
	
	<!-- Logo -->
	<script src="${URL}js/jquery-3.2.1.min.js"></script>
	<script src="${URL}styles/bootstrap4/popper.js"></script>
	<script src="${URL}styles/bootstrap4/bootstrap.min.js"></script>
	<script src="${URL}plugins/Isotope/isotope.pkgd.min.js"></script>
	<script src="${URL}plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="${URL}plugins/easing/easing.js"></script>
	<script src="${URL}js/custom.js"></script>
</body>
</html>