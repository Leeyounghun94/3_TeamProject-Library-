<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script><meta name="viewport" content="width=device-width, initial-scale=1.0">
 -->
<jsp:include page="../includes/header.jsp" />
<style>
.wrapper {
	padding: 5 10;
	/* background-color:black; */
	width: 40%;
	margin:auto;
}

.correct{
    color : green;
}
.incorrect{
    color : red;
}

/* .email {
    width: 200px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-color: lightgray;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233,233,233);
} */
.id_input , .pw_input, .pwck_input, .nickName_input, .name_input, .phone_input, .email_input, .birth_input{
    width: 380px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233,233,233);
}
.mailCheck {
	width: 150px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233,233,233);
}

.btn {
    width: 195px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    
}
/* .mail_checkBtn{
	width: 50px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
} */
/* 중복 아이디가 존재하지 않는 경우 */
.id_check1 {
	color: green;
	display:none;
}
.pwck_input_check1 {
	color: green;
	display:none;
}
.nickName_check1 {
	color: green;
	display:none;
}
/* 중복 아이디가 존재하는 경우 */
.id_check2 {
	color: red;
	display: none;
}
.pwck_input_check2 {
	color: red;
	display: none;
}
.nickName_check2 {
	color: red;
	display: none;
}
/* 유효성 검사 */
.final_id_ck {
	display: none;
}
.final_pw_ck {
	display: none;
}
.final_pwck_ck {
	display: none;
}
.final_nick_ck {
	display: none;
}
.final_phone_ck{
	display: none;
}
.final_name_ck {
	display: none;
}
.final_birth_ck {
	display: none;
}
.final_phone_ck {
	display: none;
}
.final_email_ck {
	display: none;
}

#mail_check_input_box_false{
    background-color:#ebebe4;
}
 
#mail_check_input_box_true{
    background-color:white;
}
</style>

<div class="wrapper" >
	<form id="joinForm" method="post" style="padding:200 50;">
    	
    	<div class="subject" align="center" style="padding-bottom:50px; font-size:25;">
    		<span >회원가입</span>
    	</div>
    	<div class="wrap" style="padding-left: 150px;">	
    		<div class="id_wrap" style="padding-bottom:20px;">
    			<div class="title" >아이디</div>
    			<div class="id_input_box">
    				<input type="text" class="id_input" name="id">
    			</div>
    			<span class="id_check1">사용 가능한 아이디입니다.</span>
    			<span class="id_check2">이미 사용중인 아이디입니다.</span>
    			<span class="final_id_ck">아이디를 입력해주세요.</span>
    		</div>
    		<div class="pw_wrap" style="padding-bottom:20px;">
    			<div class="title">비밀번호</div>
    			<div class="pw_input_box">
    				<input type="password" class="pw_input" name="pw">
    			</div>
    			<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
    		</div>
    		<div class="pwck_wrap" style="padding-bottom:20px;">
    			<div class="title">비밀번호 확인</div>
    			<div class="pwck_input_box">
    				<input type="password" class="pwck_input" name="pwck">
    			</div>
    			<span class="final_pwck_ck">비밀번호 확인을 확인해주세요.</span>
    			<span class="pwck_input_check1">비밀번호가 일치합니다.</span>
    			<span class="pwck_input_check2">비밀번호가 일치하지 않습니다.</span>
    		</div>
    		<div class="nickName_wrap" style="padding-bottom:20px;">
    			<div class="title">닉네임</div>
    			<div class="nickName_input_box">
    				<input type="text" class="nickName_input" name="nickName">
    			</div>
    			<span class="nickName_check1">사용 가능한 닉네임입니다.</span>
    			<span class="nickName_check2">이미 사용중인 닉네임입니다.</span>
    			<span class="final_nick_ck">닉네임을 입력해주세요.</span>
    		</div>
    		<div class="name_wrap" style="padding-bottom:20px;">
    			<div class="title">이름</div>
    			<div class="name_input_box">
    				<input type="text" class="name_input" name="name">
    			</div>
    			<span class="final_name_ck">이름을 입력해주세요.</span>
    		</div>
    		<div class="birth_wrap" style="padding-bottom:20px;">
    			<div class="title">생년월일</div>
    			<div class="birth_input_box">
    				<input type="text" class="birth_input" name="birth">
    			</div>
    			<span class="final_birth_ck">생년월일을 입력해주세요.</span>
    		</div>
    		<div class="phone_wrap" style="padding-bottom:20px;">
    			<div class="title">전화번호</div>
    			<div class="phone_input">
    				<input type="text" class="phone_input" name="phone">
    			</div>
    			<span class="final_phone_ck">전화번호를 입력해주세요.</span>
    		</div>
    		<div class="email_wrap" style="padding-bottom:20px;">
    			<div class="title">이메일</div>
    			<div class="email_input_box">
    				<input type="email" class="email_input" name="email" id="email_input">
    			</div>
    			<div class="mail_input_box_warn"> <!-- 인증번호 박스 -->
    				<div class="mail_check_input_box" id="mail_check_input_box_false">
    					<input class="mail_check_input" type="text" disabled="disabled" id="mail_check_input">
    				</div>
    				
    			</div>
    			<div class="clearfix"></div>
    			<span id="mail_check_input_box_warn"></span>
    			<span class="final_email_ck">이메일을 입력해주세요.</span>
    			<span class="mail_check_input_box_warn" id="mail_check_input_box_warn"></span>			
    		</div>
    	</div>
    <div>
    	<h5 style="padding-left:150px; padding-bottom:10px;">상품안내 및 마케팅/이벤트 수신동의(선택)</h5>
    </div>	
    <div style="padding-left:150px; padding-bottom:10px;">	
    	  	<input type="checkbox" id="phone_ch" name="phone_ch">
  			<label for="phone_ch">SMS</label>       
        	<input type="checkbox" id="email_ch" name="email_ch">
  			<label for="email_ch">Email</label>
    </div>
   
   
	</form>
	<div class="mail_check_btn">
    					<button class="mail_check_btn" id="mail_check_btn">인증번호 전송</button>
    				</div>
	 <div style="padding-left:130px;">
    	<input type="submit" value="취소" class="btn btn-secondary" onclick="location.href='/library/home'">
    	<input type="submit" value="가입" class="btn btn-primary" name="join_btn">	
    </div>
