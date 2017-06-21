<%@page import="com.sun.org.apache.xml.internal.utils.URI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import = "java.util.ArrayList" import="jp.ac.hal.Design"%>

<%
String dberr="";
	ArrayList<Design> dg = (ArrayList<Design>)session.getAttribute("open");
if(dg==null){
	dberr = "データベース読み込みエラー";
}
else if(dg.size() == 0){
	dberr = "投稿がありません";
}
//String deimage = request.getParameter("desimage");
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
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style2.css">
<link rel="stylesheet" href="./css/datawind.css">
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
		<h2>公開デザイン一覧</h2>
<%
	String designname = "";
	if(dg!=null){
		int i=0;
		for(Design element:dg){
			if(i%3==0){
				out.print("<section class=\"product\">");
			}
			out.print("<figure>");
			out.print("<img src="+element.getDesignimagepass()+" height=\"150px\" width=\"150px\">");
			out.print("<input  type=\"hidden\"name=\"designid\" value="+element.getDesignid()+">");

			if(element.getDesignname() == null){
				designname = "無し";
			}
			else{
				designname = element.getDesignname();
			}
			out.print("<figcaption>デザイン名："+ designname+"</figcaption>");

			out.print("<p>");
			out.print("<img src=\"images/img2.png\" id=\"imgchng"+i+"\" onclick=\"change"+i+"()\" width=\"33px\" height=\"33px\">");
			out.print("</p>");
			out.print("<script type=\"text/javascript\">");
			out.print("var img = new Array();");
			out.print("img[0] = new Image();");
			out.print("img[0].src = \"images/img2.png\";");
			out.print("img[1] = new Image();");
			out.print("img[1].src = \"images/img1.png\";");
			out.print("var cnt=0;");
			out.print("function change"+i+"()");
			out.print("{");
			out.print("if (cnt == 1)");
			out.print("{ cnt=0; }");
			out.print("else");
			out.print("{ cnt++; }");
			out.print("document.getElementById(\"imgchng"+i+"\").src=img[cnt].src;");
			out.print("}");
			out.print("</script>");
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
		out.print(dberr);
	}
%>
		</div>
	<footer id="pageFoot">
		<p id="copyrigth"><small>Copyright&copy; 2016 @custanet All Right Reserved.</small></p>
	</footer>


</body>
</html>