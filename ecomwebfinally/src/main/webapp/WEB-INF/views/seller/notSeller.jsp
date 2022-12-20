<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<div>
	<br> <br> <br>
	<c:if test="${user.isSeller == false}">
		<div>
			<h2 style="text-align: center">Bạn hiện không phải là chủ của
				bất kỳ cửa hàng nào !!!</h2>
			<br> <br> <br> <a href="/sellerRegister"
				style="text-align: center; top: 100px"><h2>Bấm vào đây để
					đăng ký</h2></a>

		</div>

	</c:if>
	<c:if test="${user.isSeller == true}">
		<c:if test="${store.isactive == false }">
			<h2 style="text-align: center">Cửa hàng của bạn hiện đang trong
				quá trình chờ duyệt !!!</h2><br>
			<h2 style="text-align: center">Xin hãy quay lại trang chủ và chờ
				đợi !!!</h2>
		</c:if>
	</c:if>

	<br> <br> <br> <br> <br> <br> <br> <br>
	<br> <br>
</div>



