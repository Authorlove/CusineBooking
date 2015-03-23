<!DOCTYPE html>
<html lang="zh-cn">
<head>
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
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.html">Cusine美食网</a> </div>
    <div id="navbar" class="collapse navbar-collapse">
      <form class="navbar-form navbar-right" role="search">
        <select class="form-control" onChange="$('search').attr('placeholder','请输入商家名称'）;">
          <option class="form-control" value="1">美食</option>
          <option class="form-control">商家</option>
        </select>
        <div class="form-group">
          <input type="text" id="search" class="form-control" placeholder="请输入美食名称">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <ul class="nav navbar-nav navbar-left">
        <li data-toggle="modal" data-target="#myModal1"><a href="#">登陆</a></li>
        <li data-toggle="modal" data-target="#myModal2"><a href="#">注册</a></li>
        <li class="active"><a href="customer_order.html">我的订单</a></li>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">我是商家 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li data-toggle="modal" data-target="#myModal3"><a href="#">登陆</a></li>
            <li class="divider"></li>
            <li data-toggle="modal" data-target="#myModal4"><a href="#">注册</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!--/.nav-collapse --> 
  </div>
</nav>
<br><br><br>
<!--我的订单部分-->
<div class="container">
<div class="table-responsive">
   <table class="table">
      <caption>我的订单</caption>
      <thead>
         <tr>
            <th>美食名称</th>
            <th>商家名称</th>
            <th>美食价格</th>
            <th>下单时间</th>
            <th>是否付款</th>
            <th>卖家是否确认订单</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td>XXX</td>
             <td>XXX</td>
             <td>XXX</td>
              <td>XXX</td>
               <td>XXX</td>
                <td>XXX</td>
         </tr>
         <tr>
          <td>XXX</td>
             <td>XXX</td>
             <td>XXX</td>
              <td>XXX</td>
               <td>XXX</td>
                <td>XXX</td>
         </tr>
         <tr>
            <td>XXX</td>
             <td>XXX</td>
             <td>XXX</td>
              <td>XXX</td>
               <td>XXX</td>
                <td>XXX</td>
         </tr>
         <tr>
           <td>XXX</td>
             <td>XXX</td>
             <td>XXX</td>
              <td>XXX</td>
               <td>XXX</td>
                <td>XXX</td>
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
            <th>美食名称</th>
            <th>商家名称</th>
            <th>美食价格</th>
            <th>下单时间</th>
            <th>美食评价</th>
         </tr>
      </thead>
      <tbody>
         <tr>
            <td>XXX</td>
             <td>XXX</td>
             <td>XXX</td>
              <td>XXX</td>
               <td>XXX</td>
         </tr>
         <tr>
          <td>XXX</td>
             <td>XXX</td>
             <td>XXX</td>
              <td>XXX</td>
               <td>XXX</td>
         </tr>
         <tr>
            <td>XXX</td>
             <td>XXX</td>
             <td>XXX</td>
              <td>XXX</td>
               <td>XXX</td>
         </tr>
         <tr>
           <td>XXX</td>
             <td>XXX</td>
             <td>XXX</td>
              <td>XXX</td>
               <td>XXX</td>
         </tr>
      </tbody>
   </table>
   
   </div>
</div>  	
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.2.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.min.js"></script> 
</body>
</html>