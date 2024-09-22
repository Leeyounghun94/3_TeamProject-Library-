<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../../includes/header.jsp" %> 

<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<section class="myPage-content">
		<%@ include file="../../includes/myPageSide.jsp" %>  
	
		<section class="myPage-main">
			<h1 class="myPage-title">회원 탈퇴</h1>
			<span class="myPage-subject">현재 비밀번호가 일치하는 경우 탈퇴할 수 있습니다.</span>
			
			<form action="secession" method="post" name="myPageFrm">
				<div class="myPage-row">
					<label>비밀번호</label>
					<input type="password" name="pw" id="pw" >
				</div>
				
				<button class="myPage-submit">탈퇴</button>

			</form>
		</section>
	
	</section>
</body>
</html>
<%@ include file="../../includes/footer.jsp" %>