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
	
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			
				<br>
			
			
				<div class="fs-4 mb-3">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-star-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5M8.16 4.1a.178.178 0 0 0-.32 0l-.634 1.285a.18.18 0 0 1-.134.098l-1.42.206a.178.178 0 0 0-.098.303L6.58 6.993c.042.041.061.1.051.158L6.39 8.565a.178.178 0 0 0 .258.187l1.27-.668a.18.18 0 0 1 .165 0l1.27.668a.178.178 0 0 0 .257-.187L9.368 7.15a.18.18 0 0 1 .05-.158l1.028-1.001a.178.178 0 0 0-.098-.303l-1.42-.206a.18.18 0 0 1-.134-.098z"/>
</svg>
					<strong>예약</strong>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-star-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5M8.16 4.1a.178.178 0 0 0-.32 0l-.634 1.285a.18.18 0 0 1-.134.098l-1.42.206a.178.178 0 0 0-.098.303L6.58 6.993c.042.041.061.1.051.158L6.39 8.565a.178.178 0 0 0 .258.187l1.27-.668a.18.18 0 0 1 .165 0l1.27.668a.178.178 0 0 0 .257-.187L9.368 7.15a.18.18 0 0 1 .05-.158l1.028-1.001a.178.178 0 0 0-.098-.303l-1.42-.206a.18.18 0 0 1-.134-.098z"/>
</svg>
				</div>
				
				

				
* 본인이 대여하려는 도서가 다른 회원이 대여 중일 경우, 예약하여 해당 도서 반납 시 우선 대여하는 서비스입니다.
<br>
* 예약하신 도서가 반납되면 입력되어 있는 회원정보를 토대로 대여 안내 SMS가 발송되며, <strong>공지 드린 해당 일까지 대여하지 않은 책은 예약이 자동 취소됩니다.</strong>
<br>
<strong>* SMS 통보 후 3일 이내에 대여를 하지 않을 경우 예약이 자동 취소됩니다.</strong>
<br>
* 예약 내역 조회와 예약 취소는 마이페이지에서 확인할 수 있습니다.
<br>
* 홈페이지에서 자료 검색 시 예약 가능 여부를 먼저 확인해 주시길 바라며, 원하는 도서를 검색한 후 예약 신청을 할 수 있습니다.
<br>
<br>


				<div class="fs-4 mb-3">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-star-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5M8.16 4.1a.178.178 0 0 0-.32 0l-.634 1.285a.18.18 0 0 1-.134.098l-1.42.206a.178.178 0 0 0-.098.303L6.58 6.993c.042.041.061.1.051.158L6.39 8.565a.178.178 0 0 0 .258.187l1.27-.668a.18.18 0 0 1 .165 0l1.27.668a.178.178 0 0 0 .257-.187L9.368 7.15a.18.18 0 0 1 .05-.158l1.028-1.001a.178.178 0 0 0-.098-.303l-1.42-.206a.18.18 0 0 1-.134-.098z"/>
</svg>
					<strong>예약방법</strong>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-star-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5M8.16 4.1a.178.178 0 0 0-.32 0l-.634 1.285a.18.18 0 0 1-.134.098l-1.42.206a.178.178 0 0 0-.098.303L6.58 6.993c.042.041.061.1.051.158L6.39 8.565a.178.178 0 0 0 .258.187l1.27-.668a.18.18 0 0 1 .165 0l1.27.668a.178.178 0 0 0 .257-.187L9.368 7.15a.18.18 0 0 1 .05-.158l1.028-1.001a.178.178 0 0 0-.098-.303l-1.42-.206a.18.18 0 0 1-.134-.098z"/>
</svg>
				</div>
				
				* 본인의 아이디와 패스워드로 <strong>Booklipse에 로그인 합니다.</strong>(회원이 아닌 경우 회원가입)
				<br>
				* 하단의 도서 목록 클릭 후 원하시는 도서를 선택합니다.
				<br>
				* 선택한 후 하단의 <strong>'장바구니 담기'</strong> 버튼을 클릭합니다.
				<br>
				* 장바구니에서 예약 하고자 하는 도서를 선택 후 예약 확정 누르면 예약이 완료 됩니다.
				<br>
					
				<br>
				<div class="fs-4 mb-3">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-bookmark-star"
						viewBox="0 0 16 16">
				  <path
							d="M7.84 4.1a.178.178 0 0 1 .32 0l.634 1.285a.18.18 0 0 0 .134.098l1.42.206c.145.021.204.2.098.303L9.42 6.993a.18.18 0 0 0-.051.158l.242 1.414a.178.178 0 0 1-.258.187l-1.27-.668a.18.18 0 0 0-.165 0l-1.27.668a.178.178 0 0 1-.257-.187l.242-1.414a.18.18 0 0 0-.05-.158l-1.03-1.001a.178.178 0 0 1 .098-.303l1.42-.206a.18.18 0 0 0 .134-.098z"></path>
				  <path
							d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z"></path>
				</svg>
					찾으시는 도서가 없는 경우 <strong>도서 요청 서비스</strong>를 이용하여 주시길 바랍니다.
				</div>
				
				
				<div class="fs-4 mb-3">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-bookmark-star"
						viewBox="0 0 16 16">
				  <path
							d="M7.84 4.1a.178.178 0 0 1 .32 0l.634 1.285a.18.18 0 0 0 .134.098l1.42.206c.145.021.204.2.098.303L9.42 6.993a.18.18 0 0 0-.051.158l.242 1.414a.178.178 0 0 1-.258.187l-1.27-.668a.18.18 0 0 0-.165 0l-1.27.668a.178.178 0 0 1-.257-.187l.242-1.414a.18.18 0 0 0-.05-.158l-1.03-1.001a.178.178 0 0 1 .098-.303l1.42-.206a.18.18 0 0 0 .134-.098z"></path>
				  <path
							d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z"></path>
				</svg>
					파손, 손상의 우려가 있는 도서는 <strong>고객센터</strong> 또는 <strong>Q&A</strong>를 이용하여 주시길 바랍니다.
				</div>
				
				<br>
				<br>
	
	
	
	

<div class="container">
			<div class="row">
				<div class="col">
				
	<div id="bookDetail" data-isbn13="${bookDetail.isbn13}">				
	<!-- 도서 예약  -->	
	<div class="col-md-5" style="border:1px solid white; float:left; margin-right:100px;">
					<img class="card-img-top" src="/resources/images/Book.png" alt="https://unsplash.com/@kellybrito">
                       <div class="section_title text-center">                         
                            <div class="featurs-content text-center" style="border:1px gray; color:gray;">
                            
						<button type="button" class="btn btn-outline-warning btn" onclick="window.location.href='/library/booklist'">도서 목록</button>	
                            </div>
                        </div>
                    </div><!-- 도서 예약/대출 end -->
       </div>             
                   
                                  
                       
	<div class="col-md-5" style="border:1px solid white; float:left;">
					<img class="card-img-top" src="/resources/images/cart.png" alt="https://unsplash.com/@kellybrito">					
                        <div class="section_title text-center">                          
                            <div class="featurs-content text-center">
                                
                                <a data-toggle="modal" data-target="#myModal" href="#myModal" onclick="window.location.href='/library/reservation/RsUpdate'"><h1>예약한 목록 조회</h1></a>
                            </div>
                        </div>
                    </div>
		
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
	</div>
	</div>
	</div>
		
		
		
		
		
		


<script type="text/javascript">






</script>			
					
<%@ include file="../../includes/footer.jsp" %>
</body>
</html>