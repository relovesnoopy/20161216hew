<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="jp.ac.hal.Cart"%>
<%
//カートメッセージ
String cartmsg="";
String disp =(String)request.getAttribute("pur");
//カート内商品数、カート内の小計
String item="0";
String carttotal="0";
if(disp==null){
	disp="<input class=\"submit\" type=\"submit\" name=\"nopur\" value=\"商品ページ\">";
}
//セッションからShohinListを取得する
ArrayList<Cart> cart =(ArrayList<Cart>) session.getAttribute("cart");
if(cart==null){
	cartmsg="カート内には商品がありません";
}
else{
	item = session.getAttribute("item").toString();
	carttotal = session.getAttribute("total").toString();
}
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
<link rel="stylesheet" href="./css/logconf.css">
<link rel="stylesheet" href="./css/style2.css">
<title>Insert title here</title>
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
					<li><a href="signup.jsp">会員登録</a></li>
					<%=log %>
					<li><a  href="mypage.jsp">マイページ</a></li>
					<li class="current"><a href="cart.jsp">カート</a></li>
				</ul>
			</nav>
		</header>
		<fieldset>
			<h2>カート内の商品</h2>
			<form action="Hew" id="form" method="post">
				<%
				if(cart!=null){
					if(cart.size()==0){
						cartmsg="カート内には商品がありません";
						session.setAttribute("item" , 0);
						carttotal="0";
					}
					else{
						//購入ボタン
						disp="<input class=\"submit\" type=\"submit\" name=\"pur\" value=\"購入\">";
						int price=0;
						int i=0;
						for(Cart element:cart){
							//商品画像を読み出す
							out.print("<table>");
							out.print("<tr><img src=" + element.getItempass() + " height=\"200px\"width=\"200px\"></tr>");
							out.print("<br clear=\"all\">");
							out.print("<input type=\"hidden\" name=\"itempass\" value=\"" + element.getItempass()+"\">");
							//商品名を読み出す
							out.print("<tr>商品名：" + element.getItemname() + "</tr>");
							out.print("<br clear=\"all\">");
							//価格を読み出す
							out.print("<tr>単価：￥"+ element.getItemprice()+"</tr>");
							out.print("<br clear=\"all\">");
							//個数を読み出す
							out.print("<tr>個数："+ element.getQuantity()+"</tr>");
							out.print("<br clear=\"all\">");
							//サイズを読み出す
							out.print("<tr>サイズ："+ element.getSize()+"</tr>");
							out.print("<br clear=\"all\">");
							out.print("<input type=\"hidden\" name=\"shopprice"+i+" value=\""+ element.getItemprice()+"\">");
							out.print("<input type=\"hidden\" name=\"projectid\" value=\""+ element.getProjectid()+"\">");
							out.print("<input type=\"hidden\" name=\"itemno\" value=\""+ element.getItemno()+"\">");
							out.print("<input type=\"hidden\" name=\"size\" value=\""+ element.getSize()+"\">");
							//カートから商品削除
							out.print("<tr>");
							out.print("<form action=\"Hew\"method=\"post\">");
							out.print("<button type=\"submit\" class=\"delete\" name=\"cartdelele\" />カートから削除</button>");
							out.print("<input type=\"hidden\" name=\"DelNo\" value=\"" + i + "\"/>");
							out.print("</form>");
							out.print("</tr>");
							out.print("</table>");
							i++;
						}
					}
				}
				%>
				<p class="cartmsg"><%=cartmsg %></p>
				<p class="total">小計（<%=item %>点）:￥<%=carttotal %></p>
				<%=disp %>
			</form>
		</fieldset>
		<footer id="pageFoot">
			<p id="copyrigth"><small>Copyright&copy; 2016 @custnet All Right Reserved.</small></p>
		</footer>
	</div>
</body>
</html>