</div> 
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">알립니다.</h4>
                                        </div>
                                        <div class="modal-body"> 처리가 완료되었습니다. </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                            <button type="button" class="btn btn-primary">확인</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
</body>
<jsp:include page="../includes/footer.jsp" />
<script type="text/javascript">
var idCheck = false;		// 아이디
var idckCheck = false;		// 아이디 중복 검사(중복이 없는 경우)
var idckCheck = true;		// 아이디 중복이 있는 경우
var pwCheck = false; 		// 비밀번호
var pwckCheck = false;		// 비밀번호 확인
var pwckcorCheck = false;	// 비밀번호 확인일치
var nickCheck = false;		// 닉네임
var nickCheck_ck = false;  	// 닉네임 중복검사 (중복이 없는 경우)
var nickCheck_ck = true; 	// 닉네임 중복이 있는 경우
var nameCheck = false;		// 이름
var birthCheck = false;		// 생년월일
var phoneCheck = false;		// 전화번호
var emailCheck = false;		// 이메일

var code = "";	// 이메일전송 인증번호 저장 코드

$(document).ready(function(){
	// 회원가입 버튼
	
	$(".join_btn").click(function(){
		/* 입력값 변수 */
		var id = $('.id_input').val();
		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		var nickname = $('.nickName_input').val();
		var name = $('.name_input').val();
		var birth = $('.birth_input').val();
		var phone = $('.phone_input').val();
		var email = $('.email_input').val();
		
		/* 아이디 유효성검사 */
		if(id == "") {
			$('.final_id_ck').css('display', 'block');
			idCheck = false;
		} else {
			$('.final_id_ck').css('display','none');
			idCheck = true;
		}
		
		/* 비밀번호 유효성검사 */
		if(pw == ""){
			$('.final_pw_ck').css('display', 'block');
			pwCheck = false;
		} else {
			$('.final_pw_ck').css('display','none');
			pwCheck = true;
		}
		
		/* 비밀번호확인 유효성검사 */
		if(pwck == ""){
			$('.final_pwck_ck').css('display', 'block');
			pwckCheck = false;
		} else {
			$('.final_pwck_ck').css('display','none');
			pwckCheck = true;
		}
		
		/* 닉네임확인 유효성검사 */
		if(nickName == ""){
			$('.final_nick_ck').css('display', 'block');
			nickCheck = false;
		} else {
			$('.final_nick_ck').css('display','none');
			nickCheck = true;
		}
		
		/* 이름확인 유효성검사 */
		if(name == ""){
			$('.final_name_ck').css('display', 'block');
			nameCheck = false;
		} else {
			$('.final_name_ck').css('display','none');
			nameCheck = true;
		}
		
		/* 생년월일확인 유효성검사 */
		if(birth == ""){
			$('.final_birth_ck').css('display', 'block');
			birthCheck = false;
		} else {
			$('.final_birth_ck').css('display','none');
			birthCheck = true;
		}
		
		/* 전화번호확인 유효성검사 */
		if(phone == ""){
			$('.final_phone_ck').css('display', 'block');
			phoneCheck = false;
		} else {
			$('.final_phone_ck').css('display','none');
			phoneCheck = true;
		}
		
		/* 이메일확인 유효성검사 */
		if(email == ""){
			$('.final_email_ck').css('display', 'block');
			emailCheck = false;
		} else {
			$('.final_email_ck').css('display','none'); 
			emailCheck = true;
		}
		
		
		if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nickCheck&&nickCheck_ck&&nameCheck&birthCheck&&phoneCheck&&emailCheck){
			$("#joinForm").attr("action", "/library/join");
			$("#joinForm").submit();
			alert("회원가입 완료");

		}
		return false; // 유효성 검사 중 단 한개라도 false가 있을 경우 false 반환
	});
});

