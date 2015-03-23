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
<html lang="zh-cn">
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cusine</title>
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
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="/Cusine/index.htm">Cusine美食网</a> </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-left">
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">${seller.sellerName}<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li data-toggle='modal' data-target="#modifyInfoModal"><a>修改个人信息</a></li>
            <li class="divider"></li>
            <li><a href="#">退出</a></li>
          </ul>
        </li>
        <li role="presentation" class="active">
        	<a>订单
				<span class="badge badge-danger" style="background-color:#F00">42</span>
			</a>
		</li>
      	
      </ul>
    </div>
    <!--/.nav-collapse --> 
  </div>
</nav>
<br>
<br>
<br>
<!--我的订单部分-->
<div class="container">
<div class="table-responsive">
   <table class="table">
      <caption>新的订单</caption>
      <thead>
         <tr>
            <th>客户名称</th>
            <th>美食名称</th>
            <th>客户电话</th>
            <th>客户地址</th>
            <th>下单时间</th>
            <th>是否付款</th>
            <th>确认订单</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td>梁文道</td>
             <td>紫菜汤</td>
             <td>13660173974</td>
              <td>华工C12</td>
               <td>2015/01/10</td>
                <td>否</td>
                <td>  <button  type="submit" class="btn btn-primary ">确认订单</button></td>
         </tr>
         <tr>
           <td>黄大狗</td>
             <td>白切鸡饭</td>
             <td>13660173574</td>
              <td>华工C12</td>
               <td>2015/01/10</td>
                <td>是</td>
                  <td>  <button  type="submit" class="btn btn-primary ">确认订单</button></td>
         </tr>
         <tr>
             <td>小萝莉</td>
             <td>隆江猪脚饭</td>
             <td>13620173574</td>
              <td>华工C12</td>
               <td>2015/01/09</td>
                <td>是</td>
                  <td>  <button type="submit" class="btn btn-primary">确认订单</button></td>
         </tr>
         <tr>
           <td>黄丹</td>
             <td>白切鸡饭</td>
             <td>13920173574</td>
			 <td>华工C12</td>
              <td>2015/01/09</td>
                <td>是</td>
                  <td>  <button type="submit" class="btn btn-primary">确认订单</button></td>
         </tr>
      </tbody>
   </table>
     
</div>   
   
   
<!--订单历史部分-->
 <h3><br></h3>
<div  class="table-responsive">
   <table class="table">
      <caption>订单历史</caption>
      <thead>
         <tr>
            <th>客户名称</th>
            <th>美食名称</th>
            <th>客户电话</th>
            <th>客户评价</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td>黄文</td>
             <td>紫菜汤</td>
             <td>13920173574</td>
              <td>汤有点咸，但味道不错</td>
         </tr>
         <tr>
          <td>王芳</td>
             <td>叉烧排骨饭</td>
             <td>13120173574</td>
               <td>饭真的好少啊</td>
         </tr>
         <tr>
            <td>刘大大</td>
             <td>隆江猪脚饭</td>
             <td>13120173572</td>
              <td>猪脚好吃</td>
         </tr>
         <tr>
           <td>何世林</td>
             <td>炸酱粉</td>
             <td>13620173572</td>
              <td>炸酱粉真的好好吃啊，下次继续</td>
         </tr>
      </tbody>
   </table>
   
   </div>
</div> 
<!-- Modal -->
<div class="modal fade" id="modifyInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h3 class="modal-title" id="myModalLabel">修改个人信息</h3>
      </div>
      <div class="modal-body">
        <form role="form" action="/Cusine/handleSellerUpdate.htm" method="post">
          <div class="form-group">
            <label>账号</label>
            <input type="email" class="form-control" placeholder="邮箱" 
            	name="account" value="${seller.account}">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">密码</label>
            <input type="password" class="form-control" id="exampleInputPassword1" 
            	placeholder="Password" name="pwd" value="${seller.pwd}">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">确认密码</label>
            <input type="password" class="form-control" id="exampleInputPassword1" 
            	placeholder="Confirm Password">
          </div>
          <div class="form-group">
            <label for="username">姓名</label>
            <input type="text" class="form-control" id="username" 
            	placeholder="Enter username" 
            	name="sellerName" value="${seller.sellerName}">
          </div>
          <div class="form-group">
            <label for="username">手机</label>
            <input type="tel" class="form-control" id="username" 
            	placeholder="Enter user phone" 
            	name="sellerPhone" value="${seller.sellerPhone}">
          </div>
          <div class="form-group">
            <label for="username">门店名称</label>
            <input type="text" class="form-control" id="username" 
            	placeholder="Enter username" 
            	name="storeName" value="${seller.storeName}">
          </div>
          <div class="form-group">
            <label>省份</label>
            <input type="text" class="form-control" id="province"
            	name="province" value="${seller.address.province}">
          </div>
          <div class="form-group">
            <label for="city">城市</label>
            <input type="text" class="form-control" id="city" name="city"
            	value="${seller.address.city}">
          </div>
          <div class="form-group">
            <label>区域</label>
            <input type="text" class="form-control" id="area" name="district"
            	value="${seller.address.district}">
          </div>
          <div class="form-group">
            <label>固定电话</label>
            <input type="tel" class="form-control" placeholder="Enter store phone" 
            	name="storePhone" value="${seller.storePhone}">
          </div>
          <input type="hidden" name="sellerID" value="${seller.sellerID}"/>
          <button type="submit" class="btn btn-lg btn-primary">确认</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.2.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.min.js"></script>
</body>
</html>