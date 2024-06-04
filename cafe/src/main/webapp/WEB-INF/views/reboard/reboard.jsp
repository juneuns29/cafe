<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/cafe/css/w3.css" />
<link rel="stylesheet" type="text/css" href="/cafe/css/user.css" />
<link rel="stylesheet" href="/cafe/css/font-awesome-4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/cafe/js/jquery-3.7.1.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">
	$(function(){
		$('.tbtn').click(function(){
			var path = '/cafe/main.cafe';
			
			var bid = $(this).attr('id');
			switch(bid){
			case 'home':
				path = '/cafe/main.cafe';
				break;
			case 'logout':
				path = '/cafe/member/logout.cafe';
				break;
			case 'login':
				path = '/cafe/member/login.cafe';
				break;
			case 'join':
				path = '/cafe/member/join.cafe';
				break;
			}
			
			$(location).attr('href', path);
		});
		
		$('#write').click(function(){
			var path = '/cafe/reboard/reboardWrite.cafe';
			$('#frm').attr('action', path);
			$('#frm').submit();
		});
		
		/* 페이징 처리 */
		$('.pageBtn').click(function(){
			var spno = $(this).attr('id');
			$('#nowPage').val(spno);
			$('#frm').attr('action', '/cafe/reboard/reboard.cafe');
			$('#frm').submit();
		});
		
		/* 글 삭제 이벤트 처리 */
		$('.delete').click(function(){
			
		});
		
		/* 댓글 쓰기 이벤트 처리 */
		$('.append').click(function(){
			var sbno = $(this).attr('id').substring(1);
			
			$('#frm').append('<input type="hidden" name="bno" value="' + sbno + '">');
			$('#frm').attr('action', '/cafe/reboard/reboardRewrite.cafe');
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
	<form method="POST" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
	</form>
	
	<div class="w3-content mxw700">
		<h1 class="w3-blue w3-padding w3-card-4 w3-center">댓글 게시판</h1>
		<!-- 버튼 태그 -->
		<div class="w3-col">
			<div class="w3-col s3 m1 w3-btn w3-tiny w3-green tbtn" id="home">Home</div>
<c:if test="${not empty SID}">
			<div class="w3-col s3 m1 w3-btn w3-tiny w3-lime tbtn" id="logout">Logout</div>
			<div class="w3-col s3 m1 w3-btn w3-tiny w3-orange w3-right tbtn" id="write">write</div>
</c:if>
<c:if test="${empty SID}">
			<div class="w3-col s3 m1 w3-btn w3-tiny w3-blue tbtn" id="join">Join</div>
			<div class="w3-col s3 m1 w3-btn w3-tiny w3-lime tbtn" id="login">Login</div>
</c:if>
		</div>
		
		<!-- 게시글 태그 -->
<c:if test="${not empty LIST}">
		<div class="w3-col w3-margin-top">
<c:forEach var="DATA" items="${LIST}">
			<div class="w3-col w3-margin-top"  style="padding-left: ${(DATA.level - 1) * 50}px;">
				<div class="w3-col w3-card-4">
					<div class="w3-col" style="width: 100px;">
						<div class="w3-col imgBox2 pd10">
							<img src="/cafe/avatar/${DATA.savename}" class="w3-col w3-circle img80">
						</div>
						<h6 class="w3-col w3-center mgh0">${DATA.id}</h6>
					</div>
					<div class="w3-rest pd10 pdh20">
						<div class="w3-col w3-border-bottom" style="padding-bottom: 3px;">
							<p class="w3-left mgh0" style="font-size: 9pt;">작성일 : ${DATA.sdate}</p>
							<p class="w3-right mgh0" style="font-size: 9pt;"><i class="fa fa-heart"></i> 좋아요 : ${DATA.goods}</p>
						</div>
						<div class="w3-col w3-padding">
							<pre class="contentBox" style="margin: 0px;">${DATA.body}</pre>
						</div>
						<div class="w3-col">
			<c:if test="${SID eq DATA.id}">
							<div class="w3-btn w3-tiny w3-orange w3-left delete" id="d${DATA.bno}">글삭제</div>
			</c:if>
			<c:if test="${not empty SID and DATA.level lt 3}">
							<div class="w3-btn w3-tiny w3-pink w3-right append" id="r${DATA.bno}">댓글쓰기</div>
			</c:if>
						</div>
					</div>
				</div>
			</div>
</c:forEach>
			
		</div>
		
		<!-- 페이지 처리 -->
		<div class="w3-col w3-center w3-margin-top">
			<div class="w3-bar w3-border w3-border w3-border-blue w3-round">
<c:if test="${PAGE.startPage eq 1}">
				<span class="w3-bar-item w3-pale-blue">&laquo;</span>
</c:if>
<c:if test="${PAGE.startPage ne 1}">
				<span class="w3-bar-item w3-btn w3-hover-blue pageBtn" 
													id="${PAGE.startPage - 1}">&laquo;</span>
</c:if>
<c:forEach var="pno" begin="${PAGE.startPage}" end="${PAGE.endPage}">
	<c:if test="${PAGE.nowPage eq pno}"><!-- 현재 보고있는 페이지인 경우 -->
				<span class="w3-bar-item w3-pink" id="${pno}">${pno}</span>
	</c:if>
	<c:if test="${PAGE.nowPage ne pno}">
				<span class="w3-bar-item w3-btn w3-hover-blue pageBtn" 
																id="${pno}">${pno}</span>
	</c:if>
</c:forEach>
<c:if test="${PAGE.endPage ne PAGE.totalPage}">
				<span class="w3-bar-item w3-btn w3-hover-blue pageBtn" 
													id="${PAGE.endPage + 1}">&raquo;</span>
</c:if>
<c:if test="${PAGE.endPage eq PAGE.totalPage}">
				<span class="w3-bar-item w3-pale-blue">&raquo;</span>
</c:if>
			</div>
		</div>
		
</c:if>

<!-- 리스트가 비어있지 않은 경우 방명록 리스트 조건처리 닫는 태그 -->
<c:if test="${empty LIST}">
			<div class="w3-col w3-border-bottom w3-margin-top">
				<h3 class="w3-center w3-text-gray">* 아직 작성된 글이 없습니다. *</h3>
			</div>
</c:if>
		</div>
		
	</div>
</body>
</html>