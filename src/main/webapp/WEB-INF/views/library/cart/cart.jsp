<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL 코어 태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- JSTL 포매팅 태그 -->
<%@ include file="../../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="home2">
		<div class="home_background_container prlx_parent">
			<div class="home_background prlx2"
				style="background-image: url(/resources/images/courses_background.jpg)"></div>
		</div>
	</div>

	<!-- Popular -->
	<div class="popular page_section">
		<div class="container">
			<div class="row">
				<div class="col">
					<br>
					<br>
					<br>
					<br>
					<div class="section_title text-center">
						<h1>장바구니</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="container"> -->
	</div>
	<!-- <div class="popular page_section"> -->

<div>

<table>
<thead>
<tr><th colspan="5">${user.nickName} 님의 장바구니 </th></tr>

<tr>
				<th>전체 선택<br><input type="checkbox" id="checkAll"></th>
				<th>도서 사진</th>
				<th>도서명</th>
				<th>삭제</th>
</tr>

</thead>
<tbody id="tableBody">
<c:if test="${listCount==0}"></c:if>
<c:if test="${listCount>0}"></c:if>
<c:forEach items="${cartList}" var="cart">
<tr><td><input type="checkbox" name="check"><input type="hidden" name="book" value="${cart.isbn13}"></td>
<td><img alt="도서이미지" src="${cart.photo}"  height="100"></td>
<td>${cart.c_title}</td>
<td><button class="deleteCart">삭제</button></td><tr>
</c:forEach>

<!-- forEach에서는 id 선언 해버리면 중복이 발생할 수 있으므로 name으로 설정 -->
</tbody>

</table>
<input type="hidden" id="user_id" value="${userId}">
<input type="hidden" id="cart_id" value="${cartId}">
<input type="hidden" id="cartDate" value="${cartDate}">
<input type="hidden" id="bookData">
<button id="rsBtn">예약 확정</button>
<button id="clearCart">장바구니 비우기(전체 삭제)</button>
</div>

<script type="text/javascript" src="/resources/js/cart.js"></script>
	<%@ include file="../../includes/footer.jsp"%>
</body>
</html>