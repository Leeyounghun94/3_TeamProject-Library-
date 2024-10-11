<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>        
<%@ include file="../includes/header.jsp" %>
<form action="<c:url value='../library/createAccountForm'/>" name="createAccountForm" method="post" align="center" style="padding-top:200px;">
		<input type="text" name="name" placeholder="Name" ><br>
	<input type="text" name="id" placeholder="ID" ><br>
	<input type="password" name="pw" placeholder="Password" ><br>
	<input type="password" name="pw_check" placeholder="Password" ><br>
	<input type="text" name="nickName" placeholder="NickName" ><br>
	<input type="text" name="birth"><br>
	<input type="text" name="phone" placeholder="Phone Number" ><br>
	<input type="email" name="email" placeholder="email" ><br>
	<input type="button" value="create account" onclick="createAccountForm();">
</form>

<%@ include file="../includes/footer.jsp" %>