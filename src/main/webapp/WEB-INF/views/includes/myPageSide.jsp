<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<!DOCTYPE html><html><head><meta charset="UTF-8">
<style>
	/* 사이드메뉴 */
.left-side{
    width: 25%;
    border-right: 2px solid #ddd;
}

.list-group{
    width: 100%;
    list-style: none;
    padding-right: 20px;
}

.list-group > li{
    height: 50px;
    font-size: 18px;
}

.list-group > li > a{
    color:black;
    text-decoration: none;

    display: flex;
    height: 100%;

    justify-content: center;
    align-items: center;

    border-bottom : 2px solid #ddd;
}

.list-group > li > a:hover{
    background-color: #ccc;
}
</style>
</head>
<body>
<section class="left-side">
    사이드메뉴

    <ul class="list-group">
        
        	<li> <a href="/library/myPage/updateForm">내 정보 수정</a> </li>
        
        	<li> <a href="/myPage/myReservation">내 예약 관리</a></li>
        
        	<li> <a href="/myPage/myList">내가 쓴 글</a></li>
        
        	<li> <a href="/myPage/changePw">비밀번호 변경</a> </li>
        
        	<li> <a href="/library/myBookRequest">나의 도서 요청 목록</a></li> <!-- 2024 10 01 도서요청 메뉴 추가 -->
        	
        	<li> <a href="/library/myPagePoint">나의 포인트 목록</a></li> <!-- 2024 10 01 포인트 메뉴 추가 -->
        
        	<li> <a href="/myPage/secession">회원 탈퇴</a> </li>
        
       	<c:if test="${user.authority == 1 }">
			<li> <a href="/library/adminBookRequest">회원 요청 도서 목록 관리</a> </li>
			<li> <a href="/library/adminBookPoint">회원 포인트 내역 관리</a> </li>
		</c:if>

        
    </ul>
    
    
</section>
</body>
</html>


