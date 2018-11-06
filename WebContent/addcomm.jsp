<!-- 新增商品信息 -->
<%@page import="domain.commodity"%>
<%@page import="domain.Users"%>
<%@page import="java.util.List"%>
<%@page import="repository.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>新增商品信息</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">

<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
   <style type="text/css"> 
   body{ background-image: url(image/e.jpg); }
   </style>
<link href="css/main1.css" rel="stylesheet">
<script type="text/javascript">
	function check(){
		alert("修改成功！");
	}

</script>
</head>
<body>
	<!-- Wrap all page content here -->
	<div id="wrap">

		<!-- Fixed navbar -->
		<!-- 导航栏 开始-->
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Project</a>
				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="admincomm.jsp">管理商品信息</a></li>
						<li class="active"><a href="addcomm.jsp">新增商品信息</a></li>
						<li><a href="login.html">退出</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
		<!-- 导航栏 结束-->
		<!-- Begin page content -->
		<div class="container">
			<div class="page-header">
				<h1>商品列表</h1>
			</div>
			<form method="post" action="doAddcomm.do">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>商品ID</th>
							<th>商品名</th>
							<th>商品类别</th>
							<th>商品价格</th>
							<th>作者</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					<tr>
						
							<td><input  name="cId" type="text" required="required"></td>
							<td><input  name="cname" type="text" required="required"></td>
							<td><input  name="cate" type="text" required="required"></td>
							<td><input  name="price" type="text" required="required"></td>
							<td><input  name="writer" type="text" required="required"></td>
							<td><button class="but" type="submit">提交</button></td>
						</tr>
					
      		
					</tbody>
				</table>
			</div>
			</form>
			
		</div>
	</div>

	<div id="footer">
		<div class="container">
			<p class="text-muted credit">新增商品信息</p>
		</div>
	</div>

	<!-- script references -->
	<script type='text/javascript' src="js/jquery-1.9.1.min.js"></script>
	<script type='text/javascript' src="js/bootstrap.min.js"></script>
</body>
</html>