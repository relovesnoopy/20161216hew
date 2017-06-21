<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="jp.ac.hal.User"%>
<%
	String useinfomsg="";
	ArrayList<User> userinfo =(ArrayList<User>)session.getAttribute("userinfo");
	if(userinfo == null || userinfo.size() == 0){
		useinfomsg = "住所が登録されていません";
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script src="./external/jquery/jquery.js"></script>
<script src="./jquery-ui.js"></script>
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
	<label><input type="radio" name="entryPlan" value="hoge2" onclick="entryChange1(0);" checked="checked"/>登録してある住所へ配送する</label>
	<label><input type="radio" name="entryPlan" value="hoge1" onclick="entryChange1(1);"  />新しい住所</label>




			<div id="disp" >
			<%
				if(useinfomsg != null){
					for(User element:userinfo){
					out.print("<table>");
					out.print("<tr><td class=\"conf\">姓:</td><td>"+ element.getFname()+"</td></tr>");
					out.print("<tr><td class=\"conf\">名:</td><td>"+ element.getLname()+"</td></tr>");
					out.print("<tr><td class=\"conf\">電話番号:</td><td>"+ element.getTel()+"</td></tr>");
					out.print("<tr><td class=\"conf\">メールアドレス:</td><td>"+ element.getMail()+"</td></tr>");
					out.print("<tr><td class=\"conf\">郵便番号:</td><td>"+ element.getPost()+"</td></tr>");
					out.print("<tr><td class=\"conf\">住所:</td><td>"+ element.getAddress()+"</td></tr>");
					out.print("</table>");
					}
				}
			%>
			<p><%= useinfomsg %></p>

				<form action="Hew" method="post" >
					<div class="purchase"><input type="submit" name="purchase" value="購入"></div>
				</form>
			</div>

			<div id="disp2" style="display:none;">
				<form action="Hew" method="post" >
					<table>
						<tr>
							<td class="conf">姓:</td><td><input type="text" name="fname"/></td>
						</tr>
						<tr>
							<td class="conf">名:</td><td><input type="text" name="lname"/></td>
						</tr>
						<tr>
							<td class="conf">電話番号:</td>
							<td><input type="text" name="tel"/></td>
						</tr>
						<tr>
							<td class="conf">メールアドレス:</td>
							<td><input type="text" name="mail"/></td>
						</tr>
						<tr>
							<td class="conf">郵便番号:</td>
							<td><input type="text" name="zip11" size="10" maxlength="8" onKeyUp="AjaxZip3.zip2addr(this,'','addr11','addr11');"/></td>
						</tr>
						<tr>
							<td class="conf">住所:</td>
							<td><input type="text" name="addr11" size="60"/></td>
						</tr>
					</table>
					<div class="purchase"><input type="submit" name="puruserinfo" value="配送先変更"></div>
				</form>
			</div>


		<script>
			function entryChange1(num){
				if (num == 0){
					document.getElementById("disp").style.display="block";
					document.getElementById("disp2").style.display="none";
				}
				else{
					document.getElementById("disp").style.display="none";
					document.getElementById("disp2").style.display="block";
				}

			}

		</script>



</fieldset>
<footer id="pageFoot">
	<p id="copyrigth"><small>Copyright&copy;2016 @custanet All Right Reserved.</small></p>
</footer>
</body>
</html>
