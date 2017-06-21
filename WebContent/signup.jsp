<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String log="<li><a href=\"login.jsp\">ログイン</a></li>";
if(session.getAttribute("uid")!=null){
	//log="ログアウト";
	log="<li><a href=\"logout.jsp\">ログアウト</a></li>";
}
String disp = (String)request.getAttribute("signup");
if(disp=="notrepass"){
	disp="パスワードが未一致です";
}
else {
	disp="";
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./external/jquery/jquery.js"></script>
<script src="./jquery-ui.js"></script>
<script src="./js/confilm.js"></script>
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
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
					<form name="form1" method="POST" action="Hew">
						<input type=hidden name="datawind" value="">
					</form>
						<li><a href="degi.jsp">デザイン</a></li>
						<li class="current"><a href="signup.jsp">会員登録</a></li>
						<%=log %>
						<li><a  href="mypage.jsp">マイページ</a></li>
						<li><a href="cart.jsp">カート</a></li>
					</ul>
				</nav>
			</header>
		<fieldset>
			<h2>会員登録</h2>
			<p><font size="2" color="red"><%=disp %></font></p>
			<form id="form" action="Hew" method="POST">
				<table>
					<tr>
						<td class="conf">姓:</td><td><input type="text" name="fname"/></td>
					</tr>
					<tr>
						<td class="conf">名:</td><td><input type="text" name="lname"/></td>
					</tr>
					<tr>
						<td class="conf">性別:</td>
						<td>
							<input type="radio" name="sex" value="0" checked/>男
							<input type="radio" name="sex" value="1"/>女
						</td>
					</tr>
					<tr>
						<td class="conf">電話番号:</td>
						<td><input type="text" name="tel"/></td>
					</tr>
					<tr>
						<td class="conf">メールアドレス:</td>
						<td><input type="email" name="mail"/></td>
					</tr>
					<tr>
						<td class="conf">郵便番号:</td>
						<td><input type="text" name="zip11" size="10" maxlength="8" onKeyUp="AjaxZip3.zip2addr(this,'','addr11','addr11');"/></td>
					</tr>
					<tr>
						<td class="conf">住所:</td>
						<td><input type="text" name="addr11" size="60"/></td>
					</tr>
					<tr>
						<td class="conf">パスワード:</td>
						<td><input type="password" name="passwd"/></td>
					</tr>
					<tr>
						<td class="conf">パスワード確認:</td>
						<td><input type="password" name="repasswd"/></td>
					</tr>
				</table>
				<div class="signup">
						<input class="submit" type="submit" name="signup" value="確認画面"/>
				</div>
			</form>
		</fieldset>
		<footer id="pageFoot">
			<p id="copyrigth"><small>Copyright&copy; 2016 @custanet All Right Reserved.</small></p>
		</footer>
	</div>
</body>
</html>