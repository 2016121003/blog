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
  <aside class="l_box">
 <div class="search">
      <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
        <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字词" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字词'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字词'}" type="text">
        <input name="show" value="title" type="hidden">
        <input name="tempid" value="1" type="hidden">
        <input name="tbname" value="news" type="hidden">
        <input name="Submit" class="input_submit" value="搜索" type="submit">
      </form>
    </div>
     <div class="tuijian">
        <h2>已关注的人的内容</h2>
        <ul>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">你是什么人便会遇上什么人</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">第二届 优秀个人博客模板比赛参选活动</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">个人博客模板《绅士》后台管理</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">你是什么人便会遇上什么人</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">第二届 优秀个人博客模板比赛参选活动</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">个人博客模板《绅士》后台管理</a></li>
        </ul>
      </div>
      <div class="tuijian">
        <h2>站长推荐</h2>
        <ul>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">你是什么人便会遇上什么人</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">第二届 优秀个人博客模板比赛参选活动</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">个人博客模板《绅士》后台管理</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">你是什么人便会遇上什么人</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">第二届 优秀个人博客模板比赛参选活动</a></li>
          <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">个人博客模板《绅士》后台管理</a></li>
        </ul>
      </div>
       <div class="tuijian">
      <h2>热门</h2>
      <ul>
        <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">你是什么人便会遇上什么人</a></li>
        <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
        <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">第二届 优秀个人博客模板比赛参选活动</a></li>
        <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">个人博客模板《绅士》后台管理</a></li>
        <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">你是什么人便会遇上什么人</a></li>
        <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
        <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">第二届 优秀个人博客模板比赛参选活动</a></li>
        <li><a href="article.jsp?user_id=<%=request.getParameter("user_id") %>">个人博客模板《绅士》后台管理</a></li>
      </ul>
    </div>
<div class="cloud">
      <h2>标签云</h2>
      <ul>
        <a href="/">陌上花开</a> <a href="/">校园生活</a> <a href="/">html5</a> <a href="/">SumSung</a> <a href="/">青春</a> <a href="/">温暖</a> <a href="/">阳光</a> <a href="/">三星</a><a href="/">索尼</a> <a href="/">华维荣耀</a> <a href="/">三星</a> <a href="/">索尼</a>
      </ul>
    </div>
  </aside>
  <main class="r_box">
    <li><i><a href="/"><img src="images/1.jpg"></a></i>
      <h3><a href="/">你是什么人便会遇上什么人</a></h3>
      <p>有时就为了一句狠话，像心头一口毒钉，永远麻痺着亲密感情交流。恶言，真要慎出，平日多誠心爱语，乃最简易之佈施。</p>
    </li>
    <li><i><a href="/"><img src="images/2.jpg"></a></i>
      <h3><a href="/">爱情没有永远，地老天荒也走不完</a></h3>
      <p>也许，爱情没有永远，地老天荒也走不完，生命终结的末端，苦短情长。站在岁月的边端，那些美丽的定格，心伤的绝恋，都被四季的掩埋，一去不返。徒剩下这荒芜的花好月圆，一路相随，流离天涯背负了谁的思念？</p>
    </li>
    <li><i><a href="/"><img src="images/3.jpg"></a></i>
      <h3><a href="/">女孩都有浪漫的小情怀——浪漫的求婚词</a></h3>
      <p>还在为浪漫的求婚词而烦恼不知道该怎么说吗？女孩子都有着浪漫的小情怀，对于求婚更是抱着满满的浪漫期待，也希望在求婚那一天对方可以给自己一个最浪漫的求婚词。</p>
    </li>
    <li><i><a href="/"><img src="images/4.jpg"></a></i>
      <h3><a href="/">擦肩而过</a></h3>
      <p>《擦肩而过》文/清河鱼 编绘/天朝羽打开一扇窗，我不曾把你想得平常。看季节一一过往。你停留的那个地方，是否依然花儿开放？在夜里守靠着梦中的，想那仿佛前世铭刻进心肠的</p>
    </li>
    <li>
      <h3><a href="/">女孩都有浪漫的小情怀——浪漫的求婚词</a></h3>
      <p>还在为浪漫的求婚词而烦恼不知道该怎么说吗？女孩子都有着浪漫的小情怀，对于求婚更是抱着满满的浪漫期待，也希望在求婚那一天对方可以给自己一个最浪漫的求婚词。</p>
    </li>
    <li><i><a href="/"><img src="images/5.jpg"></a></i>
      <h3><a href="/">擦肩而过</a></h3>
      <p>《擦肩而过》文/清河鱼 编绘/天朝羽打开一扇窗，我不曾把你想得平常。看季节一一过往。你停留的那个地方，是否依然花儿开放？在夜里守靠着梦中的，想那仿佛前世铭刻进心肠的</p>
    </li>
    <li><i><a href="/"><img src="images/6.jpg"></a></i>
      <h3><a href="/">女孩都有浪漫的小情怀——浪漫的求婚词</a></h3>
      <p>还在为浪漫的求婚词而烦恼不知道该怎么说吗？女孩子都有着浪漫的小情怀，对于求婚更是抱着满满的浪漫期待，也希望在求婚那一天对方可以给自己一个最浪漫的求婚词。</p>
    </li>
    <li><i><a href="/"><img src="images/7.jpg"></a></i>
      <h3><a href="/">你是什么人便会遇上什么人</a></h3>
      <p>有时就为了一句狠话，像心头一口毒钉，永远麻痺着亲密感情交流。恶言，真要慎出，平日多誠心爱语，乃最简易之佈施。</p>
    </li>
    <li><i><a href="/"><img src="images/8.jpg"></a></i>
      <h3><a href="/">爱情没有永远，地老天荒也走不完</a></h3>
      <p>也许，爱情没有永远，地老天荒也走不完，生命终结的末端，苦短情长。站在岁月的边端，那些美丽的定格，心伤的绝恋，都被四季的掩埋，一去不返。徒剩下这荒芜的花好月圆，一路相随，流离天涯背负了谁的思念？</p>
    </li>
    <li><i><a href="/"><img src="images/9.jpg"></a></i>
      <h3><a href="/">擦肩而过</a></h3>
      <p>《擦肩而过》文/清河鱼 编绘/天朝羽打开一扇窗，我不曾把你想得平常。看季节一一过往。你停留的那个地方，是否依然花儿开放？在夜里守靠着梦中的，想那仿佛前世铭刻进心肠的</p>
    </li>
    <div class="pagelist"><a class="allpage"><b>99</b></a>&nbsp;&nbsp;<a href="#" class="curPage">1</a>&nbsp;&nbsp;<a href="#" onclick="page(2)">2</a>&nbsp;&nbsp;<a href="#" onclick="page(3)">3</a>&nbsp;&nbsp;<a href="#" onclick="page(4)">4</a>&nbsp;&nbsp;<a href="#" onclick="page(5)">5</a>&nbsp;&nbsp;<a href="#" onclick="page(6)">6</a>&nbsp;&nbsp;<a href="#" onclick="page(7)">7</a>&nbsp;&nbsp;<a href="#" onclick="page(8)">8</a>&nbsp;&nbsp;<a href="#" onclick="page(9)">9</a>&nbsp;&nbsp;<a href="#" onclick="page(2)">下一页</a></div>
  </main>
</article>
<footer>
  <p>Design by 网工161 刘杰2016121003 </p>
</footer>
<a href="#" class="cd-top">Top</a>
</body>
</html>
