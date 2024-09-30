<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL 코어 태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- JSTL 포매팅 태그 -->
<%@ include file="../../includes/header.jsp"%>
<!DOCTYPE html>
<html>


<style>
.pagination {
	display: -ms-flexbox;
	display: flex;
	padding-left: 0;
	list-style: none;
	border-radius: .25rem;
	justify-content: center;
}

.fs-2 {
	font-size: calc(1.325rem + .75vw) !important;
}<!--본 페이지는~ ->글자사이즈 CSS -->


.col-md-12 {
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 100%;
    color: black;
}<!-- 본문(Body) 글자색 지정-->


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
						<h1>도서 예약/대여</h1>
					</div>
				</div>
			</div>
		</div><!-- <div class="container"> -->
	</div><!-- <div class="popular page_section"> -->


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">

					<div class="fs-2 mb-3">
						<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
							fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
  						<path
								d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783"></path>
					</svg>
						본 페이지는 도서 예약/대여 입니다.
					</div>
				</div>
				<br>
			
			
				<div class="fs-4 mb-3">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-star-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5M8.16 4.1a.178.178 0 0 0-.32 0l-.634 1.285a.18.18 0 0 1-.134.098l-1.42.206a.178.178 0 0 0-.098.303L6.58 6.993c.042.041.061.1.051.158L6.39 8.565a.178.178 0 0 0 .258.187l1.27-.668a.18.18 0 0 1 .165 0l1.27.668a.178.178 0 0 0 .257-.187L9.368 7.15a.18.18 0 0 1 .05-.158l1.028-1.001a.178.178 0 0 0-.098-.303l-1.42-.206a.18.18 0 0 1-.134-.098z"/>
