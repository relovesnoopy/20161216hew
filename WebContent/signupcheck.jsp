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
String man="";
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
int sex = Integer.parseInt(request.getParameter("sex"));
System.out.print(sex);
String sei = request.getParameter("sex");
String tel = request.getParameter("tel");
String add = request.getParameter("addr11");
String post = request.getParameter("zip11");
String mail = request.getParameter("mail");
String passwd = request.getParameter("passwd");
String repasswd = request.getParameter("repasswd");
if(sex==0){
	man="男";
}
else{
	man="女";
}
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
<link rel="stylesheet" href="./css/logconf.css">
<link rel="stylesheet" href="./css/style2.css">
</head>
<body>
	<div id="page">
			<header id="pageHead" >
				<h1 id="siteTitle"><a href="top.jsp" class="title">custnet</a></h1>
				<p id="catchcopy">自分だけの服装を見つけよう。服で楽しい毎日を</p>
				<nav class="globalNavi">
					<ul>
						<li><a href="top.jsp">ホーム</a></li>
						<form name="form1" method="POST" action="Hew">
						<input type=hidden name="datawind" value="">
						</form>
						<li><a href="degi.jsp">デザイン</a></li>
						<li class="current"><a href="signup.jsp">会員登録</a></li>
						<%=log %>
						<li><a  href="mypage.jsp">マイページ</a></li>
						<li><a href="cart.jsp">カート</a></li>
					</ul>
				</nav>
			</header>
		<fieldset>
			<h2>入力情報確認</h2>
			<p><font size="2" color="red"><%=disp %></font></p>
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
						<td class="conf">性別:</td>
						<td><%=man %></td>
						<input type="hidden" name="sex" value="<%=sei %>"/>
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
					<input type="hidden" name="passwd" value="<%=passwd %>"/>
					<input type="hidden" name="repasswd" value="<%=repasswd %>"/>
				</table>
				<div class="signup">
					<input class="submit" type="submit" name="signupchack" value="会員登録"/>
				</div>
			</form>
		</fieldset>
		<footer id="pageFoot">
			<p id="copyrigth"><small>Copyright&copy; 2016 @custanet All Right Reserved.</small></p>
		</footer>
	</div>
</body>
</html>