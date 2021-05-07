<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
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
<script type="text/javascript">
	$(document).ready(function() {
		$("#registerBtn").click(function(){
			if($("#username").val()==""){
				alert("이름을 비울 수 없습니다.");
				return;
			}else if($("#userid").val()==""){
				alert("아이디를 비울 수 없습니다.");
				return;
			}else if($("#userpwd").val()==""){
				alert("비밀번호를 비울 수 없습니다.");
				return;
			}else if($("#userpwd").val() != $("#pwdcheck").val()){
				alert("비밀번호가 다릅니다.");
				return;
			}else{
				$("#memberform").attr("action","${root}/user/memberjoin").submit();
			}
		});
	});
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<form action="" method="post" id="memberform">
	<div class="form-group">
		<label for="username">이름</label> <input type="text" id="username"
			name="username"> 
	</div>
			<br>
			<div class="form-group">
			 <label for="userid">아이디</label> <input
			type="text" id="userid" name="userid"> 
			</div>
			<br>
			<div class="form-group">
			 <label
			for="userpwd">비밀번호</label> <input type="text" id="userpwd"
			name="userpwd">
			</div>
			 <br>
			 <div class="form-group">
			 <label for="pwdcheck">비밀번호
			재입력</label> 
			<input type="text" id="pwdcheck" name="pwdcheck">
			 </div>
			 <br>
		<label for="emailid">이메일</label> <input type="text" id="emailid"
			name="emailid" size="25">@ <select id="emaildomain"
			name="emaildomain">
			<option value="naver.com">naver.com</option>
			<option value="google.com">google.com</option>
			<option value="daum.net">daum.net</option>
			<option value="nate.com">nate.com</option>
			<option value="kakao.com">kakao.com</option>
		</select>
		<input type="button" id="registerBtn" value="회원가입"/>
	</form>
</body>
</html>