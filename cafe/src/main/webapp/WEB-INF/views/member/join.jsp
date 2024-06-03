<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Join</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/cafe/css/w3.css">
<link rel="stylesheet" type="text/css" href="/cafe/css/user.css">
<script type="text/javascript" src="/cafe/js/jquery-3.7.1.min.js"></script>
<style type="text/css">
    #chkBtn {
        width: 85px;
        height: 40px;
    }
</style>
<script type="text/javascript">
    $(document).ready(function(){
    	$('.rdo').change(function(){
            $('#fAvt, #mAvt').stop().slideUp();
            var tag = $(this).val();
            if(tag == 'M'){
                $('#mAvt').removeClass('w3-hide');
                $('#mAvt').slideDown();
            } else {
                $('#fAvt').removeClass('w3-hide');
                $('#fAvt').slideDown();
            }
        });
    	
    	$('#reset').click(function(){
    		document.frm.reset();
    	});
    	
    	$('#home').click(function(){
    		$(location).attr('href', '/cafe/main.cafe');
    	});
    	
    	// 아이디 체크 버튼 이벤트 처리
    	$('#chkBtn').click(function(){
    		var sid = $('#id').val();
    		if(!sid){
    			$('#id').focus();
    			return;
    		}
    		
    		$.ajax({
    			url: '/cafe/member/idCheck.cafe',
    			type: 'post',
    			dataType: 'json',
    			data: {
    				id: sid
    			},
    			success: function(resp){
    				if(resp.result == 'NO'){
    					$('#id').val('');
    					$('#idmsg').html('# 사용할 수 없는 아이디 입니다. #');
    					$('#idmsg').removeClass('w3-text-red w3-text-green').addClass('w3-text-red');
    					$('#idmsg').removeClass('w3-hide');
    				} else {
    					$('#idmsg').html('* 사용가능한 아이디 입니다. *');
    					$('#idmsg').removeClass('w3-text-red w3-text-green').addClass('w3-text-green');
    					$('#idmsg').removeClass('w3-hide');
    				}
    			}
    		});
    	});
    	
    	$('#pw').keyup(function(){
    		var spw = $(this).val();
    		// 정규표현식 검사...
    		
    	});
    	
    	$('#repw').keyup(function(){
   			$('#repwmsg').removeClass('w3-hide').addClass('w3-hide');
    		var spw = $('#pw').val();
    		
    		var respw = $(this).val();
    		if(spw != respw){
    			$('#repwmsg').html('# 비밀번호가 일치하지 않습니다. #');
    			$('#repwmsg').removeClass('w3-text-red w3-text-blue').addClass('w3-text-red');
    			$('#repwmsg').removeClass('w3-hide');
    		} else {
    			$('#repwmsg').html('* 비밀번호가 일치합니다. *');
    			$('#repwmsg').removeClass('w3-text-red w3-text-blue').addClass('w3-text-blue');
    			$('#repwmsg').removeClass('w3-hide');
    		}
    	});
    	
    	$('#join').click(function(){
    		var sname = $('#name').val();
    		if(!sname){
    			$('#name').focus();
    			return;
    		}
    		var sid = $('#id').val();
    		if(!sid){
    			$('#id').focus();
    			return;
    		}
    		var spw = $('#pw').val();
    		if(!spw){
    			$('#pw').focus();
    			return;
    		}
    		var smail = $('#mail').val();
    		if(!smail){
    			$('#mail').focus();
    			return;
    		}
    		var stel = $('#tel').val();
    		if(!stel){
    			$('#tel').focus();
    			return;
    		}
    		var sgen = document.frm.gen.value;
    		if(!sgen){
    			return;
    		}
    		var sano = document.frm.ano.value;
    		if(!sano){
    			return;
    		}
    		
    		$('#frm').submit();
    	});
    });
