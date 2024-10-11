<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<form action="<c:url value='../library/modifyForm'/>"  name="modifyForm" method="post">
	<input type="hidden" name="u_id" value="${user.u_id }" readonly = "readonly">
	
	<input type="text" name="id" value="${user.id }" readonly="readonly" >
	<input type="password" name="pw" value="password" readonly disabled><br>
	<input type="text" name="name" value="${user.name }" placeholder="이름 입력" ><br>
	
	<input type="email" name="email" value="${user.email }">
	<input type="text" name="phone" value="${user.phone }">
	<input type="button" value = "modify account" onclick="/library/modifyForm">
	<input type="reset"  value="reset">
	
	
</form>