/* 아이디 중복검사 */
$('.id_input').on("propertychange change keyup paste input", function(){
	/* console.log("keyup 테스트"); */
	
	var id = $(".id_input").val(); // id_input 에 입력되는 값
	var data = {id : id} 		   // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/library/idCheck",
		data : data,
		success : function(result){
			/* console.log("성공여부 : " + result); */
			if(result != 'fail'){
				$('.id_check1').css("display","inline-block");
				$('.id_check2').css("display", "none");
				idckCheck = true;
			} else {
				$('.id_check2').css("display", "inline-block");
				$('.id_check1').css("display","none");
				idckCheck = false;
			}
		} // success 종료
	}); // ajax 종료
}); // id function 종료

/* 닉네임 중복검사 */
$('.nickName_input').on("propertychange change keyup paste input", function(){
	/* console.log("keyup 테스트"); */
	
	var nickName = $(".nickName_input").val(); // id_input 에 입력되는 값
	var data = {nickName : nickName} 	 // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/library/nickNameCheck",
		data : data,
		success : function(result){
			 console.log("성공여부 : " + result);
			if(result != 'fail'){
				$('.nickName_check1').css("display","inline-block");
				$('.nickName_check2').css("display", "none");
				nickCheck_ck = true;
			} else {
				$('.nickName_check2').css("display", "inline-block");
				$('.nickName_check1').css("display","none");
				nickCheck_ck = false;
			}
		} // success 종료
	}); // ajax 종료
}); // id function 종료

/* 비밀번호 확인 일치 유효성 검사 */
$('.id_input').on("propertychange change keyup paste input", function(){
	var pw = $('.pw_input').val();
	var pwck = $('.pwck_input').val();
	$('.final_pwck_ck').css('display', 'none');
	
	if(pw == pwck) {
		$('.pwck_input_check1').css('display', 'block');
		$('.pwck_input_check2').css('display', 'none');
		pwckcorCheck = true;
	} else {
		$('.pwck_input_check1').css('display', 'none');
		$('.pwck_input_check2').css('display', 'block');
		pwckcorCheck = false;
	}
});

$("#mail_check_btn").click(function(){
	const email = $("#email_input").val();
	console.log(email);
	const checkInput = $("#mail_check_input")
	
	$.ajax({
		type:"GET",
		url: '<c:url value ="/library/mailCheck?email="/>'+email, 
		success:function(data){
			console.log("data : " + data);
			checkInput.attr('disabled', false);
			code =data;
			alert("인증번호가 전송되었습니다.");
		}
	});
});

$("#mail_check_input").blur(function(){
	const inputCode = $(this).val();
	const $resultMsg = $("#mail_check_input_box_warn");
	console.log("입력한 인증번호: "+inputCode)
	console.log("인증번호 : " + code)
	if(inputCode === code) {
		$resultMsg.html("인증번호가 일치합니다.");
		$resultMsg.css('color', 'green');
		$('.mail_check_btn').attr('disabled', true);
		$('.email_input').attr('readonly', true);
	} else {
		$resultMsg.html("인증번호가 불일치합니다. 다시 확인해주세요.");
		$resultMsg.css('color', 'red');
	}
});


</script>

</html>