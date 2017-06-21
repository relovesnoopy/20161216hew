<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
<title>castnet</title>
<link rel="stylesheet" href="./css/mypage.css">
<link rel="stylesheet" href="./css/style2.css">
</head>
<body>
	<div id="page">
		<header id="pageHead" >
<h1 id="siteTitle"><a href="top.jsp"  class="title"><img src="images/logo3.png" height="150px"></a></h1>
			<p id="catchcopy">自分だけの服装を見つけよう。服で楽しい毎日を</p>
			<nav class="globalNavi">
				<ul>
					<li ><a href="top.jsp">ホーム</a></li>
						<li><a href="" onclick="document.form1.submit();return false;">商品</a></li>
					<form name="form1" method="POST" action="Hew">
						<input type=hidden name="datawind" value="">
					</form>
						<li><a href="degi.jsp">デザイン</a></li>
						<li><a href="signup.jsp">会員登録</a></li>
						<%=log %>
						<li class="current"><a  href="mypage.jsp">マイページ</a></li>
						<li><a href="cart.jsp">カート</a></li>
				</ul>
			</nav>
		</header>
		<div id="pageBody">
			<section class="mainVisual">
				<h2>マイページ</h2>
					<ul>
						<li><a href=""onclick="document.hew.submit();return false;" >購入履歴</a></li>
						<form name="hew" method="POST" action="Hew">
							<input type="hidden" name="purhistory" value="">
						</form>
						<li><a href=""onclick="document.design.submit();return false;" >デザイン作成一覧</a></li>
						<form name="design" method="POST" action="Hew">
							<input type="hidden" name="designall" value="">
						</form>
						<li><a href=""onclick="document.favorite.submit();return false;" >お気に入り</a></li>
						<form name="favorite" method="POST" action="Hew">
							<input type="hidden" name="favoritehistory" value="">
						</form>
						<li><a href="pro.jsp">プロフィール変更</a></li>


					</ul>
			</section>
			<footer id="pageFoot">
				<p id="copyrigth"><small>Copyright&copy; 2016 @custnet All Right Reserved.</small></p>
				</footer>
		</div>
	</div>
</body>
</html>
