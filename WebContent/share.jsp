<%@page import="domain.commodity"%>
<%@page import="domain.Users"%>
<%@page import="java.util.List"%>
<%@page import="repository.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="gbk">
<title>首页</title>
<meta name="keywords" content="个人博客" />
<meta name="description" content="个人博客" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/m.css" rel="stylesheet">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/comm.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<%String ID =request.getParameter("user_id"); %>
</head>
<body>
<header class="header-navigation" id="header">
  <nav><div class="logo"><a href="/">个人博客</a></div>
    <h2 id="mnavh"><span class="navicon"></span></h2>
    <ul id="starlist">
      <li><a href="index.jsp?user_id=<%=request.getParameter("user_id") %>">网站首页</a></li>
      <li><a href="share.jsp?user_id=<%=request.getParameter("user_id") %>">浏览</a></li>
      <li><a href="list.jsp?user_id=<%=request.getParameter("user_id") %>">我的文章</a></li>
      <li><a href="doDispaturetomain.do?user_id=<%=ID %>">个人信息</a></li>
      <li><a href="gbook.jsp?user_id=<%=request.getParameter("user_id") %>">留言</a></li>
      <li><a href="info.jsp?user_id=<%=request.getParameter("user_id") %>">发布文章</a></li>
      <li><a href="infopic.jsp?user_id=<%=request.getParameter("user_id") %>">其他</a></li>
      <li><a href="login.jsp">退出</a></li>
    </ul>
</nav>
</header>
<article>
  <div class="picbox">
    <ul>
      <li data-scroll-reveal="enter bottom over 1s" ><a href="/"><i><img src="images/1.jpg"></i>
        <div class="picinfo">
          <h3>已关注人最近发表的内容</h3>
          <span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。</span> </div>
        </a></li>
       <li data-scroll-reveal="enter bottom over 1s" ><a href="/"><i><img src="images/2.jpg"></i>
        <div class="picinfo">
          <h3>热门内容</h3>
          <span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。</span> </div>
        </a></li>
    </ul>
    <ul>
        <li data-scroll-reveal="enter bottom over 1s" ><a href="/"><i><img src="images/3.jpg"></i>
        <div class="picinfo">
          <h3>推荐内容</h3>
          <span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。</span> </div>
        </a></li>
          <li data-scroll-reveal="enter bottom over 1s" ><a href="/"><i><img src="images/5.jpg"></i>
        <div class="picinfo">
          <h3>已关注人最近发表的内容</h3>
          <span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。</span> </div>
        </a></li>
    </ul>
    <ul>
          <li data-scroll-reveal="enter bottom over 1s" ><a href="/"><i><img src="images/7.jpg"></i>
        <div class="picinfo">
          <h3>热门内容</h3>
          <span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。</span> </div>
        </a></li>
          <li data-scroll-reveal="enter bottom over 1s" ><a href="/"><i><img src="images/8.jpg"></i>
        <div class="picinfo">
          <h3>推荐内容</h3>
          <span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。</span> </div>
        </a></li> 
    </ul>
    <ul>
       <li data-scroll-reveal="enter bottom over 1s" ><a href="/"><i><img src="images/4.jpg"></i>
        <div class="picinfo">
          <h3>已关注人最近发表的内容</h3>
          <span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。</span> </div>
        </a></li>
          <li data-scroll-reveal="enter bottom over 1s" ><a href="/"><i><img src="images/6.jpg"></i>
        <div class="picinfo">
          <h3>热门内容</h3>
          <span>好咖啡要和朋友一起品尝，好“模板”也要和同样喜欢它的人一起分享。</span> </div>
        </a></li>
    </ul>
  </div>
  <div class="pagelist"><a class="allpage"><b>99</b></a>&nbsp;&nbsp;<a href="#" class="curPage">1</a>&nbsp;&nbsp;<a href="#" onclick="page(2)">2</a>&nbsp;&nbsp;<a href="#" onclick="page(3)">3</a>&nbsp;&nbsp;<a href="#" onclick="page(4)">4</a>&nbsp;&nbsp;<a href="#" onclick="page(5)">5</a>&nbsp;&nbsp;<a href="#" onclick="page(6)">6</a>&nbsp;&nbsp;<a href="#" onclick="page(7)">7</a>&nbsp;&nbsp;<a href="#" onclick="page(8)">8</a>&nbsp;&nbsp;<a href="#" onclick="page(9)">9</a>&nbsp;&nbsp;<a href="#" onclick="page(2)">下一页</a></div>
</article>
<footer>
  <p>Design by 网工161 刘杰2016121003 </p>
</footer>
<a href="#" class="cd-top">Top</a>
<script>
	if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
		(function(){
			window.scrollReveal = new scrollReveal({reset: true});
		})();
	};
</script>
</body>
</html>
