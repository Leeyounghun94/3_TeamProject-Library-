<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" href="/resources/styles/myPage-style.css">

</head>
<style>

.editDel{
 cursor: pointer; 
 }
 
 .table_container{
  width: 800px; /* 크기는 임의 설정 */
  height: 200px;
  display: table; /* 오늘의 주인공 */
  table-layout: fixed; /* 자식 태그의 크기 고정 */
 }
 
</style>

<body>

    <main style="padding-top:150px;">

        <section class="myPage-content">
			
			<!-- 좌측 사이드바 -->
            <jsp:include page="../includes/myPageSide.jsp" />

            <section class="myPage-main">

                <h1 class="myPage-title">나의 도서 요청 목록</h1>
                <span class="myPage-subject">요청한 도서목록을 관리합니다.</span>
                
	            <!-- 목록이 출력될 칸 -->
				<div class="flex1" style="display: flex">
					<div class="flex" style="flex: 1 1 auto">
						<table class="table_container">
							<thead align="center"><!-- 분류 항목만 맨 위에 한줄 나오게끔 함 -->
								<tr>
									<th style="width:15%">요청번호</th>
									<th style="width:15%">요청상태</th>
									<th style="width:25%">제목</th>
									<th style="width:25%">저자</th>
									<th style="width:30%">출판사</th>
									<th style="width:30%">카테고리</th>
									<th style="width:20%">등록날짜</th>
									<th style="width:20%">요청자</th>
									<th style="width:20%">비고</th>
									<th style="width:15%"></th>
								</tr>
							</thead>
							<c:forEach items="${r_bookList}" var="RequestList">
								<tr align="center" style="flex: 1 1 auto">
									<td><c:out value="${RequestList.r_bookBno}"/></td>
									<td><c:out value="${RequestList.r_bookProcedure}" /></td>
									<td><c:out value="${RequestList.r_bookTitle}" /></td>
									<td><c:out value="${RequestList.r_bookAuthor}" /></td>
									<td><c:out value="${RequestList.r_bookCompany}" /></td>
									<td><c:out value="${RequestList.r_bookCategory}" /></td>
									<td><c:out value="${RequestList.r_bookRegdate}" /></td>
									<td><c:out value="${RequestList.r_bookUserId}" /></td>
									<td><c:out value="${RequestList.r_bookResultMsg}" /></td>
									<td class='editDel'>수정/삭제</td>
									<td><input type='hidden' class="bookBno" value="${RequestList.r_bookBno}"></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div> <!-- end 목록이 출력될 칸 -->
            </section><!-- end /.myPage-main  -->
        </section><!-- end /.myPage-content -->
    </main>
    <!-- 로그인 아이디 전달 2024 09 30 -->
					
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">창닫기</h4>
			</div>
			
			<div class="modal-body"><!-- 모달창 내부 -->
			<label class="input-group-text" for="inputGroupSelect01">도서요청 진행 현황</label>
			<div class="form-group">
				<label>요청자 번호</label> <input class="form-control" name='r_bookBno' value='<c:out value="${RequestList.r_bookBno}"/>' >
			</div>
			<div class="form-group">
				<label>요청자</label> <input class="form-control" name='r_bookUserId' value='<c:out value="${RequestList.r_bookUserId}"/>' >
			</div>
			<div class="form-group">
				<label>희망도서 제목</label> <input class="form-control" name='r_bookTitle' value='<c:out value="${RequestList.r_bookTitle}"/>' >
			</div>
			<div class="form-group">
				<label>희망도서 저자</label> <input class="form-control" name='r_bookAuthor' value='<c:out value="${RequestList.r_bookAuthor}"/>' >
			</div>
	
			<div class="form-group">
				<label>희망도서 출판사</label> <input class="form-control" name='r_bookCompany' value='<c:out value="${RequestList.r_bookCompany}"/>'>
			</div>
			<!-- 댓글 작성자 아이디 입력 2024 09 29 -->
			<div class="form-group">
				<label>희망도서 카테고리</label> <input class="form-control" name='r_bookCategory' value='<c:out value="${RequestList.r_bookCategory}"/>' >
			</div>
			<label>희망도서 요청상태</label>
  			<select class="form-select" name="r_bookProcedure" >
				<option value="입고중" selected>입고중</option>
    			<option value="완료">완료</option>
    			<option value="지연">지연</option>
    			<option value="반려">반려</option>
  			</select>
  				<div class="form-group">
					<label>메시지 전달</label> <input class="r_bookResultMsg" name='r_bookResultMsg' />
				</div>
				<input type='hidden' class="rno">
			</div><!-- end 모달창 내부 -->
			<!-- end modal body 2024 09 29 -->
			
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
				<!-- <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button> -->
				<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
    
</body>
<script type="text/javascript" src="/resources/js/bookRequest.js"></script> <!-- 외부파일 include - reply.js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 제이쿼리 임포트 -->

