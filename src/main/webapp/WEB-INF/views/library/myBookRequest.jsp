<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <link rel="stylesheet" href="/resources/styles/myPage-style.css">

</head>
<body>
    <main style="padding-top:150px;">
        <jsp:include page="../includes/header.jsp" />

        <section class="myPage-content">
			
			<!-- 좌측 사이드바 -->
            <jsp:include page="../includes/myPageSide.jsp" />

            <section class="myPage-main">

                <h1 class="myPage-title">나의 도서 요청 목록</h1>
                <span class="myPage-subject">요청한 도서목록을 관리합니다.</span>
                
	            <!-- 목록이 출력될 칸 -->
				<div class="flex1" style="display: flex">
					<div class="flex" style="flex: 1 1 auto">
						<table id="list-wrap">
							<thead align="center"><!-- 분류 항목만 맨 위에 한줄 나오게끔 함 -->
								<tr>
									<th>첨부파일</th>
									<th>제목</th>
									<th>저자</th>
									<th>출판사</th>
									<th>카테고리</th>
									<th>등록날짜</th>
								</tr>
							</thead>
							<c:forEach items="${r_bookList}" var="RequestList">
								<tr>
									<td><c:out value="첨부파일" /></td>
									<td><c:out value="${RequestList.r_bookTitle}" /></td>
									<td><c:out value="${RequestList.r_bookAuthor}" /></td>
									<td><c:out value="${RequestList.r_bookCompany}" /></td>
									<td><c:out value="${RequestList.r_bookCategory}" /></td>
									<td><c:out value="${RequestList.r_bookRegdate}" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div> <!-- end 목록이 출력될 칸 -->
            </section><!-- end /.myPage-main  -->
        </section><!-- end /.myPage-content -->
    </main>
    <!-- 로그인 아이디 전달 2024 09 30 -->
					<input id='asd' type='hidden' name='r_bookUserId' value='<c:out value="${user.id}"/>'>

<jsp:include page="../includes/footer.jsp" />
    
</body>
<script type="text/javascript">
$(document).ready(function(){ /* 브라우저 시작 시 실행 */
		

		/*var userIdForm = $("#userIdForm"); // id가 userIdForm 인 값을 참조
		
		userIdSend(); // userIdSend 함수 실행
		
		function userIdSend(){
			operForm.attr("action", "/library/myBookRequest").submit();

			
		}// end userIdSend*/
		
	
});
</script>
</html>
