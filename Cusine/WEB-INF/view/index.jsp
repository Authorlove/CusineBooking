<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>My JSP 'index.jsp' starting page</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	<!-- Bootstrap -->
	<link href="css/bootstrap.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>
<body>
  <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation"> 
   <div class="container"> 
    <div class="navbar-header"> 
     <a class="navbar-brand" href="#">Cusine美食网</a> 
    </div> 
    <div id="navbar" class="collapse navbar-collapse"> 
     <form class="navbar-form navbar-right" role="search"
     	action="/Cusine/IndexSearchProduct.htm" method="post"> 
      <div class="form-group"> 
       <input type="text" id="search" class="form-control" placeholder="请输入美食名称" 
       		name="productName"/> 
      </div> 
      <button type="submit" class="btn btn-default">搜索</button> 
     </form> 
     <ul class="nav navbar-nav navbar-left"> 
      <li data-toggle="modal" data-target="#myModal1"><a>
  		<c:choose>
      		<c:when test="${customer.customerAccount==null}">登录</c:when>
      		<c:otherwise>${customer.customerAccount}</c:otherwise>
      	</c:choose></a>
   	</li> 
      <li data-toggle="modal" data-target="#myModal2"><a>
   		<c:choose>
	      		<c:when test="${customer.customerAccount==null}">注册</c:when>
	      		<c:otherwise></c:otherwise>
      	</c:choose></a>
    </li> 
      <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown">我是商家 <span class="caret"></span></a> 
       <ul class="dropdown-menu" role="menu"> 
        <li data-toggle="modal" data-target="#myModal3"><a>登陆</a></li> 
        <li class="divider"></li> 
        <li data-toggle="modal" data-target="#myModal4"><a>注册</a></li> 
       </ul> </li> 
     </ul> 
    </div> 
    <!--/.nav-collapse --> 
   </div> 
  </nav>
  <br><br>
<!-- 轮播图 -->
<div class="pics_wrap">
	<div id="html5zoo-1">
		<ul class="html5zoo-slides" style="display:none;">
			<li><a href=#><img src="images/001.jpg" /></a></li>
			<li><a href=#><img src="images/002.jpg" /></a></li>
			<li><a href=#><img src="images/003.jpg" /></a></li>
			<li><a href=#><img src="images/004.jpg" /></a></li>
			<li><a href=#><img src="images/005.jpg" /></a></li>
		</ul>
	</div>
