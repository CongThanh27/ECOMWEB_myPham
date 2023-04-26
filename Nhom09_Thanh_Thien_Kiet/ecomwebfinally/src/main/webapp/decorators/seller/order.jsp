<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/resources/" var="URL1"></c:url>
<c:url value="/resources/fe/" var="URL"></c:url>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Vận chuyển</title>

	


<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${URL1}plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="${URL1}plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="${URL1}plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="${URL1}plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${URL1}dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="${URL1}plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="${URL1}plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="${URL}plugins/summernote/summernote-bs4.min.css">
	<link rel="stylesheet" type="text/css" href="${URL}styles/bootstrap4/bootstrap.min.css">
    <link href="${URL}plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${URL}plugins/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="${URL}plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${URL}plugins/OwlCarousel2-2.2.1/animate.css">
    <link rel="stylesheet" type="text/css" href="${URL}plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="${URL}styles/categories_styles.css">
    <link rel="stylesheet" type="text/css" href="${URL}styles/categories_responsive.css">


</head>
<body>

	<%--  <%@ include file="/common/category/header.jsp"%>  --%>

	<!-- body -->
	<sitemesh:write property='body'></sitemesh:write>
	<!-- body -->

	<!--=== Footer v4 ===-->

	<%--  <jsp:include page="/common/category/footer.jsp"></jsp:include>  --%>

	<!--=== End Footer v4 ===-->

	<!-- jQuery -->
	<script src="${URL1}plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="${URL1}plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${URL1}dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${URL1}/dist/js/demo.js"></script>
	
    <script src="${URL}js/jquery-3.2.1.min.js"></script>
    <script src="${URL}styles/bootstrap4/popper.js"></script>
    <script src="${URL}styles/bootstrap4/bootstrap.min.js"></script>
    <script src="${URL}plugins/Isotope/isotope.pkgd.min.js"></script>
    <script src="${URL}plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="${URL}plugins/easing/easing.js"></script>
    <script src="${URL}plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
    <script src="${URL}js/categories_custom.js"></script>
    <script src="${URL}js/single_custom.js "></script>
    
    
    	<!-- jQuery -->
<script src="${URL1}plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${URL1}plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="${URL1}plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="${URL1}plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="${URL1}plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="${URL1}plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="${URL1}plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="${URL1}plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="${URL1}plugins/moment/moment.min.js"></script>
<script src="${URL1}plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="${URL1}plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="${URL1}plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="${URL1}plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="${URL1}dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${URL1}dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${URL1}dist/js/pages/dashboard.js"></script>

<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</body>
</html>