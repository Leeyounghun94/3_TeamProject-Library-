<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL 코어 태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <!-- JSTL 포매팅 태그 -->
<%@ include file="../../includes/header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<h1>장바구니</h1>
					</div>
				</div>
			</div>
		</div><!-- <div class="container"> -->
	</div><!-- <div class="popular page_section"> -->



	<div class="jumbotron">
		<h1>${userId}님 주문목록</h1>
	</div>


<table class="table text-center table-hover container">
		<thead>
			<tr>
				<th>ISBN13</th>
				<th>도서명</th>
				<th>도서 사진</th>
				<th>도서 가격</th>
				<th>총 가격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="str" items="${myOrders}">
				<tr>

					<input type="hidden" name="bookSeq" value="${str.bookSeq}">
					<input type="hidden" name="orderSerialNum"
						value="${str.orderSerialNum}">
					<td>${str.bookTitle}</td>
					<td>${str.bookOrderCnt}</td>

					<td>${str.bookOrderCntPrice}</td>
					<td>${str.orderPaymentStatus}</td>
				</tr>

				<c:set var="total" value="${total + str.bookOrderCntPrice}" />

			</c:forEach>

		</tbody>
	</table>















<script>
            // 서버와 비동기로 예약 확정 요청을 보내는 함수
            function confirmReservation(userId) {
                $.ajax({
                    url: "/confirmReservation", // 일반 Controller URL
                    type: "POST",
                    data: { user_id: userId },
                    success: function(response) {
                        // 서버로부터 응답이 성공적으로 왔을 때 실행
                        if (response.success) {
                            successMessage(); // 성공 시 successMessage() 호출
                        } else {
                            alert(response.message); // 실패 시 오류 메시지 출력
                        }
                    },
                    error: function() {
                        alert("서버와의 통신 오류가 발생했습니다.");
                    }
                });
            }
        
            // 예약 성공 시 알림을 띄우는 함수
            function successMessage() {
                alert("예약이 완료되었습니다");
            }
        </script>
        
        <!-- 버튼 클릭 시 confirmReservation 함수 호출 -->
        <button onclick="confirmReservation('${user_id}')">예약 확정</button>
        
        
<%@ include file="../../includes/footer.jsp" %>
</body>
</html>