</div>
<!-- 轮播图结束 -->
  <div class="container">
   <form action="/Cusine/index.htm" id="indexForm" method="get">
   <div class="row"> 
    <div class="btn-group" data-toggle="buttons">
      <label class="btn btn-default active" onclick="submitForm($(this))">
        <input type="radio" name="ptype" id="option1" autocomplete="off" value="" checked>全部 </label>
	<c:forEach var="type" items="<%= Constants.ProductType.ptype %>">
		<label class="btn btn-default" onclick="submitForm($(this))">
			<input type="radio" name="ptype" value="${type}" autocomplete="off">
				${type}
		</label>
	</c:forEach>
	<input type="hidden" id="ProductType" value="${lastPtype}"> 
    </div>
   </div> 
   <br /> 
   <div class="row ">
  <div class="col-md-6  btn-group">
    <div data-toggle="buttons" class="row" id="inputList">
   	<c:forEach var="option" items="${oc.options}">
   		<c:choose>
	   		<c:when test="${option.key==oc.lastToggle}">
		   		<label onclick="toggle($(this))" class="btn btn-default col-md-3 label2 active"> 
		     	<input type="radio" name="options" value="${option.key}" 
		     		autocomplete="off" checked="checked"/>${option.value}
		     	<span class="glyphicon glyphicon-arrow-down"></span>
		   	 	</label> 
	   		</c:when>
	   		<c:otherwise>
	   			<label onclick="toggle($(this))" class="btn btn-default col-md-3 label2"> 
		     	<input type="radio" name="options" value="${option.key}" 
		     		autocomplete="off" />${option.value}
		     	<span class="glyphicon glyphicon-arrow-down hide"></span>
		   	 	</label> 
	   		</c:otherwise>
   		</c:choose>
   	</c:forEach>
     </div>
     </div>
     </div>
    </form>
   <br /> 
   <div class="row">
   <c:forEach var="product" items="${products}">
   		<div class="col-sm-6 col-md-4" id="${product.productID}">
      		<div class="thumbnail">
      			<img src="/Cusine/${product.picPath}" alt="product images"/>
        		<div class="caption">
          			<div class="row">
            			<div class="col-md-6"><strong class="foodname">${product.name}</strong></div>
            			<div class="col-md-4">ID: ${product.productID}</div>
          			</div>
	          		<br>
	          		<div class="row">
	            		<div class="col-md-6">价格(元): 
	            			<span class="price">${product.price}</span> 
            			</div>
	            		<div class="col-md-6">销量: 
	            			<span class="amount">${product.saleVolume}</span>
            			</div>
	          		</div>
	          		<br>
	          		<p><a href="#" class="btn btn-primary" role="button" 
	          			data-toggle="modal" data-target="#orderModal"
	          			onclick="modifyinfo(${product.productID})">下单</a></p>
    			</div>
    		</div>
   		</div>
   </c:forEach> 
   </div> 
  </div> 
  
  <!-- Modal --> 
  <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
   <div class="modal-dialog"> 
    <div class="modal-content"> 
     <div class="modal-header"> 
      <button type="button" class="close" data-dismiss="modal">
      	<span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> 
      <h2 class="modal-title" id="myModalLabel">用户注册</h2> 
     </div> 
     <div class="modal-body"> 
      <form role="form" action="/Cusine/handleCustomerRegister.htm" method="post"> 
       <div class="form-group"> 
        <label for="username">用户名</label> 
        <input type="text" class="form-control" id="username" 
        	placeholder="Enter user name" required 
        	name="customerAccount"/> 
       </div> 
       <div class="form-group"> 
        <label for="exampleInputEmail1">邮箱</label> 
        <input type="email" class="form-control" id="exampleInputEmail1" 
        	placeholder="Enter email" required name="customerEmail"/> 
       </div> 
       <div class="form-group"> 
        <label for="exampleInputPassword1">密码</label> 
        <input type="password" class="form-control" id="exampleInputPassword1"
        	 placeholder="Password" required name="customerPwd"/> 
       </div> 
       <div class="form-group"> 
        <label for="exampleInputPassword1">确认密码</label> 
        <input type="password" class="form-control" id="exampleInputPassword1" 
        	placeholder="Password" required/> 
       </div>
       <div class="form-group"> 
        <label for="exampleInputPassword1">联系电话</label> 
        <input type="tel" class="form-control" id="exampleInputPassword1" 
        	placeholder="phone" required name="customerPhone"/> 
       </div>  
       <button type="submit" class="btn btn-lg btn-primary">确认</button> 
      </form> 
     </div> 
    </div> 
   </div> 
  </div> 
  <!-- Modal --> 
  <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
   <div class="modal-dialog"> 
    <div class="modal-content"> 
     <div class="modal-header"> 
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> 
      <h2 class="modal-title" id="myModalLabel">商家注册</h2> 
     </div> 
     <div class="modal-body"> 
      <form role="form" action="/Cusine/handleSellerRegister.htm" method="post"> 
       <div class="form-group"> 
        <label>账号</label> 
        <input type="email" class="form-control" name="account"
        	placeholder="邮箱" required/> 
       </div> 
       <div class="form-group"> 
        <label>密码</label> 
        <input type="password" onchange="checkPwd()" class="form-control" name="pwd"
        	placeholder="请输入您的密码" id="pwd1" required/> 
       </div> 
       <div class="form-group"> 
        <label>确认密码</label> 
        <input type="password" onchange="confirmPwd()" class="form-control"
        	placeholder="请确认您的密码" id="pwd2" required/> 
       </div> 
       <div class="form-group"> 
        <label>姓名</label> 
        <input type="text" class="form-control" name="sellerName" 
        	placeholder="请输入您的姓名" required/> 
       </div> 
       <div class="form-group"> 
        <label>手机</label> 
        <input type="tel" class="form-control" name="sellerPhone" 
        	placeholder="请输入您的手机号" required maxlength="11"/> 
       </div> 
       <div class="form-group"> 
        <label for="username">门店名称</label> 
        <input type="text" class="form-control" name="storeName" 
        	placeholder="请输入您的门店名称" required/> 
       </div> 
        <div class="form-group"> 
        <label for="province">省份</label> 
        <input class="form-control" name="province" required
        	placeholder="请输入您的省份"/> 
       </div> 
       <div class="form-group"> 
        <label for="city">城市</label> 
        <input class="form-control" name="city"	placeholder="请输入您的城市"/> 
       </div> 
       <div class="form-group"> 
        <label for="area">区域</label> 
        <input class="form-control" name="district"
        	placeholder="请输入您的具体区域"/> 
       </div> 
       <div class="form-group"> 
        <label for="storephone">固定电话</label> 
        <input type="text" class="form-control" name="storePhone" 
        	placeholder="Enter username"/> 
       </div> 
       <button type="submit" class="btn btn-lg btn-primary">确认</button> 
      </form> 
     </div> 
    </div> 
   </div> 
  </div> 
    <!-- Modal --> 
  <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
   <div class="modal-dialog"> 
    <div class="modal-content"> 
     <div class="modal-header"> 
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> 
      <h2 class="modal-title" id="myModalLabel">用户登录</h2> 
     </div> 
     <div class="modal-body"> 
      <form role="form" action="/Cusine/handleCustomerLogin.htm" method="post"> 
       <div class="form-group"> 
        <label for="exampleInputEmail1">邮箱</label> 
        <input type="email" class="form-control" id="exampleInputEmail1" 
        	placeholder="Enter email" required name="customerEmail"/> 
       </div> 
       <div class="form-group"> 
        <label for="exampleInputPassword1">密码</label> 
        <input type="password" class="form-control" id="exampleInputPassword1" 
        	placeholder="Password" required name="customerPwd"/> 
       </div> 
       <button type="submit" class="btn btn-primary btn-lg">确认</button> 
      </form> 
     </div> 
    </div> 
   </div> 
  </div> 
  <!-- Modal --> 
  <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
   <div class="modal-dialog"> 
    <div class="modal-content"> 
     <div class="modal-header"> 
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button> 
      <h2 class="modal-title" id="myModalLabel">商家登录</h2> 
     </div> 
     <div class="modal-body"> 
      <form role="form" action="/Cusine/handleSellerLogin.htm" method="post"> 
       <div class="form-group"> 
        <label>邮箱</label> 
        <input type="email" class="form-control" name="account" 
        	placeholder="Enter email" required/> 
       </div> 
       <div class="form-group"> 
        <label>密码</label> 
        <input type="password" class="form-control" name="pwd" 
        	placeholder="Password" required/> 
       </div> 
       <button type="submit" class="btn btn-primary btn-lg">确认</button> 
      </form> 
     </div> 
    </div> 
   </div> 
  </div> 
  
  <!-- Modal -->
