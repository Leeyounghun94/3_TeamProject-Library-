<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL 코어 태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <!-- JSTL 포매팅 태그 -->
<%@ include file="../../includes/header.jsp" %>   
<!DOCTYPE html>
<html>

<style>

.home2 {
  width: 100%;
  height: 50vh;
}

</style>

<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/styles/courses_styles.css">
    <link rel="stylesheet" type="text/css" href="/resources/styles/courses_responsive.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
          rel="stylesheet">
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
						<h1>예약</h1>
					</div>
				</div>
			</div>
		</div><!-- <div class="container"> -->
	</div><!-- <div class="popular page_section"> -->
	
	

<div class="container">
			<div class="row">
				<div class="col">
				
					
	<!-- 도서 예약  -->	
	<div class="col-md-5" style="border:1px solid white; float:left; margin-right:100px;">
					<img class="card-img-top" src="/resources/images/Book.png" alt="https://unsplash.com/@kellybrito">
                       <div class="section_title text-center">                         
                            <div class="featurs-content text-center" style="border:1px gray; color:gray;">
                               <a href="#" onclick="location.href='BookReservation'"><h1>도서 예약/대여</h1></a>
                            </div>
                        </div>
                    </div><!-- 도서 예약/대출 end -->
                    
                    
      <!--  열람실 예약 -->                                
	<div class="col-md-5" style="border:1px solid white; float:left;">
					<img class="card-img-top" src="/resources/images/Study.png" alt="https://unsplash.com/@kellybrito">					
                        <div class="section_title text-center">                          
                            <div class="featurs-content text-center">
                                
                                <a href="#" onclick="location.href='StudyReservation'"><h1>열람실 예약</h1></a>
                            </div>
                        </div>
                    </div><!-- 열람실 예약 end -->
		
		</div>
			</div>
		</div>
		
<div class="container">
			<div class="row">
				<div class="col">		
		
		</div>
			</div>
		</div>			
		
<div class="container">
			<div class="row">
				<div class="col">
				
				<div class="col-lg-4 course_box" style="width:500px; height:500px; border:1px solid white; float:left; margin-right:50px;">
					<div class="card">
						
					</div>
				</div>
				
			
				
				</div>
			</div>
		</div>		
					
<%@ include file="../../includes/footer.jsp" %>
</body>
</html>