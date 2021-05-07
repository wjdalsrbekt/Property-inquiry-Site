<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<style>
#title{
text-align:center;
}

#loginInfo{
text-align:right;
}

.error{
color:red;
}
</style>
<div class="container">
<h1 id="title"><a href="${root}/">HAPPY HOUSE</a></h1>
<div id="loginInfo">
	<c:if test="${empty userinfo}">
		<a href="${root}/user/login">로그인</a>
		<a href="${root}/user/join">회원가입</a>
	</c:if>
	<c:if test="${not empty userinfo}">
		<strong>${userinfo.username}</strong>님
		<a href="${root}/user/logout">로그아웃</a>
	</c:if>
	<a href="${root}/user/list">회원관리</a>
</div>
</div>
<script type="text/javascript">
let msg="${msg}";
if(msg){
	alert(msg);
}
</script>
