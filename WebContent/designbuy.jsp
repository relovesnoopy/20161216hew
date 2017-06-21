<%@page import="jp.ac.hal.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="jp.ac.hal.Design"%>
<%
String purhismsg="";
//セッションからShohinListを取得する
ArrayList<Design> designhis =(ArrayList<Design>) session.getAttribute("designhis");
if(designhis==null || designhis.size() == 0){
	purhismsg="デザイン履歴がありません";
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
<link rel="stylesheet" href="./css/navi.css">
<link rel="stylesheet" href="./css/product.css">
<link rel="stylesheet" href="./css/style2.css">
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
	<section>
		<h2 class="mypage">デザイン履歴</h2>
<%
				if(designhis!=null){
					int i=0;
					for(Design element:designhis){
						if(i%3 == 0){
							out.print("<section class=\"product\">");
						}
						//デザイン画像を読み出す
						out.print("<figure class=\"buylist\">");
						out.print("<img src="+element.getDesignimagepass()+" height=\"200px\"width=\"200px\">");
						//デザイン名を読み出す
						//デザイン名がnull、または空の時
						if(element.getDesignname() == null || element.getDesignname().equals("")){
							out.print("<figcaption>デザイン名：無し</figcaption>");
						}
						else{
							out.print("<figcaption>デザイン名："+ element.getDesignname()+"</figcaption>");
						}
						//作成日時を読み出す
						String date = element.getDesigndatetime();
						String datetime = date.substring(0,10);
						out.print("<figcaption>作成日時："+datetime+"</figcaption>");
						out.print("</figure>");
						if(i%3==2){
							out.print("</section>");
						}
						i++;
					}
					if(i%3!=0){
						out.print("</section>");
					}
				}
				%>
	</section>
	<p ><%=purhismsg %></p>
	<footer id="pageFoot">
		<p id="copyrigth"><small>Copyright&copy;2016 @custanet All Right Reserved.</small></p>
	</footer>
	</div>
</div>
</body>
</html>