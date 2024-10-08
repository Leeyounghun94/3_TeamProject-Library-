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
<title>나의 예약 정보</title>
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
						<h1>나의 예약 정보</h1>
					</div>
				</div>
			</div>
		</div><!-- <div class="container"> -->
	</div><!-- <div class="popular page_section"> -->



<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4">
			<form role="form">
						<div class="form-group">
						<label for="BookUser">예약자</label>
					<input type="text" class="form-control" id="" />
				</div>
				<div class="form-group">					 
					<label for="BookName">도서명</label>
					<input type="text" class="form-control" id="" />
				</div>
				<div class="form-group">					 
					<label for="BookWriter">저자</label>
					<input type="text" class="form-control" id="" />
				</div>
				<div class="form-group">					 
					<label for="BookPublisher">출판사</label>
					<input type="text" class="form-control" id="" />
				</div>
				<div class="form-group">					 
					<label for="BookPrice">가격</label>
					<input type="text" class="form-control" id="" />
				</div>
				<div class="form-group">					 
					<label for="RsStart-day">예약 날짜</label>
					<input type="text" class="form-control" id="" />
				</div>
				
				
			</form>
			<br>							
			<div class="find-btn" style="text-align: left; ">
			    <button type="button" class="btn btn-outline-warning btn find-btn1" onclick="location.href='/library/RsRemove'">취소하기</button>
			    <button type="button" class="btn btn-outline-warning btn find-btn1" onclick="location.href='/library/home'">메인화면으로 돌아가기</button>
			</div>
				
				
				<div class="col-md-4">
				</div>
			</div>
		</div>
	</div>
</div>
</div>







<%@ include file="../../includes/footer.jsp" %>
</body>
</html>