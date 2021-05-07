<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<title>아파트</title>
<script type="text/javascript">
	$(document).ready(function() {

		$("#searchBtn").click(function() {

			if ($("#sword").val() == "") {
				alert("모든 목록 조회!!");
			}
			$("#searchform").attr("action", "${root}/article/list").submit();
		});
		$(".page-item").click(function() {
			$("#pg").val(($(this).attr("data-pg")));
			$("#pageform").attr("action", "${root}/article/list").submit();
		});

	});
</script>
</head>
<body>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="pg" id="pg" value=""> <input
			type="hidden" name="key" id="key" value="${key}"> <input
			type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class="container" align="center">
		<%@include file="../include/header.jsp"%>
		<form id="searchform" method="get" class="form-inline" action="">
			<input type="hidden" name="pg" id="pg" value="1">
			<table class="table table-borderless">
				<tr>
					<td align="right"><select class="form-control" name="key"
						id="skey">
							<option value="dong" selected="selected">동별</option>
							<option value="aptName">아파트이름별</option>
					</select> <input type="text" class="form-control" placeholder="검색어 입력."
						name="word" id="sword">
						<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
					</td>
				</tr>
			</table>
		</form>
		<div class="col-lg-8" align="center">
			<h2>아파트 목록</h2>
			<c:if test="${articles.size() != 0}">
				<c:forEach var="article" items="${articles}">
					<table class="table table-active">
						<tbody>
							<tr class="table-info">
								<td>매물번호 : ${article.no}</td>
								<td>동 : ${article.dong}</td>
								<td>아파트이름 : ${article.aptName}</td>
							</tr>
							<tr>
								<td>코드 : ${article.code}</td>
								<td>매물물량 : ${article.dealAmount}</td>
								<td>건축연도 : ${article.buildYear}</td>
							</tr>
							<tr>
								<td>거래면적 : ${article.area}</td>
								<td>층수 : ${article.floor}</td>
								<td>지번 : ${article.jibun}</td>
							</tr>

							<tr>
								<td class="table-danger">거래 연도 : ${article.dealYear}</td>
								<td class="table-danger">거래 달 : ${article.dealMonth}</td>
								<td class="table-danger">거래 날 : ${article.dealDay}</td>
							</tr>
							<tr>
								<td colspan="2">타입 : ${article.type}</td>
								<td align="right" class="table-danger"><strong>월세
										${article.rentMoney}</strong></td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
				<table>
					<tr>
						<td>${navigation.navigator}</td>
					</tr>
				</table>
			</c:if>

			<c:if test="${articles.size() == 0}">
				<table class="table table-active">
					<tbody>
						<tr class="table-info" align="center">
							<td>작성된 글이 없습니다.</td>
						</tr>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</body>
</html>