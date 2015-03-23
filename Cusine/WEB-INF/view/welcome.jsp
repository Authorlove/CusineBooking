<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cusine.service.Constants" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"
		+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/osblogger.css">
	<script type="text/javascript" src="js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script src="js/main.js"></script>
	<style type="text/css">
		#footer {
			text-align: center;
		}
		#footer a {
			font-size:30px;
			text-decoration:none;
			border:solid 1px #fff; 
			border-radius:10px;" 
		}
	</style>
</head>

<body>
	<div class="container">
		<div class="labels">
			<a id="label1" class="label" href="#"> 关于ICusine
			<p><b style="font-size:20px">ICusine是一个既可满足用户点餐需求，又面对商户，并更注重于商户经营的外卖网站.</b></p>
			<span></span>
			</a>
			<a id="label2" class="label" href="#"> 在ICusine，您可以～
			<p><b style="font-size:20px">是用户，我们为你准备各路美食，让你吃饱又满足；您也可以是商户，我们为你开扩一条致富之路，让更多人品味您的美食。</b></p>
			<span></span>
			</a>
			<a id="label3" class="label" href="#">在ICusine，如果您是消费者：
			<p><b style="font-size:20px">ICusine每天帮您推荐多种优质的本地生活服务；<br >ICusine的推荐一定物超所值；<br >ICusine同时致力于帮您发现好玩，新鲜的生活方式；</b></p>
			<span></span>
			</a>
			<a id="label4" class="label" href="#">在ICusine，如果您是商家：
			<p><b style="font-size:20px">ICusine有热爱尝试的消费者；<br >ICusine有保证效果的广告价值；<br >有保证效果的广告价值；</b></p>
			<span></span>
			</a>
			<a href="/Cusine/index.htm" id="label5" class="label">赶快加入我们
			<p>现在，赶快登陆iCusine加入我们吧 ！</p>
			<span></span>
			</a>
		</div>
		<div class="description"><p></p><a class="close">X</a></div>
	</div>
	<div id="footer">
		<a href="/Cusine/toIndex.htm">立即加入</a>
	</div>
</body>
</html>
