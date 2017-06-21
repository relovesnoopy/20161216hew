<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//データベース接続
//デザイン可能商品を表示
session.getAttribute("count");
//データベースからimg srcをvalueにいれてわたす？

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style2.css">
<link rel="stylesheet" href="./css/product.css">
</head>
<body>
	<div id="pageBody">
		<div id="pageBodyMain">
			<section class="product1">
				<figure>
					<div id="imgbox1">
						<form action="Hew" method="post" >
							<img alt="" src="images/a01.png" height="150px" width="150px">
							<figcaption>セーター</figcaption>
							<input type="submit" value="デザインする" name="degi">
							<input  type="hidden"name="window" value="a0">
						</form>
					</div>
				</figure>
				<figure>
					<div id="imgbox2">
						<form  action="Hew" method="post" >
							<img alt="" src="images/b01.png" height="150px" width="150px">
							<figcaption>t-シャツ</figcaption>
							<input type="submit" value="デザインする" name="degi">
							<input  type="hidden"name="window" value="b0">
						</form>
					</div>
				</figure>
				</section>
				<section class="product2">
				<figure>
					<div id="imgbox3">
						<form  action="Hew" method="post" >
						<img alt="" src="images/c01.png" height="150px" width="150px">
						<figcaption>セーター</figcaption>
						<input type="submit" value="デザインする" name="degi">
						<input  type="hidden"name="window" value="c0">
						</form>
					</div>
				</figure>
				<br/>
				<figure>
					<div id="imgbox4">
						<form  action="Hew" method="post" >
						<img alt="" src="images/d01.png" height="150px" width="150px">
						<figcaption>シャツ（ピンク）</figcaption>
						<input type="submit" value="デザインする" name="degi">
						<input  type="hidden" name="window" value="d0">
					</form>
					</div>
				</figure>
				<figure>
					<div id="imgbox5">
						<form id="window_id" action="Hew" method="post" >
						<img alt="" src="images/e01.png" height="150px" width="150px">
						<input type="submit" value="デザインする" name="degi">
						<input  type="hidden"name="window" value="e0">
						<figcaption>シャツ（ブラック）</figcaption>
					</form>
					</div>
				</figure>
				<figure>
					<div id="imgbox6">
						<form id="window_id" action="Hew" method="post" >
						<img alt="" src="images/f01.png" height="150px" width="150px">
						<input type="submit" value="デザインする" name="degi">
						<input  type="hidden"name="window" value="f0">
						<figcaption>パンツ（ブラック）</figcaption>
					</form>
					</div>
				</figure>
			</section>
		</div>
	</div>

</body>
</html>