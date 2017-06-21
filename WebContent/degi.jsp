<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String log="<li><a href=\"login.jsp\">ログイン</a></li>";
if(session.getAttribute("uid")!=null){
	//log="ログアウト";
	log="<li><a href=\"logout.jsp\">ログアウト</a></li>";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./css/logconf.css">
<link rel="stylesheet" href="./css/style2.css">
</head>
<body>
	<div id="page">
		<header id="pageHead" >
<h1 id="siteTitle"><a href="top.jsp"  class="title"><img src="images/logo3.png" height="150px"></a></h1>
			<p id="catchcopy">自分だけの服装を見つけよう。服で楽しい毎日を</p>
			<nav class="globalNavi">
				<ul>
					<li><a href="top.jsp">ホーム</a></li>
					<li><a href="" onclick="document.form1.submit();return false;">商品</a></li>
					<form name="form1"  method="POST" action="Hew">
						<input type=hidden name="datawind" value="">
					</form>
					<li class="current"><a href="degi.jsp">デザイン</a></li>
					<li><a href="signup.jsp">会員登録</a></li>
					<%=log %>
					<li><a  href="mypage.jsp">マイページ</a></li>
					<li><a href="cart.jsp">カート</a></li>
				</ul>
			</nav>
		</header>
		<fieldset>
			<img src="images/dezi.png" alt="" width="980" height="600">
			<a href="./degignwindow.jsp" class="popup"  onclick="window.open('./degignwindow.jsp', 'new','width=750,height=750,top=80,left=425,resizable=no'); return false;" >デザインする</a>
			<form action="Hew" method="post">
				<button type="submit" name="toukou">公開デザイン</button>
				<input type="hidden" name="publicopen">
			</form>
		</fieldset>

		<footer id="pageFoot">
			<p id="copyrigth"><small>Copyright&copy; 2016 @custanet All Right Reserved.</small></p>
		</footer>
	</div>
</body>
</html>