<script type="text/javascript">

$(document).ready(function(){ 
	
	
	var modal = $(".modal"); // 모달창 정의 
	var modalModBtn = $("#modalModBtn"); // 모달 수정 버튼
	var modalRemoveBtn = $("#modalRemoveBtn"); // 모달 삭제 버튼
	
	// 모달창 닫기 버튼
	$("#modalCloseBtn").on("click", function(e) {

		modal.modal('hide');
	});
	
	// 수정/삭제 버튼 클릭 시 모달 창 띄우기
	$(".editDel").on("click", function(e){
		// 클릭한 요소의 부모 트를 찾아 해당 책의 정보를 가져옴
		var $row = $(this).closest("tr"); 
		
		// 행에서 필요한 데이터를 추출
		var bookBno = $row.find("td:eq(1)").text();
		var bookProcedure = $row.find("td:eq(8)").text(); // 요청도서 진행 상태
		var bookTitle = $row.find("td:eq(2)").text(); // 요청 도서 제목
		var bookAuthor = $row.find("td:eq(3)").text(); // 요청 도서 저자
		var bookCompany = $row.find("td:eq(4)").text(); // 요청 도서 출판사
		var bookCategory = $row.find("td:eq(5)").text(); // 요청 도서 카테고리
		var bookRegDate = $row.find("td:eq(6)").text();	
		var bookUserId = $row.find("td:eq(7)").text(); // 요청 도서 현 상황(진행중, 성공 이런거)
		var bookResultMsg = $row.find("td:eq(9)").text();	


		

		var bookBno = $row.find(".bookBno").val(); // 요청 도서 번호

		
		console.log("bookTitle 값 : "+ bookTitle);
		console.log("bookAuthor 값 : "+ bookAuthor);
		console.log("bookUserId 값 : "+ bookUserId);
		console.log("bookCompany 값 : "+ bookCompany);
		console.log("bookCategory 값 : "+ bookCategory);
		console.log("bookProcedure 값 : "+ bookProcedure);
		console.log("bookResultMsg 값 : "+ bookResultMsg);
		console.log("bookRegDate 값 : "+ bookRegDate);
		
		// 모달 창 내부에 데이터 채워 넣기
		$('input[name="r_bookBno"]').val(bookBno);
		$('input[name="r_bookProcedure"]').val(bookProcedure);
		$('input[name="r_bookTitle"]').val(bookTitle);
		$('input[name="r_bookAuthor"]').val(bookAuthor);
		$('input[name="r_bookCompany"]').val(bookCompany);
		$('input[name="r_bookCategory"]').val(bookCategory);
		//regdate 는 sysdate
		$('input[name="r_bookUserId"]').val(bookUserId);
		$('input[name="r_bookResultMsg"]').val(bookProcedure);
		
		$('.rno').val(bookBno);

		// 수정/삭제 버튼 활성화
		$('#modalModBtn').show();
		$('#modalRemoveBtn').show();

		// 모달 창 열기
		$("#myModal").modal("show");

	}); // end 수정/삭제 버튼 클릭 시 모달 창 띄우기
	
	modalModBtn.on("click", function(e) { // 수정버튼 클릭
	    e.preventDefault(); // 기본 동작 방지 (GET 요청 방지)

	    const bookRequest = {
	            r_bookBno: $('.rno').val(),
	            r_bookTitle: $('input[name="r_bookTitle"]').val(),
	            r_bookAuthor: $('input[name="r_bookAuthor"]').val(),
	            r_bookCompany: $('input[name="r_bookCompany"]').val(),
	            r_bookCategory: $('input[name="r_bookCategory"]').val(),
	            r_bookProcedure: $('select[name="r_bookProcedure"]').val(),
	            r_bookResultMsg: $('input[name="r_bookResultMsg"]').val()
	        };

	        console.log(bookRequest); // 디버깅용
		
		// bookRequest.js의 update 함수 실행
		boardService.update(bookRequest, function(result) {  

			alert(result); // 서버로부터의 응답 결과를 표시
			modal.modal("hide"); // 모달 창 닫기
			showList(pageNum); // 페이지 목록을 갱신하는 함수 호출

		});

	});  // end 수정버튼 클릭

	modalRemoveBtn.on("click", function(e) { // 삭제 버튼 클릭

		var bookBno = $('.rno').val(); // 모달창에서 가져온 도서 번호
		
		var bookRequestBno = { // bookRequest 변수에 모달창에 있는 값들을 넣어줌
				r_bookBno : bookBno
			}; // end var bookRequest
			

		boardService.remove(bookRequestBno, function(result) { //  오타나 겹치는 id, name 이 있을 경우 is not a function이 뜸

			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});

	});// end modalRemoveBtn (삭제 버튼 종료)
	
});


</script>
</html>

<jsp:include page="../includes/footer.jsp" />