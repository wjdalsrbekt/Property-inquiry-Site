<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />

<c:if test="${userinfo==null}">
    <c:redirect url="/" />
</c:if>

<c:if test="${userinfo!=null}">
    <!DOCTYPE html>
    <html>

<head>

<meta charset="UTF-8">

<title>결과 페이지</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
    
    $(document).ready(function(){
     

        $("#searchBtn").click(function(){
        	if($("#word").val() ==""){
        		alert("모든 목록을 조회합니다.");
        	}
        	let info = JSON.stringify({
        		key:$("#key").val(),
        		word:$("#word").val()
        	});
        	console.log(info);
        	
        	   $.ajax({
                   url:'${root}/admin/user',
                   type:'POST',
                   contentType:'application/json;charset=utf-8',
                   dataType:'json',
                   data:info,
                   success:function(users){
                       makeList(users);
                   },
                   error:function(xhr,status,msg){
                       console.log("상태 값 : "+status + ", 에러 : "+msg);
                   },
                   statusCode:{
                       500 : function(){
                           alert("내부 서버 에러");
                           location.href="/error/error";
                       },
                       404 : function(){
                           alert("없는 페이지 접근.");
                           location.href="/error/error";
                       }
                   }
               });
        });
    });

    function makeList(users){
        $("#userlist").empty();
        $(users).each(function(index,user){
            let str = `<tr>
                <td><a href="${root}/user/modify/${'${user.userid}'}">${'${user.userid}'}</a></td>
                <td>${'${user.userpwd}'}</td>
                <td>${'${user.username}'}</td>
                <td>${'${user.email}'}</td>
                <td><a href="${root}/user/delete/${'${user.userid}'}">삭제</a></td>
                </tr>`;
            $("#userlist").append(str);
        })
    }

    </script>
</head>

<body>
    <%@include file="../include/header.jsp"%>
    <h2>회원 관리</h2>
    아이디 클릭 시 수정으로 넘어갑니다.
    <table class="table">
        <thead>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>이메일</th>
            <th>삭제</th>
        </thead>
        <tbody id="userlist">
        
        </tbody>
    </table>
    
    <form action=""  id="searchform" method="get">
    	<select name="key" id="key">
    		<option value="all">전체</option>
    		<option value="name">이름</option>
    		<option value="id">아이디</option>
    	</select>
    	<input type="text" placeholder="검색어 입력" name="word" id="word">
    	<input type="button" id="searchBtn" value="검색">
    </form>

</body>
    </html>
</c:if>