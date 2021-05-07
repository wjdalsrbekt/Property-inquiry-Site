<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<style type="text/css">
#title{
text-align:center;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#loginBtn").click(function(){
			
			if($("#userid").val() ==""){
				alert("아이디를 입력하세요.");
				return ;
			}else if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return ;
			}else{
				$("#loginform").attr("action","${root}/user/login").submit();
			}
			
		});
		
	})

</script>
</head>
<body>
<%@include file="../include/header.jsp" %>
<h2 id="title">로그인</h2>
<form action=""  id="loginform" method="post">
<div class="form-group">
	<label for="userid">아이디 </label>
	<input type="text" id="userid" name="userid" value="${saveid}">
</div>
	<br>
	<div class="form-group">
	<label for="userpwd">비밀번호</label>
	<input type="password" id="userpwd" name="userpwd" onkeydown="javascript:if(event.keyCode==13){login();}">
	<input type="checkbox" id="idsave" name="idsave" value="saveok"${idck}> 아이디저장
	</div>

	<input type="button" id="loginBtn" value="로그인" />
</form>
</body>
</html>