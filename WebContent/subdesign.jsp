<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String item = "0";
String carttotal = "0";
item = session.getAttribute("item").toString();
carttotal = session.getAttribute("total").toString();
%>
<html>
<head>
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
<link rel="stylesheet" href="./css/submitpur.css">
<link rel="stylesheet" href="./css/style2.css">
</head>

<body>
	<header id="pageHead" >
		<h1 id="siteTitle"><img src="images/logo3.png" height="150px"></h1>
		<p id="catchcopy">自分だけの服装を見つけよう。服で楽しい毎日を</p>
	</header>
	<fieldset>
		<h2 class="kanryo">購入が完了しました</h2>
		<p class="total">小計（<%=item %>点）:￥<%=carttotal %></p>
		<a href="sample2.jsp">デザイン画面に戻る</a>
	<button class="resultclose" onclick="window.close()">閉じる</button>
	</fieldset>
<footer id="pageFoot">
	<p id="copyrigth"><small>Copyright&copy;2016 @custanet All Right Reserved.</small></p>
</footer>

</body>
</html>