<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String log="<li><a href=\"login.jsp\">ログイン</a></li>";
if(session.getAttribute("uid")!=null){
	//log="ログアウト";
	log="<li><a href=\"logout.jsp\">ログアウト</a></li>";
}

String decision = (String)request.getAttribute("puruserinfo");

String man="";
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String tel = request.getParameter("tel");
String add = request.getParameter("addr11");
String post = request.getParameter("zip11");
String mail = request.getParameter("mail");


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
<link rel="stylesheet" href="./css/purchase.css">
<link rel="stylesheet" href="./css/style2.css">
</head>
<body>
	<header id="pageHead" >
		<h1 id="siteTitle"><a href="top.jsp"  class="title"><img src="images/logo3.png" height="150px"></a></h1>
		<p id="catchcopy">自分だけの服装を見つけよう。服で楽しい毎日を</p>
	</header>
	<fieldset>
		<h2>配送先情報</h2>

		<form action="Hew" method="POST">
			<table>
				<tr>
					<td class="conf">姓:</td>
					<td><%=fname %></td>
					<input type="hidden" name="fname" value="<%=fname %>"/>
				</tr>
				<tr>
					<td class="conf">名:</td>
					<td><%=lname %></td>
					<input type="hidden" name="lname" value="<%=lname %>"/>
				</tr>

				<tr>
					<td class="conf">電話番号:</td>
					<td><%=tel %></td>
					<input type="hidden" name="tel" value="<%=tel %>"/>
				</tr>
				<tr>
					<td class="conf">メールアドレス:</td>
					<td><%=mail %></td>
					<input type="hidden" name="mail" value="<%=mail %>"/>
				</tr>
				<tr>
					<td class="conf">郵便番号:</td>
					<td><%=post %></td>
					<input type="hidden" name="post" value="<%=post %>"/>
				</tr>
				<tr>
					<td class="conf">住所:</td>
					<td><%=add %></td>
					<input type="hidden" name="add" value="<%=add %>"/>
				</tr>

			</table>
			<div class="signup">
				<input class="submit" type="submit" name="<%=decision %>" value="購入"/>
			</div>
		</form>
	</fieldset>
	<footer id="pageFoot">
		<p id="copyrigth"><small>Copyright&copy; 2016 @custanet All Right Reserved.</small></p>
	</footer>

</body>
</html>