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
}
<!--본 페이지는~ ->글자사이즈 CSS -->
</style>

<meta charset="UTF-8">
<title>도서 예약하기</title>

</head>
<body>
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
						<h1>도서 예약 리스트</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="container"> -->
	</div>
	<!-- <div class="popular page_section"> -->


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
						본 페이지는 도서 예약 입니다.
					</div>
				</div>
				<br>

				<div class="fs-4 mb-3">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-star-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5M8.16 4.1a.178.178 0 0 0-.32 0l-.634 1.285a.18.18 0 0 1-.134.098l-1.42.206a.178.178 0 0 0-.098.303L6.58 6.993c.042.041.061.1.051.158L6.39 8.565a.178.178 0 0 0 .258.187l1.27-.668a.18.18 0 0 1 .165 0l1.27.668a.178.178 0 0 0 .257-.187L9.368 7.15a.18.18 0 0 1 .05-.158l1.028-1.001a.178.178 0 0 0-.098-.303l-1.42-.206a.18.18 0 0 1-.134-.098z"/>
</svg>
					해당 서비스는 로그인 통해 이용하실 수 있습니다.
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
					찾으시는 도서가 없는 경우 도서 요청 서비스를 이용하여 주시길 바랍니다.
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
					홈페이지에서 자료 검색 시 예약 가능 여부를 먼저 확인해 주시길 바라며, 원하는 도서를 검색한 후 예약 신청을 할 수
					있습니다.
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
					예약한 도서가 입고되면 예약 신청자의 이메일과 휴대폰으로 "예약 도서 입고 완료" 알림 발송
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
					파손, 손상의 우려가 있는 도서는 고객센터 또는 Q&A를 이용하여 주시길 바랍니다.
				</div>
				<div class="fs-4 mb-3">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bookmark-star-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5M8.16 4.1a.178.178 0 0 0-.32 0l-.634 1.285a.18.18 0 0 1-.134.098l-1.42.206a.178.178 0 0 0-.098.303L6.58 6.993c.042.041.061.1.051.158L6.39 8.565a.178.178 0 0 0 .258.187l1.27-.668a.18.18 0 0 1 .165 0l1.27.668a.178.178 0 0 0 .257-.187L9.368 7.15a.18.18 0 0 1 .05-.158l1.028-1.001a.178.178 0 0 0-.098-.303l-1.42-.206a.18.18 0 0 1-.134-.098z"/>
</svg>
					예약 내역 조회와 예약 취소는 마이페이지에서 확인할 수 있습니다.
				</div>
				<br>
				<br>




			<!--  검색 창 -->
				<div id="content">
					<div class="container">
						<div id="contents">
							<div id="bbs_search" style="margin: auto; text-align: center;">
								<form name="frm" method="post"
									action="/admin/rsv/rsvSelectList.do">
									<fieldset>
										<select name="searchCondition" id="ftext">
											<option value="0"
												<c:if test="${searchVO.searchCondition eq '0'}">selected = "selected" </c:if>>선택</option>
											<option value="1"
												<c:if test="${searchVO.searchCondition eq '1'}">sekected = "selected" </c:if>>도서명</option>
											<option value="2"
												<c:if test="${searchVO.searchCondition eq '2'}">sekected = "selected" </c:if>>저자</option>
											<option value="3"
												<c:if test="${searchVO.searchCondition eq '3'}">sekected = "selected" </c:if>>출판사</option>

										</select> <input name="searchKeyword"
											value="<c:out value = "${searchVO.searchKeyword}"/>"
											type="text" class="inp_s" id="inp_text" /> <span
											class="bbtn_s"><input type="submit" value="검색"
											title="검색" /> </span>
									</fieldset>
								</form>
							</div>

							<div id="bbs_wrap">
								<!-- 게시물 건수 -->
								<div class=total">
									총 게시물 <strong><c:out
											value="${paginationInfo.totalRecordCount}" /></strong>건 | 현재페이지<strong><c:out
											value="${paginationInfo.currentPageNo}" /></strong> /
									<c:out value="${paginationInfo.totalPageCount}" />
								</div>

								<!-- 테이블 -->
								<table class="table" style="margin: auto; text-align: center;">
									<thead>
										<tr>
											<th>도서명</th>
											<th>저자</th>
											<th>출판사</th>
											<th>가격</th>
											<th>예약</th>

										</tr>
									</thead>

									<c:forEach items="${list}" var="library">
										<tr>
											<td><c:out value="${library.r_bookName}"></c:out></td>
											<td><c:out value="${library.u_id}"></c:out></td>
											<td><c:out value="${library.r_bookPrice}"></c:out></td>
											<td><c:out value="${library.r_Phone}"></c:out></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${library.r_Start}" /></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd"
													value="${library.r_End}" /></td>
										</tr>
									</c:forEach>

								</table>
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
						<div style="text-align: right;">
							<a href="RsCreate" class="btn btn-outline-warning btn"
								type="button">예약하기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- Modal 추가 -> 요즘 트렌트는 alert 대신 modal을 쓴다 ! -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">알립니다.</h4>
			</div>
			<div class="modal-body">처리가 완료 되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary">저장</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->







<script type="text/javascript">
		/* 자바 스크립트   */
		$(document).ready(function() { // 문서의 준비단계에서 실행

			var result = '<c:out value="${result}"/>'; /* controller에서 flashAttribute를 통해 1회용으로 넘어오는 값  */

			checkModal(result);
			
			history.replaceState({}, null, null);
			
			function checkModal(result) {
												
				if (result == '' || history.state ) {
					retrun;
				}
				
				if (parseInt(result) > 0) {
					$(".modal-body").html(
							"예약" + parseInt(result) + " 이 등록 되었습니다.");
					
				}
				
				$("#myModal").modal("show");
			}
			
			$("#regBtn").on("click", function(){
				
				self.location ="/reservation/RsCreate";
			})
		});
	</script>

	<%@ include file="../../includes/footer.jsp"%>
</body>
</html>