</svg>
					<strong>예약/대여 안내</strong>
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
				* 예약하고자 하는 도서를 검색하거나 도서 목록 페이지에서 도서를 선택합니다.
				<br>
				* 선택한 후 하단의 <strong>'신청하기'</strong> 버튼을 클릭합니다.
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

	
	
		



			<!--  검색 창 -->
				<div id="content">
					<div class="container">
						<div id="contents">
							<div class="position-static" style="z-index: 1030;">
        <nav class="navbar navbar-light bg-light">
        
                     
            <form class="form-inline mt-1 mb-1" onsubmit="handleFormSubmit(event)" style="margin: auto; text-align: center;">
                <button id="toggleButton" type="button"
                        class="btn btn-outline-danger mr-2 my-sm-2 toggle-mode"
                        onclick="toggleFunction()"
                        data-toggle="tooltip" data-placement="top" title="검색모드로 전환합니다.">페이지 이동
                </button>

                <input id="searchInput" class="form-control search-mode mr-sm-2" type="search"
                       placeholder="제목 간편검색"
                       aria-label="Search" required>
                <div id="autocompleteList" class="autocomplete-items"></div>

                <button id="toggleButton2" class="btn btn-outline-success my-2 my-sm-0 toggle-mode"
                        type="submit"
                        data-toggle="tooltip" data-placement="bottom"
                        title="검색을 시작합니다.">검색
                </button>

            </form>
            <div class="view-container">
                <div class="tabs">
                    <input type="radio" id="radio-1" name="tabs" value="list" checked="">
                    <label class="tab" for="radio-1"><i class="bi bi-list-ul"></i></label>
                    <input type="radio" id="radio-2" name="tabs">
                    <label class="tab" for="radio-2"><i class="bi bi-grid"></i></label>
                    <span class="glider"></span>
                </div>          
            </div>
        </nav>
        <div class="collapse navbar-collapse" id="navbarToggle">
            <div class="bg-light p-5" style="min-height: 300px">
                <div class="btn-group" role="group">
                    <button id="dropdownMenuButton" type="button"
                            class="btn btn-secondary dropdown-toggle"
                            data-toggle="dropdown" aria-expanded="false">
                        카테고리
                    </button>
                    <ul id="categoryDropdownContainer" class="dropdown-menu">
                    </ul>
                    <div id="subMenuWrapper">
                    </div>
                </div>
                <!-- 고급 검색 버튼 -->
                <button class="btn btn-primary" data-toggle="modal" data-target="#modal1">고급 검색
                </button>
                <div class="btn-group">
                    <!-- 드롭다운 버튼 -->
                    <button type="button" class="btn btn-info dropdown-toggle"
                            id="itemsPerPageButton" data-toggle="dropdown" aria-expanded="false">
                    </button>
                    <!-- 드롭다운 메뉴 -->
                    <ul class="dropdown-menu" id="itemsPerPageMenu">
                        <li class="dropdown-item2" style="cursor: pointer;"
                            data-value="10"></li>
                        <li class="dropdown-item2" style="cursor: pointer;"
                            data-value="20"></li>
                        <li class="dropdown-item2" style="cursor: pointer;"
                            data-value="50"></li>
                    </ul>
                </div>

                <!-- 모달 창 -->
                <div class="modal fade" id="modal1" tabindex="-1" role="dialog"
                     aria-labelledby="advancedSearchLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="advancedSearchLabel">고급 검색은 추후 업데이트 됩니다.</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="advancedSearchForm">
                                    <!-- 검색어 입력 -->
                                    <div class="form-group">
                                        <label for="keyword">검색어</label>
                                        <input type="text" class="form-control" id="keyword"
                                               name="keyword">
                                    </div>
                                    <!-- 검색 기준 -->
                                    <div class="form-group">
                                        <label for="searchType">검색 기준</label>
                                        <select class="form-control" id="searchType" name="type">
                                            <option value="title">책 제목</option>
                                            <option value="author">저자</option>
                                            <option value="publisher">출판사</option>
                                        </select>
                                    </div>
                                    <!-- 가격 범위 (일반 텍스트 박스) -->
                                    <div class="form-group">
                                        <label for="minPrice">최소 가격</label>
                                        <input type="text" class="form-control" id="minPrice"
                                               name="minPrice"
                                               placeholder="최소 가격">
                                    </div>
                                    <div class="form-group">
                                        <label for="maxPrice">최대 가격</label>
                                        <input type="text" class="form-control" id="maxPrice"
                                               name="maxPrice"
                                               placeholder="최대 가격">
                                    </div>
                                    <!-- 출판일 범위 -->
                                    <div class="form-group">
                                        <label for="publicationDateRange">출판일 범위</label>
                                        <select class="form-control" id="publicationDateRange"
                                                name="publicationDateRange">
                                            <option value="">전체</option>
                                            <option value="3months">최근 3개월</option>
                                            <option value="6months">최근 6개월</option>
                                            <option value="1year">최근 1년</option>
                                        </select>
                                    </div>
                                    <!-- 최소 평점 (라디오 버튼) -->
                                    <div class="form-group">
                                        <label>최소 평균 리뷰점수</label><br>
                                        <div>
                                            <label><input type="radio" name="minRating" value="1"> 1</label>
                                            <label><input type="radio" name="minRating" value="2"> 2</label>
                                            <label><input type="radio" name="minRating" value="3"> 3</label>
                                            <label><input type="radio" name="minRating" value="4"> 4</label>
                                            <label><input type="radio" name="minRating" value="5"> 5</label>
                                        </div>
                                    </div>
                                    <!-- 대여 가능 여부 -->
                                    <div class="form-group">
                                        <label for="rentalAvailable">대여 가능 여부</label>
                                        <input type="checkbox" id="rentalAvailable"
                                               name="rentalAvailable" value="Y">
                                    </div>
                                    <!-- 구매 가능 여부 -->
                                    <div class="form-group">
                                        <label for="purchaseAvailable">구매 가능 여부</label>
                                        <input type="checkbox" id="purchaseAvailable"
                                               name="purchaseAvailable"
                                               value="Y">
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">닫기
                                </button>
                                <button type="button" class="btn btn-primary"
                                        id="executeAdvancedSearch">검색
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

							<div id="bbs_wrap">
								<!-- 게시물 건수 -->
								<div class=total">
									(ex) 총 게시물 <strong><c:out
											value="${paginationInfo.totalRecordCount}" /></strong>800건 | 현재페이지<strong><c:out
											value="${paginationInfo.currentPageNo}" /></strong> 1
									<c:out value="${paginationInfo.totalPageCount}" />
								</div>



								<!-- 테이블(BookList) -->
								<table class="table" style="margin: auto; text-align: center;">
									<thead>
										<tr>
											
											<th>isbn13</th>
											<th>도서 사진</th>
											<th>도서명</th>
											<th>저자</th>
											<th>출판사</th>
											<th>가격</th>
											<th>자세히</th>
										
										</tr>
									</thead>
									
									<c:forEach  items="${bookList}" var="vo">
										
										<tr>											
											<td>${vo.isbn13}</td>
											<td><img src="${vo.photo}" alt="" style="max-height: 300px"></td>											
											<td>${vo.book}</td>
										 	<td>${vo.author}</td>
										 	<td>${vo.publisher}</td>
										 	<td>${vo.price}</td>										 									 	
										 	<td><button type="button" class="btn btn-outline-warning btn" onclick="window.location.href='/library/read/${vo.isbn13}'">상세보기</button>	
										
										</tr>
									
									</c:forEach>

								</table><!-- 테이블 종료 -->
								<br>
								<div>
									<nav class="pagination-sm"">
										<ul class="pagination">
											<li class="page-item"><a class="page-link" href="#">이전</a>
											</li>
											<li class="page-item"><a class="page-link" href="#">1</a>
											<li class="page-item"><a class="page-link" href="#">다음</a>
											</li>
										</ul>
									</nav>
								</div>
								<br>


							</div>
						</div>
					
					</div>
				</div>
			</div>
		</div>
	</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!-- JQuery 사용 -->

<script type="text/javascript">
	
$(document).ready(function() {
	
var loginSessionUserId = '<%=session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>'; // 세션의 유저 ID

if(!loginSessionUserId || loginSessionUserId.trim() === ""){
	alert("로그인후");
	return false;
}else{
	self.location = "/library/home";

}

});		
		
</script>
	<%@ include file="../../includes/footer.jsp"%>
</body>
</html>