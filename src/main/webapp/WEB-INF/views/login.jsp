<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>文件共享平台</title>
<meta name="viewport" content="width=device-width">
<%@ include file="/commons/basejs.jsp"%>
<link rel="stylesheet" type="text/css" href="${staticPath }/static/style/css/login.css?v=201612202107" />
<script type="text/javascript" src="${staticPath }/static/login.js?v=20170115" charset="utf-8"></script>
</head>
<body onkeydown="enterlogin();">
	<!-- 注释掉原有样式 -->
	<!-- <div class="top_div"></div> -->
	<div class="divForm">
		<form method="post" id="loginform">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<!-- 隐藏猫头鹰 -->
			<!-- <div style="width: 165px; height: 96px; position: absolute;">
            <div class="tou"></div>
            <div class="initial_left_hand" id="left_hand"></div>
            <div class="initial_right_hand" id="right_hand"></div>
        	</div> -->
        	<div id="loginLogo">
        		<img alt="" src="${staticPath }/static/img/logo_dh.png"><span>文件共享系统</span>
        	</div>
			<P style="padding: 15px 0px 10px; position: relative;">
				<span class="u_logo"></span> <input class="ipt" type="text" name="username" placeholder="请输入登录名" />
			</P>
			<P style="position: relative;">
				<span class="p_logo"></span> <input class="ipt" id="password" type="password" name="password" placeholder="请输入密码" />
			</P>
			<%-- <P style="padding: 10px 0px 10px; position: relative;">
				<input class="captcha" type="text" name="captcha" placeholder="请输入验证码" /> <img id="captcha" alt="验证码" src="${path }/captcha.jpg" data-src="${path }/captcha.jpg?t=" style="vertical-align: middle; border-radius: 4px; width: 94.5px; height: 35px; cursor: pointer;">
			</P> --%>
			<P style="position: relative; margin-top:10px; text-align: left;">
				<input class="rememberMe" type="checkbox" name="rememberMe" value="1" checked style="vertical-align: middle; margin-left: 40px; height: 20px;" /> 记住密码
			</P>
			<div style="height: 50px; line-height: 50px; margin-top: 10px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
				<P style="margin: 0px 35px 20px 45px;">
					<!-- <span style="float: left;"> <a style="color: rgb(204, 204, 204);" href="javascript:;">忘记密码?</a></span>  -->
					<span style="width: 290px;"><button class="submitBtn"><span style="font-weight: bold;font-size: medium;">登        录</span></button></span>
					<!-- <span style="width: 290px"> <a style="background: rgb(0, 142, 173); display:block; height:40px;padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;" href="javascript:;" onclick="submitForm()">登录</a></span> -->
				</P>
			</div>
		</form>
	</div>
</body>
</html>
