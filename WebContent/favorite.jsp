
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="jp.ac.hal.Favoritejoinproduct"%>
<%
	String favhismsg="";
	if(request.getAttribute("delfavo") != null){
		favhismsg = "お気に入りから外されました";
	}
	//セッションからShohinListを取得する
	ArrayList<Favoritejoinproduct> favorite =(ArrayList<Favoritejoinproduct>)session.getAttribute("favorite");
	if(favorite==null || favorite.size() == 0){
		favhismsg="お気に入りがありません";
	}
	String log="<li><a href=\"login.jsp\">ログイン</a></li>";
	if(session.getAttribute("uid")!=null){
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
			<a href="pro.jsp">プロフィール変更</a>

			<form name="hew" method="POST" action="Hew">
				<input type="hidden" name="purhistory" value="">
			</form>
			<form name="design" method="POST" action="Hew">
				<input type="hidden" name="designall" value="">
			</form>
			<form name="favorite" method="POST" action="Hew">
				<input type="hidden" name="favoritehistory" value="">
			</form>

		<h2 class="mypage">お気に入り</h2>
		<p><%=favhismsg %></p>
		<section>
	<%
		if(favorite != null){
			int i=0;

			for(Favoritejoinproduct element:favorite){
				//for(Favorite favelement:fav){
				if(i%3 == 0){
					out.print("<section class=\"product1\">");
				}
				//商品画像を読み出す
				out.print("<figure class=\"favlist\">");
				out.print("<img src="+element.getImagepass()+" height=\"200px\"width=\"200px\">");
				//商品名を読み出す
				out.print("<figcaption>商品名："+ element.getProductname()+"</figcaption>");
				//価格を読み出す
				out.print("<figcaption>価格："+ element.getPrice()+"</figcaption>");
				out.print("<form action=\"Hew\"method=\"post\">");
				out.print("<button type=\"submit\" class=\"delete\" name=\"favdelete\" />お気に入りから外す</button>");
				out.print("<input  type=\"hidden\"name=\"favoriteid\" value="+element.getFavoid()+">");
				out.print("<input  type=\"hidden\"name=\"itemno\" value="+element.getItemno()+">");
				out.print("</form>");
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
		else{
			favhismsg="お気に入りがありません";
		}
	%>
	</section>

	<footer id="pageFoot">
		<p id="copyrigth"><small>Copyright&copy;2016 @custanet All Right Reserved.</small></p>
	</footer>
	</div>
</div>
</body>
</html>