<div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h2 class="modal-title" id="myModalLabel">下单</h2>
      </div>
      <div class="modal-body">
        <form role="form" action="/Cusine/submitOrder.htm" method="post">
          <div class="form-group">
            <label for="foodname">菜名</label>
            <input id="foodname" type="text" class="form-control" name="name" disabled>
          </div>
          <div class="form-group">
            <label for="customername">用户姓名</label>
            <input type="text" class="form-control" name="customerName" placeholder="" 
            	required>
          </div>
          <div class="form-group">
            <label for="userphone">手机号</label>
            <input type="text" class="form-control" id="customerphone " 
            	placeholder="" required name="customerPhone" maxlength="11">
          </div>
          <div class="form-group">
            <label for="customerAdderss">送餐地址</label>
            <input type="text" class="form-control" name="customerAddress" 
            	placeholder="" required>
          </div>
          <input type="text" class="hidden" id="PID" placeholder="" value=""
          	name="productID">
          <button type="submit" class="btn btn-lg btn-primary">确认</button>
        </form>
      </div>
    </div>
  </div>
</div>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
  <script src="js/jquery-1.11.2.js"></script> 
  <script src="js/html5zoo.js"></script>
  <script src="js/lovelygallery.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed --> 
  <script src="js/bootstrap.min.js"></script> 
  <script>
	$(document).ready(function(){
		var obj = $("input[name='options'][checked]");
		if(obj.val().split(" ")[1]=="desc")
		   obj.parent().find('span').attr("class","glyphicon glyphicon-arrow-down");
		else obj.parent().find('span').attr("class","glyphicon glyphicon-arrow-up");
		var val = $("#ProductType").val();
		
		var obj2 = $("input[name='ptype'][value="+val+"]");
		obj2.attr("checked",true);
		
		obj2.parent().addClass("active");
		obj2.parent().siblings().removeClass("active");
	});
	
  function confirmPwd(){
	  if($("#pwd1").val()!=$("pwd2").val()){
		  alert("密码两次输入的不一致，请重新输入");
	  }
  }
  function checkPwd(){
	  if($("#pwd1").val().length<6){
		  alert("输入的密码位数不能小于六位！")
	  }
  }
  function submitForm(obj){
	  obj.find("input").attr("checked",true);
	  obj.siblings().find("input").attr("checked",false);
	  $("#indexForm").submit();
  }
  function toggle(obj){
	  obj.find("input").attr("checked",true);
	  obj.siblings().find("input").attr("checked",false);
	  $("#indexForm").submit();
  }
  function modifyinfo(id){
		$('#foodname').val($("div#"+id+ " .foodname").text());
		$('#PID').val(id);
   } 
  </script>
</body>
</html>
