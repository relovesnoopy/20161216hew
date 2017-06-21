<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList" import="jp.ac.hal.Product"%>
<%
	String dberr = "";
	if(request.getAttribute("setfavo") != null){
		dberr = "お気に入りに追加されました";
	}
	ArrayList<Product> pr = (ArrayList<Product>)session.getAttribute("product");
	if(pr==null){
		dberr = "データベース読み込みエラー";
	}
	//データベースからimg srcをvalueにいれてわたす？
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
<link rel="stylesheet" href="./css/navi.css">
<link rel="stylesheet" href="./css/style2.css">
<link rel="stylesheet" href="./css/datawind.css">
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
					<li class="current"> <a href="" onclick="document.form1.submit();return false;">商品</a></li>
					<form name="form1" method="POST" action="Hew">
						<input type=hidden name="datawind" value="">
					</form>
					<li><a href="degi.jsp">デザイン</a></li>
					<li><a href="signup.jsp">会員登録</a></li>
					<%=log %>
					<li><a href="mypage.jsp">マイページ</a></li>
					<li><a href="cart.jsp">カート</a></li>
				</ul>
			</nav>
		</header>
		<div id="pageBody">
			<div id="proim">
				<a href="" onclick="document.form1.submit();return false;">すべての商品</a>
				<a href="" onclick="document.form0.submit();return false;">トップス</a>
				<a href="" onclick="document.form2.submit();return false;">アウター</a>
				<a href="" onclick="document.form3.submit();return false;">ボトムス</a>
				<a href="" onclick="document.form4.submit();return false;">ワンピース</a>
				<form name="form0" method="POST" action="Hew">
					<input type="hidden" name="category" value="1">
				</form>
				<form name="form2" method="POST" action="Hew">
					<input type="hidden" name="category" value="2">
				</form>
				<form name="form3" method="POST" action="Hew">
					<input type="hidden" name="category" value="3">
				</form>
				<form name="form4" method="POST" action="Hew">
					<input type="hidden" name="category" value="4">
				</form>
				<p id="dberr"><%=dberr %></p>
				<%
					if(pr != null){
						int i=0;
						for(Product element:pr){
							if(i%3 == 0){
								out.print("<section class=\"product\">");
							}
							out.print("<figure>");
							out.print("<img src="+element.getImagepass()+" height=\"260px\" width=\"200px\">");
							out.print("<figcaption>商品名："+ element.getProductname()+"</figcaption>");
							out.print("<figcaption>値段："+ element.getPrice() +"円</figcaption>");
							out.print("<div style=\"float: left\">個数</div>");
							out.print("<div style=\"float: left\">");
							out.print("<form action=\"Hew\" method=\"post\" name=\"cart"+i+"\">");
							out.print("<select name=\"quan\">");
							out.print("<option value=\"1\">1</option>");
							out.print("<option value=\"2\">2</option>");
							out.print("<option value=\"3\">3</option>");
							out.print("<option value=\"4\">4</option>");
							out.print("<option value=\"5\">5</option>");
							out.print("</select>");
							out.print("</div>");
							out.print("<br style=\"clear:both\">");
							out.print("<input type=\"radio\" name=\"size\" value=\"S\" checked/>S");
							out.print("<input type=\"radio\" name=\"size\" value=\"M\" />M");
							out.print("<input type=\"radio\" name=\"size\" value=\"L\" />L");
							out.print("<input type=\"radio\" name=\"size\" value=\"XL\" />XL");
							out.print("<br style=\"clear:both\">");
							out.print("<button onclick=\"document.cart"+i+".submit();return false;\">");
							out.print("<img src=\"images/cart.png\" height=\"20px\" width=\"20px\">");
							out.print("</button>");
							out.print("<input type=\"hidden\" name=\"cart\" value=\"\">");
							out.print("<input  type=\"hidden\"name=\"itempass\" value="+element.getImagepass()+">");
							out.print("<input  type=\"hidden\"name=\"itemname\" value="+element.getProductname()+">");
							out.print("<input  type=\"hidden\"name=\"itemprice\" value="+element.getPrice()+">");
							out.print("<input  type=\"hidden\"name=\"productid\" value="+element.getProductid()+">");
							out.print("<input  type=\"hidden\"name=\"itemno\" value="+element.getItemno()+">");
							out.print("</form>");
							out.print("<button onclick=\"document.fav"+i+".submit();return false;\">");
							out.print("<img src=\"images/favorite.png\" height=\"20px\" width=\"20px\">");
							out.print("</button>");
							out.print("<form name=\"fav"+i+"\" method=\"POST\" action=\"Hew\">");
							out.print("<input type=\"hidden\" name=\"favorite\" value=\"\">");
							out.print("<input  type=\"hidden\"name=\"productid\" value="+element.getProductid()+">");
							out.print("<input  type=\"hidden\"name=\"itemno\" value="+element.getItemno()+">");
							out.print("</form>");
							out.print("</figure>");

							if(i%3 == 2){
								out.print("</section>");
							}
							i++;
						}
						if(i%3 != 0){
							out.print("</section>");
						}
					}
					else{
						out.print(dberr);
					}
				%>

			</div>
		</div>
	<footer id="pageFoot">
		<p id="copyrigth"><small>Copyright&copy; 2016 @custanet All Right Reserved.</small></p>
	</footer>
</div>
</body>
</html>