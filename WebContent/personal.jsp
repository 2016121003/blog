<%@page import="domain.Users"%>
<%@page import="java.util.List"%>
<%@page import="repository.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>个人信息</title>
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
<%String ID =request.getParameter("user_id"); %>
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
					<a class="navbar-brand" href="#">个人博客</a>
					
				</div>
				<%
							request.setCharacterEncoding("UTF-8");
							response.setCharacterEncoding("UTF-8");
							response.setContentType("text/html;charset = UTF-8");
							String user_id = (String)request.getAttribute("user_id");
							Users users = UserDAO.doQP(user_id);
							if(users!=null)
							{
						%><!-- 调用 doQP显示用户的所有信息-->
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						  <li><a href="index.jsp?user_id=<%=request.getParameter("user_id") %>">网站首页</a></li>
					      <li><a href="share.jsp?user_id=<%=request.getParameter("user_id") %>">浏览</a></li>
					      <li><a href="list.jsp?user_id=<%=request.getParameter("user_id") %>">我的文章</a></li>
					      <li><a href="doDispaturetomain.do?user_id=<%=ID %>">个人信息</a></li>
					      <li><a href="gbook.jsp?user_id=<%=request.getParameter("user_id") %>">留言</a></li>
					      <li><a href="info.jsp?user_id=<%=request.getParameter("user_id") %>">发布文章</a></li>
					      <li><a href="infopic.jsp?user_id=<%=request.getParameter("user_id") %>">其他</a></li>
					      <li><a href="login.jsp">退出</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
		<!-- 导航栏 结束-->
		<!-- Begin page content -->
		<div class="container">
			<div class="page-header">
				<h1>个人信息</h1>
			</div>
			<form method="post" action="doPupdate.do">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>用户ID</th>
							<th>用户名</th>
							<th>性别</th>
							<th>eamil</th>
							<th>电话</th>
							<th>密码</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						

						<tr>
						 
							<td><input  name="user_id" type="hidden"  value="<%=users.getUser_id() %>"><%=users.getUser_id() %></td>
							<td><input  name="username" type="text" required="required" value="<%=users.getUsername() %>"></td>
							<td><input  name="sex" type="text" required="required" value="<%=users.getSex()%>"></td>
							<td><input  name="email" type="text" required="required" value="<%=users.getEmail()%>"></td>
							<td><input  name="phone" type="text" required="required" value="<%=users.getPhone()%>"></td>
							<td><input  name="password" type="text" required="required" value="<%=users.getPassword()%>"></td>
							<td><button class="but" type="submit" onClick="check()">修改</button>&nbsp;&nbsp;</td>
						</tr>
					<%
						}else
						{
							response.setHeader("refresh", "0;URL=login.jsp");
						}
					%>
      		
					</tbody>
				</table>
			</div>
			</form>
		</div>
	</div>

	<div id="footer">
		<div class="container">
			<p class="text-muted credit">用户信息表</p>
		</div>
	</div>
	<!-- script references -->
	<script type='text/javascript' src="js/jquery-1.9.1.min.js"></script>
	<script type='text/javascript' src="js/bootstrap.min.js"></script>
</body>
</html>