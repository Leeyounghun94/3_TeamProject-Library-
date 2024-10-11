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
.final_pw_ck {
	display: none;
}
.pwck_input1 {
	color: green;
	display:none;
}
.pwck_input2 {
	color: red;
	display: none;
}
</style>
</head>
<body>
	<form class="changePw" id="changePwForm"  >
		<div class="result">
			<c:choose>
				<c:when test="${result == 0 }" >
					<p> 본인인증에 실패하셨습니다. 아이디와 비밀번호를 다시 확인해주세요.</p>
					<button type="button" class="findPw_reset" onclick="location.href='/library/myPage/changePw'">본인인증 다시 입력</button>
				</c:when>
				<c:otherwise>
					<div class="logo_wrap"><span>비밀번호 재설정</span></div>
					<div class="pw_inputBox">
						<input type="text" name="pw" id="pw" class="pw_input" placeholder="새 비밀번호">
					</div>
					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
					<div class="pw2_inputBox">
						<input type="text" name="pw2" id="pw2" class="pw2_input" placeholder="비밀번호 확인">
					</div>
					<span class="pwck_input1">비밀번호가 일치합니다.</span>
					<span class="pwck_input2">비밀번호가 일치하지 않습니다.</span>
					<button type="submit" class="changePw_submit" >비밀번호 변경</button>
				</c:otherwise>
			</c:choose>
		</div>		
	</form>
</body>
<%@ include file="../../includes/footer.jsp" %>  
<script type="text/javascript">
var pwckCheck = false;
$('.pw_input').on("propertychange change keyup paste input", function(){
	var pw = $('.pw_input').val();
	var pw2 = $('.pw2_input').val();
	$('.final_pwck_ck').css('display', 'none');
	
	if(pw == pw2) {
		$('.pwck_input1').css('display', 'block');
		$('.pwck_input2').css('display', 'none');
		pwckCheck = true;
	} else {
		$('.pwck_input1').css('display', 'none');
		$('.pwck_input2').css('display', 'block');
		pwckCheck = false;
	}
});
$(".changePw_submit").click(function(){
	var pw = $(".pw_input").val();
	var pw2 = $(".pw2_input").val();
	
	
});
function validateAndSubmit() {
    var pw = document.getElementById("pw").value;
    var pw2 = document.getElementById("pw2").value;
    
    
}
</script>
</html>