</script>
</head>
<body>
    <div class="w3-content mxw650">
        <h1 class="w3-blue w3-center w3-padding w3-card-4">회원가입</h1>
        <form method="POST" action="/cafe/member/joinProc.cafe" name="frm" id="frm" 
                class="w3-col w3-light-grey mgt20 w3-card-4 w3-padding pdh30">
            <div class="w3-col w3-padding">
                <label for="name" class="w3-col m3 lbl w3-text-gray w3-right-align">이 름 : </label>
                <input type="text" name="name" id="name" 
                        placeholder="이름을 입력하세요."
                        class="w3-col m8 w3-input w3-border">
            </div>
            <div class="w3-col w3-padding">
                <label for="id" class="w3-col m3 lbl w3-text-gray w3-right-align">아이디 : </label>
                <div class="w3-col m8">
                    <input type="text" name="id" id="id" 
                            placeholder="아이디를 입력하세요."
                            class="w3-col m9 w3-input w3-border">
                    <div class="w3-button w3-blue w3-right" id="chkBtn">check</div>
                    <small class="w3-col s9 w3-hide w3-center" id="idmsg">* 사용가능한 아이디입니다.</small>
                </div>
            </div>
            <div class="w3-col w3-padding">
                <label for="pw" class="w3-col m3 lbl w3-text-gray w3-right-align">비밀번호 : </label>
                <div class="w3-col m8">
                    <input type="password" name="pw" id="pw" 
                            placeholder="비밀번호를 입력하세요."
                            class="w3-col w3-input w3-border">
                    <small class="w3-col w3-hide w3-center" id="pwmsg"># 형식이 맞지 않습니다.</small>
                </div>
            </div>
            <div class="w3-col w3-padding">
                <label for="repw" class="w3-col m3 lbl w3-text-gray w3-right-align">비밀번호확인 : </label>
                <div class="w3-col m8">
                    <input type="password" id="repw" 
                            placeholder="비밀번호 확인 입력!"
                            class="w3-col w3-input w3-border">
                    <small class="w3-col w3-hide w3-center" id="repwmsg"># 비밀번호가 일치하지 않습니다.</small>
                </div>
            </div>
            <div class="w3-col w3-padding">
                <label for="mail" class="w3-col m3 lbl w3-text-gray w3-right-align">이메일 : </label>
                <input type="text" name="mail" id="mail" 
                        placeholder="이메일을 입력하세요."
                        class="w3-col m8 w3-input w3-border">
            </div>
            <div class="w3-col w3-padding">
                <label for="tel" class="w3-col m3 lbl w3-text-gray w3-right-align">전화번호 : </label>
                <input type="text" name="tel" id="tel" 
                        placeholder="전화번호를 입력하세요."
                        class="w3-col m8 w3-input w3-border">
            </div>
            <div class="w3-col w3-padding">
                <label class="w3-col m3 lbl w3-text-gray w3-right-align">성 별 : </label>
                <div class="w3-col m8">
                    <div class="w3-half w3-center">
                        <input type="radio" name="gen" id="F" 
                                class="w3-radio rdo" value="F">
                        <label for="F" class="genlbl w3-text-gray">여 자</label>
                    </div>
                    <div class="w3-half w3-center">
                        <input type="radio" name="gen" id="M" class="w3-radio rdo" value="M">
                        <label for="M" class="genlbl w3-text-gray">남 자</label>
                    </div>
                </div>
            </div>
            <div class="w3-col w3-padding" id="avtfr">
                <label class="w3-col m3 lbl w3-text-gray w3-right-align">아바타 : </label>
                <div class="w3-col m8">
                    <div class="w3-col w3-center w3-hide" id="mAvt">
                        <div class="inblock avtBox w3-center">
                            <label for="11" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar11.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="11" class="w3-radio avtrdo" value="11">
                        </div>
                        <div class="inblock avtBox w3-center">
                            <label for="12" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar12.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="12" class="w3-radio avtrdo" value="12">
                        </div>
                        <div class="inblock avtBox w3-center">
                            <label for="13" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar13.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="13" class="w3-radio avtrdo" value="13">
                        </div>
                    </div>
                    <div class="w3-col w3-center w3-hide" id="fAvt">
                        <div class="inblock avtBox w3-center">
                            <label for="21" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar21.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="21" class="w3-radio avtrdo" value="21">
                        </div>
                        <div class="inblock avtBox w3-center">
                            <label for="22" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar22.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="22" class="w3-radio avtrdo" value="22">
                        </div>
                        <div class="inblock avtBox w3-center">
                            <label for="23" class="inblock imgBox">
                                <img src="/cafe/image/avatar/img_avatar23.png" class="avtimg">
                            </label>
                            <input type="radio" name="ano" id="23" class="w3-radio avtrdo" value="23">
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="w3-col w3-center w3-padding w3-margin-top">
            <div class="w3-button inblock w3-orange btnW1 w3-card-4 btnPd" id="reset">reset</div>
            <div class="w3-button inblock w3-green btnW1 w3-card-4 btnPd" id="home">home</div>
            <div class="w3-button inblock w3-blue btnW1 w3-card-4 btnPd" id="join">회원가입</div>
        </div>
    </div>
</body>
</html>