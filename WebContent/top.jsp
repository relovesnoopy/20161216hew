<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//データベース接続
//デザイン可能商品を表示
session.getAttribute("count");

String log="<li><a href=\"login.jsp\">ログイン</a></li>";
if(session.getAttribute("uid")!=null){
	//log="ログアウト";
	log="<li><a href=\"logout.jsp\">ログアウト</a></li>";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./css/style2.css">
<link rel="stylesheet" href="./css/normalize.css">
<script src="./js/jquery-1.10.1.min.js"></script>
<script src="./js/jquery.bxslider/jquery.bxslider.js"></script>
<link rel="stylesheet" href="./js/jquery.bxslider/jquery.bxslider.css">
<script>
$(document).ready(function(){
	$('.bxslider').bxSlider();
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="page">
		<header id="pageHead" >
			<h1 id="siteTitle"><a href="top.jsp"  class="title"><img src="images/logo3.png" height="150px"></a></h1>
			<p id="catchcopy">自分だけの服装を見つけよう。服で楽しい毎日を</p>
			<nav class="globalNavi">
				<ul>
					<li class="current"><a href="top.jsp">ホーム</a></li>
					<li><a href="" onclick="document.form1.submit();return false;">商品</a></li>
					<form name="form1" method="POST" action="Hew">
						<input type=hidden name="datawind" value="">
					</form>
					<li><a href="degi.jsp">デザイン</a></li>
					<li><a href="signup.jsp">会員登録</a></li>
					<%=log %>
					<li><a  href="mypage.jsp">マイページ</a></li>
					<li><a href="cart.jsp">カート</a></li>
				</ul>
			</nav>
		</header>
		<div id="pageBody">
		<section class="mainVisual">
			<ul class="bxslider">
				<li>
					<img src="images/main.jpg" alt="" width="980" height="700">
				</li>
				<li>
					<img src="images/main2.jpg" alt="" width="980" height="700">
				</li>
			</ul>
		</section>
		<div id="pageBodySub">
			<section class="newsList">
				<h2>お知らせ</h2>
				<ul>
					<li>2017.1.28:custnetと他社がコラボ企画を開始！</li>
					<li>custnetと他社がコラボ企画を開始！</li>
				</ul>
			</section>
		</div>
		</div>
		<footer id="pageFoot">
			<p id="copyrigth"><small>Copyright&copy;2016 @custanet All Right Reserved.</small></p>
		</footer>
	</div>
</body>
</html>