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
        <jsp:include page="../../includes/header.jsp" />

        <section class="myPage-content">

            <section class="myPage-main">

                <h1 class="myPage-title">내 정보</h1>
                <span class="myPage-subject">닉네임, 전화번호, 이메일을 수정할 수 있습니다.</span>

                <div name="myPageFrm" >

                    <div class="myPage-row">
                        <label>아이디</label>
                        <input type="text" id="id" name="id" readonly="readonly"
                            value="${user.id}">
                    </div>
                    
                    <div class="myPage-row">
                        <label>닉네임</label>
                        <input type="text" id="nickName" name="nickName" 
                            value="${user.nickName}" >
                    </div>

                    <div class="myPage-row">
                        <label>이름</label>
                        <input type="text" id="name" name="name" readonly="readonly"
                            value="${user.name}">
                    </div>
                    
                    <div class="myPage-row">
                        <label>생년월일</label>
                        <input type="text" id="birth" name="birth"  maxlength="11" readonly="readonly"
                            value="${user.birth}">
                    </div>
                    
                    <div class="myPage-row">
                        <label>전화번호</label>
                        <input type="text" name="phone" id="phone"
                            value="${user.phone}">
                    </div>
                    
                    <div class="myPage-row">
                        <label>이메일</label>
                        <input type="text" id="email" name="email" 
                            value="${user.email}">
                    </div>

               <div>
                       <button class="myPage-submit" type="submit" >수정완료</button>
                       <button class="myPage-back" onclick="location.href='/library/myPage'">이전으로</button>
                    </div>
                </div>

            </section>

        </section>

    </main>
<jsp:include page="../../includes/footer.jsp" />
    
</body>
<script type="text/javascript">
$('.myPage-submit').on('click', function(){
    var userData = {
        id: $('#id').val(),
        nickName: $('#nickName').val(),
        name: $('#name').val(),
        birth: $('#birth').val(),
        phone: $('#phone').val(),
        email: $('#email').val()
    };

    $.ajax({
        type : "PUT",
        url : "/userPage/updateForm/",
        data : JSON.stringify(userData), 
        contentType: 'application/json',
        success : function(result) {
        	alert("정보수정이 완료되었습니다.")
            window.location.href = '/library/myPage';
        },
        error: function(error) {
            alert("정보수정에 실패하였습니다.");
            alert(JSON.strigify(error));
        }
    });
});
</script>
</html>
