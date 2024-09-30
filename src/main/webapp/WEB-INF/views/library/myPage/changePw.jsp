<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>      
<%@ include file="../../includes/header.jsp" %>      
<!DOCTYPE html><html><head><meta charset="UTF-8">
<style>
.changePw{
	text-align: center;	
	margin: 150px 0;
}
.name_inputBox, .pw_inputBox, .id_inputBox, .pw1_inputBox, .pw2_inputBox{
	border: 0;
	height:50px;
	padding: 10px 14px;	
	display: block;
	width : 500px;
	margin : auto;	
}
.id_input, .name_input, .pw_input, .pw1_input, .pw2_input{
	width: 500px;
    height: 50px;
    font-size: 20px;
    border: 0;
    border-radius: 15px;
    outline: none;
    margin: auto;
    padding-left: 10px;
    background-color: rgb(233,233,233);
}
.pw_button_wrap{
	margin-top: 40px;
	text-align: center;
	padding-bottom: 30px;
}
.login_button{
	width: 200px;
    height: 50px;
    background-color: #ebde83;
    font-size: 30px;
    font-weight: 900;
    color: black;
    margin : auto;
    border: 0;
    
}
.findPw_submit, .findPw_back{
	width: 200px;
    height: 50px;
    background-color: #ebde83;
    font-size: 30px;
    font-weight: 900;
    color: black;
    margin : auto;
    border: 0;	
}
/* 페이지 로고 */
.logo_wrap{
	text-align: center;	
	margin: 150px 0;	
}
.logo_wrap>span{
	font-size : 50px;
	font-weight: 900;
}
p {
	font-size : 18px;
	font-weight: 900;
}
</style>
</head>
<body>
	<form class="changePw" id="changePwForm" method="post" action="/library/myPage/newPw">
		<div class="logo_wrap"><span>비밀번호 변경</span></div>
		<div class="id_inputBox">
			<input type="text" name="id" id="id" class="id_input" placeholder="아이디">
		</div>
		<div class="pw_inputBox">
			<input type="password" name="pw" id="pw" class="pw_input" placeholder="비밀번호">
		</div>
		<div class="pw_button_wrap">
			<button type="button" class="findPw_back" onclick="location.href='/library/myPage'">이전으로</button>
			<button type="submit" class="findPw_submit" >본인인증</button>
		</div>
	</form>
</body>
<%@ include file="../../includes/footer.jsp" %>  
</html>
