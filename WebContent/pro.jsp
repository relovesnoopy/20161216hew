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
<link rel="stylesheet" href="./css/style2.css">
<link rel="stylesheet" href="./css/normalize.css">
<link rel="stylesheet" href="./css/logconf.css">

<script src="./external/jquery/jquery.js"></script>
<script src="./jquery-ui.js"></script>
<script src="./js/confilm.js"></script>
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>

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
			<a href=""onclick="document.hew.submit();return false;" >・購入履歴</a>
			<a href=""onclick="document.design.submit();return false;" >・デザイン作成一覧</a>
			<a href=""onclick="document.favorite.submit();return false;" >・お気に入り</a>
			<a href="pro.jsp">・プロフィール変更</a>

			<form name="hew" method="POST" action="Hew">
				<input type="hidden" name="purhistory" value="">
			</form>
			<form name="design" method="POST" action="Hew">
				<input type="hidden" name="designall" value="">
			</form>
			<form name="favorite" method="POST" action="Hew">
				<input type="hidden" name="favoritehistory" value="">
			</form>
			<fieldset>
				<h2>プロフィール変更</h2>
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
							<input class="submit" type="submit" name="changesignup" value="変更確認"/>
					</div>
				</form>
			</fieldset>


<footer id="pageFoot">
	<p id="copyrigth"><small>Copyright&copy; 2013 @komorikomasha All Right Reserved.</small></p>
</footer>

</div>
</div>
</body>
</html>