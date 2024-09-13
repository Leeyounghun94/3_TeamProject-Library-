<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../includes/header.jsp" />
<style>
table {
    width: 400px;
    height: 700px;
    margin: auto;    
} 
.email {
    width: 200px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-color: lightgray;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233,233,233);
}
.text {
    width: 380px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233,233,233);
}
select {
    width: 160px;
    height: 32px;
    font-size: 15px;
    border: 1;
    border-color: lightgray;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
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
td {
	padding-left:10px;
}
.phone {
    width: 90px;
    height: 32px;
    font-size: 15px;
    border: 1;
    border-color: lightgray;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
}
.phone_num {
    width: 285px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 15px;
    outline: none;
    padding-left: 10px;
    background-color: rgb(233,233,233);
}
</style>


<form action="library/join" style="padding:200 50;">
    <table>
    <tr>
        <td><h1 align="center">회원가입</h1></td>
    </tr>
    <tr><td>아이디</td></tr>
    <tr><td><input type="text" class="text"></td></tr>
    <tr><td>비밀번호</td></tr>
    <tr><td><input type="password" class="text"></td></tr>
    <tr><td>비밀번호 확인</td></tr>
    <tr><td><input type="password" class="text"></td></tr>
    <tr><td>닉네임</td></tr>
    <tr><td><input type="text" class="text"></td></tr>
    <tr><td>이름</td></tr>
    <tr><td><input type="text" class="text"></td></tr>
    <tr><td>전화번호</td></tr>
    <tr>
        <td>
            <select class="phone">
                <option>010</option>
                <option>011</option>
                <option>019</option>
            </select>
            <input type="text" class="phone_num"> 
        </td>
    </tr>
    <tr><td>생년월일</td></tr>
    <tr><td><input type="date" class="text"></td></tr>
    <tr><td>이메일</td></tr>
    <tr>
        <td><input type="text" class="email"> @ 
            <select>
                <option>naver.com</option>
                <option>gmail.com</option>
                <option>daum.net</option>
                <option>nate.com</option>
            </select>
        </td>        
    </tr>
    <tr><td>상품안내 및 마케팅/이벤트 수신동의</td></tr>
    <tr>	
    	<td>
        	<input type="checkbox" id="phone_ch" name="phone_ch">
  			<label for="phone_ch">SMS</label>       
        	<input type="checkbox" id="email_ch" name="email_ch">
  			<label for="email_ch">Email</label>
        </td>
    </tr>
    </table>
    <div align="center" style="padding:10 10">
    	<input type="submit" value="취소" class="btn btn-secondary" >
    	<input type="submit" value="가입" class="btn btn-primary">	
    </div>
</form>
</body>
<jsp:include page="../includes/footer.jsp" />
</html>
