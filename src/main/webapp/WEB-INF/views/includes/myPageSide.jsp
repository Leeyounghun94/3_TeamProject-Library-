<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/styles/news_styles.css">
<link rel="stylesheet" type="text/css" href="/resources/styles/news_responsive.css">
<!-- 자바스크립트 사용으로 상단 내용 변경 2024 09 30 -->
	
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
        
        <li> <a href="/library/myPage">내 정보</a> </li>
        
        <li> <a href="/myPage/myReservation">내 예약 관리</a></li>
        
        <li> <a href="/myPage/myList">내가 쓴 글</a></li>
        
        <li> <a href="/library/myBookRequest">나의 도서 요청 목록</a></li>
        
        <li> <a href="/myPage/changePw">비밀번호 변경</a> </li>
        
        <li> <a href="/myPage/secession">회원 탈퇴</a> </li>
        
    </ul>
    
    
</section>
</body>
</html>



