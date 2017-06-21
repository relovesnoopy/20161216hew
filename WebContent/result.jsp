<%@page import="com.sun.org.apache.xml.internal.utils.URI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<%
String hidden=request.getParameter("image");
//サーバから受け取った
String images = (String)request.getAttribute("image");
String disp = (String)request.getAttribute("error");
String dname = request.getParameter("degignname");
//.equalsだとエラー
if(disp == null){
	disp = "";
}
else if(disp.equals( "Exception")){
	disp = "ログインしていません";
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header id="pageHead" >
		<h1 id="siteTitle"><img src="images/logo3.png" height="150px"></h1>
		<p id="catchcopy">自分だけの服装を見つけよう。服で楽しい毎日を</p>
	</header>
	<%=disp %>

	<div><img alt="design" src="<%= hidden%>"></div>
	<p>デザイン名：<%=dname %></p>
	<form action="Hew" method="post">
		<input type="submit" name="designpur" value="購入">
		<input type="hidden" name="desimage" value="<%= images %>>">
	</form>
	<form action="Hew" method="post">
		<input type="hidden" name="desimage" value="<%= hidden %>>">
		<input type="submit" name="toukou" value="投稿">
	</form>
	<a href="sample2.jsp">デザイン画面に戻る</a>
	<button class="resultclose" onclick="window.close()">閉じる</button>
</body>
</html>