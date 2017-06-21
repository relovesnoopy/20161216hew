<%@page import="com.sun.org.apache.xml.internal.utils.URI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import = "java.util.ArrayList" import="jp.ac.hal.Design"%>

<%
	ArrayList<Design> dg = (ArrayList<Design>)session.getAttribute("open");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/datawind.css">
</head>
<body>
	<header id="pageHead" >
		<h1 id="siteTitle"><img src="images/logo3.png" height="150px"></h1>
		<p id="catchcopy">自分だけの服装を見つけよう。服で楽しい毎日を</p>
	</header>
	<div>
	<%
		if(session.getAttribute("uid")!=null){
			if(dg!=null){
				int i=0;
				for(Design element:dg){
					if(i%2==0){
						out.print("<section class=\"product\">");
					}
					out.print("<figure>");
					out.print("<form action=\"Hew\" method=\"post\">");
					out.print("<img src="+element.getDesignimagepass()+" height=\"150px\" width=\"150px\">");
					out.print("<input  type=\"hidden\"name=\"designid\" value="+element.getDesignid()+">");
					out.print("<input  type=\"hidden\"name=\"degignname\" value="+element.getDesignname()+">");
					out.print("<p>デザイン名："+element.getDesignname()+"</p>");
					out.print("<input type=\"submit\" name=\"open\" value=\"投稿\">");
					out.print("</form>");
					out.print("</figure>");
					if(i%2==2){
						out.print("</section>");
					}
					i++;
				}
				if(i%2!=0){
					out.print("</section>");
				}
			}
			else{
				out.print("<p>データベースエラー</p>");
			}
		}
		else{
			out.print("<p>ゲストは投稿が出来ません</p>");
		}
	%>
	</div>


	<button class="resultclose" onclick="window.close()">閉じる</button>
	<a href = "degignwindow.jsp">戻る</a>


</body>
</html>