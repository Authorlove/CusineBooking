<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"
		+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%= basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>My product</title>
</head>

<body>
	hello product!!!
	<form action="/Cusine/handleProduct.htm" enctype="multipart/form-data" method="post">
		<input type="text" name="name" placeholder="name"><br>
		<input type="number" name="price" placeholder="price"
			value="12.5"><br>
		<input type="file" name="iCusinePic"><br>
		<input type="number" name="saleVolume" placeholder="sale volume"
			value="100"><br>
		<input type="text" name="ptype" placeholder="product type"
			value="YueCai"><br>
		<input type="number" name="sellerID" placeholder="sellerID"><br>
		<input type="submit" value="Done">
	</form>
</body>
</html>