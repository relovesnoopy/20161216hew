<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList" import="jp.ac.hal.Logo"%>
<%
ArrayList<Logo> lg = (ArrayList<Logo>)session.getAttribute("logo");
String window = (String)session.getAttribute("design");
if(request.getParameter("window") != null){
	window = request.getParameter("window");
	session.setAttribute("design", window);
	System.out.println(session.getAttribute("design"));
}
else{
	System.out.println(request.getAttribute("design"));
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>jquery ui test</title>
<link rel="stylesheet" href="./jquery-ui.css">
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
<header id="pageHead" >
			<h1 id="siteTitle"><img src="images/logo3.png" height="70px"></h1>

	</header>
	<div class="Container">
		<div class="box">
			<div id="target_screen">
				<div id="draggableArea"><img src="images/<%=window %>1.png" height="450px" width="400px" class="draggableArea" />
					<div id="draggable" style="display: none;">
						<img id="logo" class="box" src="item/03-logo.png" height="70px" width="70px" >
					</div>
					<div id="txt" style="display: none;"><textarea id="txts" class="box" cols="18" style="background-color:transparent;" placeholder="入力してください"></textarea></div>
				</div>
			</div>
			<ul class="li" style="list-style-type: none">
				<li><img src="images/<%=window %>1.png" class="thumb" height="70px" width="70px"/></li>
				<li><img src="images/<%=window %>2.png" class="thumb" height="70px" width="70px"/></li>
				<li><img src="images/<%=window %>3.png" class="thumb" height="70px" width="70px"/></li>
				<li><img src="images/<%=window %>4.png" class="thumb" height="70px" width="70px"/></li>
			</ul>
		</div>
		<div class="box">
			<button id="toggle">アイテム</button>
			<button id="toggle2">テキスト</button>
			<div id="item" class="item" style="display: none;">
			 	<ul>
				 	<%
					 	if(lg != null){
							int i = 1;
							for(Logo element:lg){
								out.print("<li><a href=" +element.getLogopass()+ "><img src=" +element.getLogopass()+ " height=\"50px\" width=\"50px\"></a></li>");
								if(i%6 == 0){
									out.print("<br/>");
								}
								i++;
							}
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	<script src="./external/jquery/jquery.js"></script>
	<script src="./jquery-ui.js"></script>
	<script src="./js/drag.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
	<hr />
	<form id="form_id" action="Hew" method="post" name="form" >

	<div class="dezi">デザイン名：<input type="text" name="degignname"></div>
		<button type="button" onclick="screenshot('#target_screen')" id="window" >完成</button>
		<div id="output_screen">
			<img id="screen_image">
		</div>
		<!-- imageにはbase64 image2にはblob変換したものが入る -->
		<input type="hidden" name="image"id="base64" value="" >
		<input type="hidden" name="image2"id="blob" value="">
	</form>
</body>
</html>