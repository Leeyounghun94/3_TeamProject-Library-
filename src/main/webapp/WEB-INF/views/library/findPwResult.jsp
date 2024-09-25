<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>      
<%@ include file="../includes/header.jsp" %>       
<!DOCTYPE html><html><head><meta charset="UTF-8">
<style>
.result-box{
	text-align: center;	
	margin: 150px 0;
}
.pw_inputBox, .pwCheck_inputBox{
	border: 0;
	height:50px;
	padding: 10px 14px;	
	display: block;
	width : 500px;
	margin : auto;	
}
.pw_input, .pwCheck_input{
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
.button_wrap{
	margin-top: 40px;
	text-align: center;
	padding-bottom: 30px;
}
.login_button{
	width: 250px;
    height: 50px;
    background-color: #ebde83;
    font-size: 30px;
    font-weight: 900;
    color: black;
    margin : auto;
    border: 0;
    
}
.findPw_button{
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
	font-size : 30px;
	font-weight: 900;
}
p {
	font-size : 18px;
	font-weight: 900;
}
.final_pw_ck {
	display: none;
}
.final_pwck_ck {
	display: none;
}
</style>
</head>
<body>
	<form class="result-box">
	<div class="logo_wrap">
		<span>비밀번호 재설정</span>
	</div>
		<div class="result">
			<c:choose>
				<c:when test="${search == 0 }">
				<p class="inquiry">조회결과가 없습니다.</p>
				<div class="button_wrap">
					<button type="button" class="login_button" onclick="location.href='/library/login'" >비밀번호 재설정</button>
				</div>
				</c:when>
				<c:otherwise>
					<div class="pw_inputBox">
						<input type="password" name="pw" id="pw" class="pw_input" placeholder="비밀번호">
					</div>
					<div class="pwCheck_inputBox">
						<input type="password" name="pw2" id="pw2" class="pwCheck_input" placeholder="비밀번호 확인">
					</div>
					<div class="button_wrap">
						<button type="button" class="login_button" onclick="location.href='/library/login'" >비밀번호 재설정</button>
					</div>
				</c:otherwise>	
			</c:choose>
		</div>
	</form>	
</body>
<script type="text/javascript">
    function validateAndSubmit() {
        var pw = document.getElementById("pw").value;
        var pw2 = document.getElementById("pw2").value;
        
        if (pw === "" || pw2 === "") {
            alert("비밀번호를 입력해주세요.");
            return;
        }
        
        if (pw !== pw2) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }

        // 비밀번호 유효성 통과, 서버로 전송
        var userData = {
            password: pw
        };

        $.ajax({
            type: "PUT",
            url: "/library/updatePassword",  // 비밀번호 업데이트 요청 경로
            data: JSON.stringify(userData),
            contentType: 'application/json; charset=utf-8',
            success: function(response) {
                alert("비밀번호가 성공적으로 변경되었습니다.");
                window.location.href = '/library/login';
            },
            error: function(error) {
                alert("비밀번호 변경 중 오류가 발생했습니다: " + error.responseText);
            }
        });
    }

    // 비밀번호 재설정 버튼에 이벤트 추가
    document.querySelector(".login_button").addEventListener("click", validateAndSubmit);
</script>
</html>