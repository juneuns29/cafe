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
        
    });
</script>
</head>
<body>
    <div class="w3-content mxw650">
        <h1 class="w3-blue w3-center w3-padding w3-card-4">회원가입</h1>
        <form method="GET" action="/member/joinProc.son" name="frm" id="frm" 
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
                    <small class="w3-col s9 w3-hide" id="idmsg">* 사용가능한 아이디입니다.</small>
                </div>
            </div>
            <div class="w3-col w3-padding">
                <label for="pw" class="w3-col m3 lbl w3-text-gray w3-right-align">비밀번호 : </label>
                <div class="w3-col m8">
                    <input type="password" name="pw" id="pw" 
                            placeholder="비밀번호를 입력하세요."
                            class="w3-col w3-input w3-border">
                    <small class="w3-col w3-hide" id="pwmsg"># 형식이 맞지 않습니다.</small>
                </div>
            </div>
            <div class="w3-col w3-padding">
                <label for="repw" class="w3-col m3 lbl w3-text-gray w3-right-align">비밀번호확인 : </label>
                <div class="w3-col m8">
                    <input type="password" id="repw" 
                            placeholder="비밀번호 확인 입력!"
                            class="w3-col w3-input w3-border">
                    <small class="w3-col w3-hide" id="repwmsg"># 비밀번호가 일치하지 않습니다.</small>
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
                            <input type="radio" name="ano" id="11" class="w3-radio avtrdo" value="11" checked>
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