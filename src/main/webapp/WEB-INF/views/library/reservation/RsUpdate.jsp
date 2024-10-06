<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL 코어 태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <!-- JSTL 포매팅 태그 -->
<%@ include file="../../includes/header.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/styles/courses_styles.css">
    <link rel="stylesheet" type="text/css" href="/resources/styles/courses_responsive.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
          rel="stylesheet">
          
          
<style>
.col-md-4 {
    color: black;
}<!-- 본문(Body) 글자색 지정-->


.home2 {
  width: 100%;
  height: 50vh;
}


</style>

<meta charset="UTF-8">
<title></title>
</head>
<body>
<div class="home2">
    <div class="home_background_container prlx_parent">
        <div class="home_background prlx2"
             style="background-image:url(/resources/images/courses_background.jpg)"></div>
    </div>
</div>



<!-- Popular -->
	<div class="popular page_section">
		<div class="container">
			<div class="row">
				<div class="col">
				<br><br><br><br>		
					<div class="section_title text-center">					
						<h1>예약 목록 조회</h1>
					</div>
				</div>
			</div>
		</div><!-- <div class="container"> -->
	</div><!-- <div class="popular page_section"> -->



<div class="jumbotron">
		
		<h3>${user.nickName} 님 예약 목록 </h3>
		 
	</div>

<table>
<thead>
<tr>
	<th>도서 사진</th>
	<th>도서명</th>
	<th>예약일</th>
	<th>반납일</th>
</tr>
</thead>
<tbody>
<c:forEach items="${myRsList}" var="myRs">
<td><img alt="도서이미지" src="${cart.photo}"  height="100"></td>
<td>${cart.c_title}</td>
<td><input type="date"> </td>
<td><input type="date"> </td>
</c:forEach>
</tbody>

</table>
<input type="hidden" id="user_id" value="${userId}">
<input type="hidden" id="cart_id" value="${cartId}">








<%@ include file="../../includes/footer.jsp" %>
</body>
</html>