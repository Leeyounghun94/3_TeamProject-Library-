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
 
  .news_page_nav{
  padding-left : 1150px;
  padding-bottom : 50px;
 }
 
 
</style>

<body>

    <main style="padding-top:150px;">

        <section class="myPage-content">
			
			<!-- 좌측 사이드바 -->
            <jsp:include page="../includes/myPageSide.jsp" />

            <section class="myPage-main">

                <h1 class="myPage-title">유저 포인트 목록</h1>
                <span class="myPage-subject">유저들의 포인트 목록을 관리합니다.</span>
                
	            <!-- 목록이 출력될 칸 -->
				<div class="flex1" style="display: flex">
					<div class="flex" style="flex: 1 1 auto">
						<table class="table_container">
							<thead align="center"><!-- 분류 항목만 맨 위에 한줄 나오게끔 함 -->
								<tr>
									<th style="width:15%">번호</th>
									<th style="width:50%">내역</th>
									<th style="width:25%">포인트</th>
									<th style="width:25%">합계</th>
									<th style="width:30%">날짜</th>
									<th style="width:15%">아이디</th>
									<th style="width:10%"></th>
								</tr>
							</thead>
							<c:forEach items="${bookPointList}" var="Ad_bookPointList">
								<tr align="center" style="flex: 1 1 auto">
									<td><c:out value="${Ad_bookPointList.bookPointNo}"/></td>
									<td><c:out value="${Ad_bookPointList.bookPointHistory}" /></td>
									<td><c:out value="${Ad_bookPointList.bookPoint}" /></td>
									<td><c:out value="${Ad_bookPointList.bookPointTotal}" /></td>
									<td><c:out value="${Ad_bookPointList.bookPointDate}" /></td>
									<td><c:out value="${Ad_bookPointList.bookPointUserId}" /></td>
									<td class='withDraw'>회수</td>
									<td><input type='hidden' class="rnoPoint" value="${Ad_bookPointList.bookPointNo}"></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div> <!-- end 목록이 출력될 칸 -->
            </section><!-- end /.myPage-main  -->
        </section><!-- end /.myPage-content -->
                        <!-- 페이징 버튼 관련 -->
				<div class='news_page_nav'>
				<label>페이징 버튼</label>
					<ul class="pagination" style="align-items:center;">
						 <c:if test="${pageMaker.prev}">
							<li class="paginate_button previous text-center"><a href="${pageMaker.startPage -1}">이전</a></li>
						</c:if> 
						<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<li class="paginate_button text-center ${pageMaker.cri.pageNum == num ? 'active':''} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>
						 <c:if test="${pageMaker.next}">
							<li class="paginate_button next text-center"><a href="${pageMaker.endPage +1 }">다음</a></li>
						</c:if> 
					</ul>
					
				</div>
				
				<!--  end Pagination -->
    </main>
    <!-- 로그인 아이디 전달 2024 09 30 -->
			</div>
			<!-- endpanel-heading -->    
			<!-- 페이지 번호 클릭시 함께 전달 되는 데이터 -->
			<form id='actionForm' action="/library/adminBookPoint" method='get'><!-- Jstl  -->
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			</form>
					
    
    
					
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
				<label>번호</label> <input class="form-control" name='bookPointNo' value='<c:out value="${Ad_bookPointList.bookPointNo}"/>' >
			</div>
			<div class="form-group">
				<label>내역</label> <input class="form-control" name='bookPointHistory' value='<c:out value="${Ad_bookPointList.bookPointHistory}"/>' >
			</div>
			<div class="form-group">
				<label>지급 포인트</label> <input class="bookPointVal" name='bookPoint' value='<c:out value="${Ad_bookPointList.bookPoint}"/>' >
			</div>
			<div class="form-group">
				<label>날짜</label> <input class="form-control" name='bookPointDate' value='<c:out value="${Ad_bookPointList.bookPointDate}"/>' >
			</div>
	
			<div class="form-group">
				<label>아이디</label> <input class="form-control" name='bookPointUserId' value='<c:out value="${Ad_bookPointList.bookPointUserId}"/>'>
			</div>
				<input type='hidden' class="rnoPoint">
			</div><!-- end 모달창 내부 -->
			<!-- end modal body 2024 09 29 -->
			
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">회수</button>
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
<script type="text/javascript" src="/resources/js/bookPoint.js"></script> <!-- 외부파일 include - reply.js -->
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
	$(".withDraw").on("click", function(e){
		
		// 클릭한 요소의 부모 트를 찾아 해당 책의 정보를 가져옴
		var $row = $(this).closest("tr"); 

		// 행에서 필요한 데이터를 추출
		var bookPointNo = $row.find("td:eq(0)").text();
		var bookPointHistory = $row.find("td:eq(1)").text();
		var bookPoint = $row.find("td:eq(2)").text(); 
		var bookPointDate = $row.find("td:eq(4)").text();
		var bookPointUserId = $row.find("td:eq(5)").text();

		var rnoPoint = $row.find(".rnoPoint").val(); // 요청 도서 번호

		console.log("bookTitle 값 : "+ bookPointNo);
		console.log("bookAuthor 값 : "+ bookPointHistory);
		console.log("bookUserId 값 : "+ bookPoint);
		console.log("bookCompany 값 : "+ bookPointDate);
		console.log("bookPointUserId 값 : "+ bookPointUserId);

		// 모달 창 내부에 데이터 채워 넣기
		$('input[name="bookPointNo"]').val(bookPointNo);
		$('input[name="bookPointHistory"]').val(bookPointHistory);
		$('input[name="bookPoint"]').val(bookPoint);
		$('input[name="bookPointDate"]').val(bookPointDate);
		$('input[name="bookPointUserId"]').val(bookPointUserId);

		$('.rnoPoint').val(rnoPoint);
		
		
		// 수정/삭제 버튼 활성화
		$('#modalModBtn').show();
		
		$('#modalRemoveBtn').show();

		// 모달 창 열기
		$("#myModal").modal("show");

	}); // end 수정/삭제 버튼 클릭 시 모달 창 띄우기
	
	modalModBtn.on("click", function(e) { // 수정버튼 클릭
	    e.preventDefault(); // 기본 동작 방지 (GET 요청 방지)

	    const bookPointUpdate = {
	    		PointRno: $('.rnoPoint').val(),
	    		//bookPointNo: $('input[name="bookPointNo"]').val(),
	    		//bookPointHistory: $('input[name="bookPointHistory"]').val(),
	    		bookPoint: $('.bookPointVal').val(),
	    		//bookPointDate: $('input[name="bookPointDate"]').val(),
	    		bookPointUserId: $('input[name="bookPointUserId"]').val()
	        };
		
	        console.log(bookPointUpdate); // 디버깅용
		
		// bookRequest.js의 update 함수 실행
		boardPointService.updatePoint(bookPointUpdate, function(result) {  

			alert(result); // 서버로부터의 응답 결과를 표시
			modal.modal("hide"); // 모달 창 닫기
			showList(pageNum); // 페이지 목록을 갱신하는 함수 호출

		});

	});  // end 수정버튼 클릭

	 /*modalRemoveBtn.on("click", function(e) { // 삭제 버튼 클릭
		
		var rnoPoint = $('.rnoPoint').val(); // 모달창에서 가져온 도서 번호
		
		var bookRequestBno = { // bookRequest 변수에 모달창에 있는 값들을 넣어줌
				rnoPoint : rnoPoint
			}; // end var bookRequest
			

			boardPointService.removePoint(bookRequestBno, function(result) { //  오타나 겹치는 id, name 이 있을 경우 is not a function이 뜸

			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});

	});// end modalRemoveBtn (삭제 버튼 종료 */
	
	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click",	function(e) {

				e.preventDefault();

				console.log('click');

				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			}); // 페이지 버튼
			
	
});


</script>
</html>

<jsp:include page="../includes/footer.jsp" />