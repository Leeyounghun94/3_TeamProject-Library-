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

                <h1 class="myPage-title">나의 포인트 내역</h1>
                <span class="myPage-subject">나의 포인트 내역을 조회 합니다.</span>
                
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
								</tr>
							</thead>
							<c:forEach items="${bookPointList}" var="bookPointList">
								<tr align="center" style="flex: 1 1 auto">
									<td><c:out value="${bookPointList.bookPointNo}"/></td>
									<td><c:out value="${bookPointList.bookPointHistory}" /></td>
									<td><c:out value="${bookPointList.bookPoint}" /></td>
									<td><c:out value="${bookPointList.bookPointTotal}" /></td>
									<td><c:out value="${bookPointList.bookPointDate}" /></td>
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
			<form id='actionForm' action="/library/myPagePoint" method='get'><!-- Jstl  -->
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			</form>
					
    
</body>
<script type="text/javascript" src="/resources/js/bookRequest.js"></script> <!-- 외부파일 include - reply.js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 제이쿼리 임포트 -->

<script type="text/javascript">

$(document).ready(function(){ 
	
	
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