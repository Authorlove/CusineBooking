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
      <form class="navbar-form navbar-right" role="search"
      	action="/Cusine/searchProduct.htm" method="post">
        <div class="form-group">
          <input type="text" id="search" class="form-control" placeholder="请输入美食名称"
          	name="productName">
        </div>
       	<input type="hidden" name="account" value="${seller.account}"/>
       	<input type="hidden" name="pwd" value="${seller.pwd}"/>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <ul class="nav navbar-nav navbar-left">
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">${seller.sellerName}<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li data-toggle='modal' data-target="#modifyInfoModal"><a>修改个人信息</a></li>
            <li class="divider"></li>
            <li><a href="#">退出</a></li>
          </ul>
        </li>
        <li role="presentation">
        	<a href="/Cusine/takeOrder.htm?account=${seller.account}&pwd=${seller.pwd}">订单
				<span class="badge badge-danger" style="background-color:#F00">42</span>
			</a>
		</li>
      	
      </ul>
    </div>
    <!--/.nav-collapse --> 
  </div>
</nav>
<br><br><br><br>
<div class="container">
    <div class="row">
   <form class="form-inline col-md-6  btn-group" id="sortForm"
   		action="/Cusine/sortProduct.htm" method="post">
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
     <input type="hidden" name="account" value="${seller.account}" />
     <input type="hidden" name="pwd" value="${seller.pwd}"/>
    </form>
          <button type="button" class="btn btn-primary col-md-1 col-md-offset-5" data-toggle='modal' 
      	data-target="#newModal"> 新建美食 </button>
  </div>
  <br>

	<div class="row" >
		<c:forEach var="product" items="${productList}">
	  		<div class="col-sm-6 col-md-4" id="${product.productID}">
	      		<div class="thumbnail"> <!-- <img src="images/slide1.jpg" alt="..."> -->
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
		          			data-toggle="modal" data-target="#modifyModal"
		          			onclick="modifyinfo(${product.productID})">修改</a> 
		          		<a onclick="deleteFood(${product.productID})" 
		          			class="btn btn-default" role="button">删除</a></p>
	    			</div>
	    		</div>
	   		</div>
   		</c:forEach>
	</div>
  	
</div>
<!-- Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h3 class="modal-title" id="myModalLabel">修改美食信息</h3>
      </div>
      <div class="modal-body">
        <form role="form" enctype="multipart/form-data" 
        	action="/Cusine/updateProduct.htm" method="post">
        <div class="form-group">
        	<label for="input_img1">修改图片</label>
            <input onchange="changeImg()" type="file" class="form-control" id="input_img1" 
            	accept="image/*" name="iCusinePic"/>
        </div>
          <div class="form-group">
            <label for="foodname">菜名</label>
            <input type="text" class="form-control" id="foodname" required
            	name="name">
          </div>
          <div class="form-group">
            <label for="foodtype">类型</label>
            <select class="form-control" name="ptype" required>
	            <c:forEach var="type" items="<%= Constants.ProductType.ptype %>">
	            	<option value="${type}">${type}</option>
	            </c:forEach>
            </select>
          </div>
          <div class="form-group">
            <label for="price">价格</label>
            <input type="text" class="form-control" id="price" required
            	maxlength="5" name="price">
          </div>
          <div>
          	<input type="hidden" name="productID" id="PID" value=""/>
	       	<input type="hidden" name="sellerID" value="${seller.sellerID}">
	       	<input type="hidden" name="account" value="${seller.account}">
	       	<input type="hidden" name="pwd" value="${seller.pwd}">
       	</div>
          <button type="submit" class="btn btn-primary btn-lg">确认</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="newModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h3 class="modal-title" id="myModalLabel">新建美食</h3>
      </div>
      <div class="modal-body">
        <form role="form" action="/Cusine/addProduct.htm" enctype="multipart/form-data" method="post">
          <div class="form-group">
            <label for="foodname">菜名</label>
            <input type="text" class="form-control" name="name" required>
          </div>
          <div class="form-group">
            <label for="foodtype">类型</label>
            <select class="form-control" name="ptype" required>
	            <c:forEach var="type" items="<%= Constants.ProductType.ptype %>">
	            	<option value="${type}">${type}</option>
	            </c:forEach>
            </select>
          </div>
          <div class="form-group">
            <label for="price">价格</label>
            <input type="text" class="form-control" id="price" required
            	name="price">
          </div>
          <!--  <img class="thumbnail" id="uploadimg" src=""> -->
   		<div class="form-group">
        	<label for="input_img2">上传图片</label>
            <input onchange="uploadImg()" type="file" class="form-control" 
            	id="input_img2" accept="image/*"
            	name="iCusinePic" />
       	</div>
       	<div>
	       	<input type="hidden" name="sellerID" value="${seller.sellerID}">
	       	<input type="hidden" name="account" value="${seller.account}">
	       	<input type="hidden" name="pwd" value="${seller.pwd}">
       	</div>
        <button type="submit" class="btn btn-primary btn-lg">确认</button>
        </form>
      </div>
    </div>
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
<script>
	$(document).ready(function(){
		var obj = $("input[name='options'][checked]");
		if(obj.val().split(" ")[1]=="desc")
		   obj.parent().find('span').attr("class","glyphicon glyphicon-arrow-down");
		else obj.parent().find('span').attr("class","glyphicon glyphicon-arrow-up");
	});
	function changeImg(){
		$('#changefoodimg').attr('src',$('#input_img1').val());
	}
	function uploadImg(){
		$('#uploadimg').attr('src',$('#input_img2').val());
	}
    function modifyinfo(id){
		$('#foodimg').attr('src',$("div#"+id+ " img").attr('src'));
		$('#foodname').val($("div#"+id+ " .foodname").text());
		$('#price').val($("div#"+id+ " .price").text());
		$('#PID').val(id);
	 } 
	  function toggle(obj){
		  obj.find("input").attr("checked",true);
		  obj.siblings().find("input").attr("checked",false);
		  $("#sortForm").submit();
	  }
	  function deleteFood(id){
		  //alert(id);
		  $.post("/Cusine/deleteProduct.htm",
				  {"productID":id},
				  function(data,status){
					  if(status=="success")
					 	 $("#"+id).css("display","none");
					  else
						  alert("Fucking error!");
				  });
	  }
</script>  
</body>
</html>