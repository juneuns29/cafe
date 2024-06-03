<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/cafe/css/w3.css" />
<link rel="stylesheet" type="text/css" href="/cafe/css/user.css" />
<script type="text/javascript" src="/cafe/js/jquery-3.7.1.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="w3-content mxw700">
		<h1 class="w3-col w3-blue w3-center w3-padding w3-card-4">댓글 게시글 작성</h1>
		<div class="w3-col">
			<div class="w3-green w3-btn" id="home">home</div>
<c:if test="${empty SID}"><!-- 로그인 안한 경우 -->
			<div class="w3-pink w3-btn w3-right" id="join">회원가입</div>
			<div class="w3-blue w3-btn w3-right" id="login">로그인</div>
</c:if>

<c:if test="${not empty SID}"> <!-- 로그인 한 경우 -->
			<div class="w3-red w3-btn w3-right" id="logout">로그아웃</div>
</c:if>
		</div>
		
		<form method="POST" action="" id="frm" class="w3-col w3-margin-top" >
			<input type="hidden" name="nowPage" value="${NOWPAGE}">
<c:if test="${DATA.regroup ne 0}">
			<input type="hidden" name="upno" value="${DATA.upno}">
			<input type="hidden" name="regroup" value="${DATA.regroup}">
</c:if>
			<div class="w3-container w3-padding w3-margin-bottom w3-card-4" style="padding: 15px 20px!important;">
				<div class="w3-col">
					<label class="w3-col m3 lbl">작성자 : </label>
					<input type="text" name="id" id="id" value="${SID}" 
							class="w3-col m8 w3-input" readonly>
				</div>
				<div class="w3-col">
					<div class="w3-col">
						<label for="body" class="w3-col m3 lbl">내 용 : </label>
					</div>
					<div class="w3-col">
						<div class="w3-col m3"><p> </p></div>
						<div class="w3-col m8">
							<textarea id="body" class="w3-col w3-input w3-border" rows="5"
										style="resize: none;" placeholder="내용을 작성하세요!"></textarea>
						</div>
					</div>
				</div>
			</div>
			<footer class="w3-col">
				<div class="w3-third w3-pink w3-btn" id="list">목록</div>
				<div class="w3-third w3-purple w3-btn" id="reset">reset</div>
				<div class="w3-third w3-blue w3-btn" id="write">등록</div>
			</footer>
		</form>	
	</div>
</body>
</html>