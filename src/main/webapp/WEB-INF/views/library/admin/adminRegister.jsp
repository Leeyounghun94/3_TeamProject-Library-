<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script><meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<form style="margin:auto;">
	<div class="input-group mb-3">
	  <input type="text" class="form-control" placeholder="아이디 또는 닉네임 입력" aria-label="Recipient's username" aria-describedby="button-addon2">
	  <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button>
	</div>
</form>
<form>
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">아이디</th>
	      <th scope="col">닉네임</th>
	      <th scope="col">전화번호</th>
	      <th scope="col"></th>
	    </tr>
	  </thead>
	  <tbody class="">
	  	<c:forEach items="${list}" var="user">
	  	<c:if test="${user.authority == 0 }"></c:if>
		    <tr>
		      <th scope="row"><c:out value="${user.u_id}" /></th>
		      <td><c:out value="${user.id}" /></td>
		      <td><c:out value="${user.nickName}" /></td>
		      <td><c:out value="${user.phone}" /></td>
		      <td><button>선택</button></td>
		    </tr>
		</c:forEach>			    
	  </tbody>
	</table>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>	