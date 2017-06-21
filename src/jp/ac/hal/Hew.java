package jp.ac.hal;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.ac.dao.Daohew;
import jp.ac.dao.DesignDao;

import org.apache.tomcat.util.codec.binary.Base64;

/**
 * Servlet implementation class Hew
 */
public class Hew extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//リクエストの文字コード設定
		request.setCharacterEncoding("utf-8");

		String user;
		//エラーメッセージ初期化
		String disp = "";

		//セッション開始
		HttpSession session = request.getSession();
		//セッションの初期値設定
		if(session.getAttribute("count") == null){
			session.setAttribute("count", 0);
		}
		//カート内
		ArrayList<Cart> cart = new ArrayList<Cart>();

		//投稿機能用
		boolean opendesignflg = false;

		//お気に入り機能用
		boolean favorite = false;

		//データベース
		String url = "jdbc:mysql://localhost/protohew";
		String userurl = "hew_user";
		String passurl = "hewhew";
		Daohew daohew = new Daohew();

		//登録確認
		if(request.getParameter("signup") != null){
			String passwd = request.getParameter("passwd");
			String repasswd = request.getParameter("repasswd");
			//null、空値のチェック
			if((passwd != null && !passwd.isEmpty()) && (repasswd != null && !repasswd.isEmpty())){
				//パスワードと確認パスワードが一致しているか
				if(passwd.equals(repasswd)){
					RequestDispatcher reqDisp = request.getRequestDispatcher("signupcheck.jsp");
					reqDisp.forward(request, response);
					System.out.println("signupchack=ok");
				}
				else{
					disp = "notrepass";
					request.setAttribute("signup", disp);
					RequestDispatcher reqDisp = request.getRequestDispatcher("signup.jsp");
					reqDisp.forward(request, response);
				}
			}
		}

		//会員登録
		if(request.getParameter("signupchack") != null){
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			int sex = Integer.parseInt(request.getParameter("sex"));
			String tel = request.getParameter("tel");
			String add = request.getParameter("add");
			String post = request.getParameter("post");
			String mail = request.getParameter("mail");
			String passwd = request.getParameter("passwd");
			String repasswd = request.getParameter("repasswd");
			//null、空値のチェック
			if((fname != null && !fname.isEmpty()) && (lname != null && !lname.isEmpty()) &&
					(tel != null && !tel.isEmpty()) &&(add != null && !add.isEmpty()) &&
					(post != null && !post.isEmpty()) &&
					(passwd != null && !passwd.isEmpty()) &&
					(repasswd != null && !repasswd.isEmpty())){
				System.out.println("nullcheck=ok");
					//パスワードと確認パスワードが一致しているか
				if(passwd.equals(repasswd)){
					//一致していたら登録処理
					//登録メソッド
					daohew.confilm(fname,lname,sex,tel,add,post,mail,passwd);
					RequestDispatcher reqDisp = request.getRequestDispatcher("login.jsp");
					reqDisp.forward(request, response);
					System.out.println("signup=ok");
				}
			}
		}


		//プロフィール更新
		if(request.getParameter("changesignup") != null){
			String passwd = request.getParameter("passwd");
			String repasswd = request.getParameter("repasswd");
			//null、空値のチェック
			if((passwd != null && !passwd.isEmpty()) && (repasswd != null && !repasswd.isEmpty())){
				//パスワードと確認パスワードが一致しているか
				if(passwd.equals(repasswd)){
					RequestDispatcher reqDisp = request.getRequestDispatcher("changecheck.jsp");
					reqDisp.forward(request, response);
					System.out.println("signupchack=ok");
				}
				else{
					disp = "notrepass";
					request.setAttribute("signup", disp);
					RequestDispatcher reqDisp = request.getRequestDispatcher("pro.jsp");
					reqDisp.forward(request, response);
				}
			}
		}

		//変更登録
		if(request.getParameter("changechack") != null){
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			int sex = Integer.parseInt(request.getParameter("sex"));
			String tel = request.getParameter("tel");
			String add = request.getParameter("add");
			String post = request.getParameter("post");
			String mail = request.getParameter("mail");
			String passwd = request.getParameter("passwd");
			String repasswd = request.getParameter("repasswd");
			//ユーザID取得
			int uid = 0;
			ArrayList<User> userinfo = new ArrayList<User>();
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
			}
			//null、空値のチェック
			if((fname != null && !fname.isEmpty()) &&
					(lname != null && !lname.isEmpty()) &&
					(tel != null && !tel.isEmpty()) &&
					(add != null && !add.isEmpty()) &&
					(post != null && !post.isEmpty()) &&
					(passwd != null && !passwd.isEmpty()) &&
					(repasswd != null && !repasswd.isEmpty())){
				System.out.println("nullcheck=ok");
					//パスワードと確認パスワードが一致しているか
				if(passwd.equals(repasswd)){
					//一致していたら登録処理
					//登録メソッド
					daohew.chnageuserinfo(fname,lname,sex,tel,add,post,mail,passwd,uid);
					session.removeAttribute("uid");
					RequestDispatcher reqDisp = request.getRequestDispatcher("login.jsp");
					reqDisp.forward(request, response);
					System.out.println("signup=ok");
				}
			}
		}



		//ログイン
		if(request.getParameter("login") != null){
			//メールアドレスとパスワードを取得する
			String mail = request.getParameter("mail");
			String pass = request.getParameter("pass");
				int useid=0;
				useid = daohew.login(mail, pass);
				//0が返ってきた場合はログインエラーorSQLエラー
				if(useid != 0){
					//セッションに取得したuseridを設定
					session.setAttribute("uid", useid);
					RequestDispatcher reqDisp = request.getRequestDispatcher("top.jsp");
					reqDisp.forward(request, response);
					System.out.println("login=ok");
				}
				//ログインエラー
				else{
					disp="loginerr";
					request.setAttribute("login", disp);
					RequestDispatcher reqDisp = request.getRequestDispatcher("login.jsp");
					reqDisp.forward(request, response);
					System.out.println("login=ng");
				}
		}


		//ログアウト
		if(request.getParameter("logout") != null){
			//ユーザIDを持っているセッションを削除
			session.removeAttribute("uid");
			//メインページに遷移
			RequestDispatcher reqDisp = request.getRequestDispatcher("top.jsp");
			reqDisp.forward(request, response);
			System.out.println(session.getAttribute("uid"));
		}


		//商品表示
		if(request.getParameter("datawind")!=null){
			ArrayList<Product> pro = new ArrayList<Product>();
			try{
				pro = daohew.selectproduct();
				session.setAttribute("product",pro);
				disp = "windowdata.jsp";
			}
			catch(NullPointerException e){
				System.out.println(e.getMessage()+"error");
			}
			RequestDispatcher reqDisp = request.getRequestDispatcher(disp);
			reqDisp.forward(request,response);
		}
		//商品絞り込み
				if(request.getParameter("category")!=null){
					int cid = Integer.parseInt(request.getParameter("category"));
					ArrayList<Product> pro = new ArrayList<Product>();
					try{
						pro = daohew.selectcategory(cid);
						session.setAttribute("product",pro);
					}
					catch(NullPointerException e){
						System.out.println(e.getMessage()+"error");
					}
					finally{
						//転送処理
						RequestDispatcher reqDisp = request.getRequestDispatcher("windowdata.jsp");
						reqDisp.forward(request, response);
					}
				}


		//カートボタンが押されたら
		if(request.getParameter("cart") != null){
			//カートに追加処理
			//カート内に商品がある
			if(session.getAttribute("cart") != null){
				//セッションからカートの中身を取り出す
				cart = (ArrayList<Cart>) session.getAttribute("cart");
			}
			//カート内に商品がなかった場合新しくarraylistを作成する
			else{
				cart = new ArrayList<Cart>();
				//カート内の商品数をカウントするためのsession
				session.setAttribute("item", 0);
			}
			try{
				String itempass = request.getParameter("itempass");
				String itemname = request.getParameter("itemname");
				String itemprice = request.getParameter("itemprice");
				int projectid = Integer.parseInt(request.getParameter("productid"));
				int itemno = Integer.parseInt(request.getParameter("itemno"));
				String size = request.getParameter("size");
				int quantity = Integer.parseInt(request.getParameter("quan"));
				//画像パス、商品名、商品の値段、商品ID、商品NO、サイズ
				Cart c = new Cart();
				c.setItempass(itempass);
				c.setItemname(itemname);
				c.setItemprice(itemprice);
				c.setProjectid(projectid);
				c.setItemno(itemno);
				c.setSize(size);
				c.setQuantity(quantity);
				cart.add(c);
				//合計
				int price = 0;
				int i = 0;
				int item = (int)session.getAttribute("item");
				//個数分プラスする
				session.setAttribute("item", item+quantity);
				for(Cart element:cart){
					String objstr = element.getItemprice().toString();
					//個数倍する
					int itemcount = element.getQuantity();
					price += Integer.parseInt(objstr)*itemcount;
					System.out.println(price);
					session.setAttribute("total", price);
					//ループの回数
					i++;
				}
				//セッションにArrayList cartを格納
				session.setAttribute("cart", cart);
			}
			catch(Exception e){
				//エラーメッセージをリクエストに設定
				String strErrMsg = e.getMessage();
				//リクエストに設定
				request.setAttribute("errMsg", strErrMsg);
			}
			finally{
				//転送処理
				RequestDispatcher reqDisp = request.getRequestDispatcher("cart.jsp");
				reqDisp.forward(request, response);
			}
		}

		 if(request.getParameter("cartdelele") != null){
			//カート内の商品数取得用
			int item = 0;
			try{
				//削除する要素番号を受け取る
				int intDelNo = Integer.parseInt(request.getParameter("DelNo"));
				if(session.getAttribute("cart") != null){
					cart = (ArrayList<Cart>)session.getAttribute("cart");
					//カートから消す個数
					item = (int)session.getAttribute("item");
					int delquan = cart.get(intDelNo).getQuantity();
					item -= delquan;
					session.setAttribute("item", item);
					//System.out.println(cart.get(intDelNo).getQuantity()+"cartget");
					//カートから商品削除
					cart.remove(intDelNo);
					session.setAttribute("cart", cart);
				}
				//カート内の合計計算
				int price = 0;
				for(Cart element:cart){
					int itemcount = element.getQuantity();
					String objstr = element.getItemprice().toString();
					price += Integer.parseInt(objstr)*itemcount;
					session.setAttribute("total", price);
					System.out.println(price);
				}
			}
			catch(NullPointerException e){
				System.out.println("セッション切れ");
			}
			catch(Exception e){
				//エラーメッセージをリクエストに設定
				String strErrMsg = e.getMessage();
			}
			finally{
				//転送処理
				RequestDispatcher reqDisp = request.getRequestDispatcher("cart.jsp");
				reqDisp.forward(request, response);
			}
		}

		//カート画面購入ボタン
		if(request.getParameter("pur") != null){
			//ログインしてないorゲストはいったん0
			int pur = 0;
			ArrayList<User> userinfo = new ArrayList<User>();
			if(session.getAttribute("uid") != null){
				pur = (int) session.getAttribute("uid");
			}
			//ユーザの詳細情報
			userinfo = daohew.userinfo(pur);
			session.setAttribute("userinfo", userinfo);
			//購入ページに遷移する
			RequestDispatcher reqDisp = request.getRequestDispatcher("purchase.jsp");
			reqDisp.forward(request, response);
		}

		//カート内に商品がない
		if(request.getParameter("nopur") != null){
			ArrayList<Product> pro = new ArrayList<Product>();
			try{
				pro = daohew.selectproduct();
				session.setAttribute("product",pro);
				disp = "windowdata.jsp";
			}
			catch(Exception e){
				e.printStackTrace();
			}
			RequestDispatcher reqDisp = request.getRequestDispatcher(disp);
			reqDisp.forward(request,response);
		}




		//購入宛先入力
		if(request.getParameter("purchase") != null){
			//ユーザID
			int uid = 0;
			int pur = 0;
			//購入ID取得用
			int order = 0;
			ArrayList<Pur> orderid = new ArrayList<Pur>();
			//ログインしていたらDB処理
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
				System.out.println(pur+"uid");
				//ユーザID登録
				pur = daohew.pur(uid);
				orderid = daohew.purorder(uid);
				if(orderid.size() != 0){
					for(Pur element:orderid){
						//orderidを取得する
						order = element.getOrderid();
						session.setAttribute("orderid", order);
						System.out.println(order+"order");
					}
				}
				else{
					//初回はorderidを1に設定
					order = 1;
				}
				//カート内の商品情報を取得する
				try{
					//商品情報を登録
					int designid = 0;
					cart = (ArrayList<Cart>) session.getAttribute("cart");
					if(cart.size() != 0){
						System.out.println("cartpur");
						for(Cart element:cart){
							int projectid = element.getProjectid();
							int itemno = element.getItemno();
							int quant = element.getQuantity();
							String size = element.getSize();
							String strprc = element.getItemprice();
							int shopprice =  Integer.parseInt(strprc);
							pur = daohew.purdetails(order,projectid, itemno, quant, size, shopprice, designid);
						}
					}
				}
				catch(NullPointerException e){
					e.printStackTrace();
				}
			}
			//合計の取得(セッション)
			cart = (ArrayList<Cart>) session.getAttribute("cart");
			cart.clear();
			RequestDispatcher reqDisp = request.getRequestDispatcher("submitpur.jsp");
			reqDisp.forward(request, response);
		}

		//デザイン購入
		if(request.getParameter("designpur") != null){
			//ログインしてないorゲストはいったん0
			int uid = 0;
			ArrayList<User> userinfo = new ArrayList<User>();
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
			}
			//ユーザの詳細情報
			userinfo = daohew.userinfo(uid);
			session.setAttribute("userinfo", userinfo);
			//購入ページに遷移する
			RequestDispatcher reqDisp = request.getRequestDispatcher("purchasedesign.jsp");
			reqDisp.forward(request, response);
		}

		if(request.getParameter("designpurchase") != null){
			//ユーザID
			int uid = 0;
			int pur = 0;
			//購入ID取得用
			int order = 0;
			ArrayList<Pur> orderid = new ArrayList<Pur>();
			//ログインしていたらDB処理
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
				System.out.println(pur+"uid");
				//ユーザID登録
				pur = daohew.pur(uid);
				orderid = daohew.purorder(uid);
				if(orderid.size() != 0){
					for(Pur element:orderid){
						//orderidを取得する
						order = element.getOrderid();
						session.setAttribute("orderid", order);
					}
				}
				else{
					//初回はorderidを1に設定
					order = 0;
				}
				try{
					//商品情報を登録
					int designid = 0;
					if(request.getParameter("designid") != null){
						designid = Integer.parseInt(request.getParameter("designid"));
					}
					else{
						if(session.getAttribute("count")!=null){
							designid = (Integer)session.getAttribute("count")-1;
						}
					}
					int projectid = 0;
					int itemno = 0;
					int quant = 1;
					String size = "F";
					int shopprice = 2500;
					pur = daohew.purdetails(order,projectid, itemno, quant, size, shopprice, designid);
					//個数合計
					session.setAttribute("item", quant);
					session.setAttribute("total", shopprice);
				}
				catch(Exception e){
					e.printStackTrace();
				}
				RequestDispatcher reqDisp = request.getRequestDispatcher("subdesign.jsp");
				reqDisp.forward(request, response);
			}

		}

		//購入時の住所登録
		if(request.getParameter("puruserinfo") != null){
			String changeuserinfo = "purchase";
			request.setAttribute("puruserinfo",changeuserinfo );
			RequestDispatcher reqDisp = request.getRequestDispatcher("userinfopur.jsp");
			reqDisp.forward(request, response);
		}
		//デザイン購入時の住所登録
		if(request.getParameter("designpurchaseuserinfo") != null){
			String changeuserinfo = "designpurchase";
			request.setAttribute("puruserinfo",changeuserinfo );
			RequestDispatcher reqDisp = request.getRequestDispatcher("userinfopur.jsp");
			reqDisp.forward(request, response);
		}


		//購入完了からtopページへ
		if(request.getParameter("subpur") != null){
			//カート内の個数と小計をリセットする
			int item = 0;
			session.setAttribute("item",item);
			int price = 0;
			session.setAttribute("total",price);
			RequestDispatcher reqDisp = request.getRequestDispatcher("top.jsp");
			reqDisp.forward(request, response);
		}

		//購入履歴確認
		if(request.getParameter("purhistory") != null){
			//格納用
			ArrayList<Pur> pur = new ArrayList<Pur>();
			ArrayList<Product>product = null;
			//ユーザIDを取得ゲストは0
			int uid = 0;
			//ユーザID
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
			}
			//ユーザIDごとの購入詳細を取得
			pur = daohew.purhis(uid);
			if(pur.size() != 0){
				product = new ArrayList<Product>();
				product = daohew.item(pur);
			}
			DesignDao dd = new DesignDao();
			//格納用
			ArrayList<Design>design = null;

			//ユーザIDごとのデザイン購入詳細を取得
			pur = daohew.purhis(uid);
			if(pur.size() != 0){
				design = new ArrayList<Design>();
				design = dd.designpurhis(pur,uid);
			}
			session.setAttribute("designpurhis", design);
			session.setAttribute("purhis", product);
			RequestDispatcher reqDisp = request.getRequestDispatcher("buy.jsp");
			reqDisp.forward(request, response);
		}

		//デザイン購入履歴確認
		if(request.getParameter("designpurhistory") != null){
			DesignDao dd = new DesignDao();
			//格納用
			ArrayList<Pur> pur = new ArrayList<Pur>();
			ArrayList<Design>design = null;
			//ユーザIDを取得ゲストは0
			int uid = 0;
			//ユーザID
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
			}
			//ユーザIDごとのデザイン購入詳細を取得
			pur = daohew.purhis(uid);
			if(pur.size() != 0){
				design = new ArrayList<Design>();
				design = dd.designpurhis(pur,uid);
			}
			session.setAttribute("designpurhis", design);
			RequestDispatcher reqDisp = request.getRequestDispatcher("designbuy.jsp");
			reqDisp.forward(request, response);
		}


		if(request.getParameter("designall") != null){
			DesignDao dd = new DesignDao();
			//格納用
			ArrayList<Design>design = new ArrayList<Design>();
			//ユーザIDを取得初期値
			int uid = 0;
			//ユーザID
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
			}
			design = dd.designhistory(uid);
			session.setAttribute("designhis", design);
			RequestDispatcher reqDisp = request.getRequestDispatcher("designbuy.jsp");
			reqDisp.forward(request, response);
		}


		//お気に入り登録
		if(request.getParameter("favorite") != null){
			//ユーザID取得
			int uid = 0;
			int pid = Integer.parseInt(request.getParameter("productid"));
			int ino = Integer.parseInt(request.getParameter("itemno"));
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
				daohew.fav(pid,ino,uid);
			}
			else{
				session.setAttribute("error", "favnologin");
			}
			request.setAttribute("setfavo", "setfavo");
			RequestDispatcher reqDisp = request.getRequestDispatcher("windowdata.jsp");
			reqDisp.forward(request, response);
		}

		//お気に入り履歴押下
		if(request.getParameter("favoritehistory")!=null){
			//お気に入り機能フラグを立てる
			favorite = true;
		}

		//お気に入り削除
		if(request.getParameter("favdelete") != null){
			int fid = Integer.parseInt(request.getParameter("favoriteid"));
			daohew.favdelete(fid);
			favorite = true;
			request.setAttribute("delfavo", "delfavo");

		}

		//お気に入り表示（フラグ立時）
		if(favorite){
			//格納用
			//お気に入り機能フラグを立てる
			int uid = 0;
			ArrayList<Favoritejoinproduct> favoriteitem = new ArrayList<Favoritejoinproduct>();
			//ユーザID
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
			}
			favoriteitem = daohew.getfavorite(uid);
			//favorite = true;
			session.setAttribute("favorite", favoriteitem);

			RequestDispatcher reqDisp = request.getRequestDispatcher("favorite.jsp");
			reqDisp.forward(request, response);
			favorite = false;
		}

		//カスタム用アイテム表示
		if(request.getParameter("degi") != null){
			ArrayList<Logo> logo = new ArrayList<Logo>();
			try{
				logo = daohew.logo();
				session.setAttribute("logo",logo);
				if(logo.size() != 0){
					for(Logo element:logo){
						//orderidを取得する
						System.out.println(element.getLogoid()+"logoid");
						System.out.println(element.getLogoname()+"logoname");
					}
				}
			}
			catch(NullPointerException e){
				e.printStackTrace();
			}
			RequestDispatcher reqDisp = request.getRequestDispatcher("sample2.jsp");
			reqDisp.forward(request,response);
		}

		//デザイン処理
		if(request.getParameter("image") != null){
			DesignDao dd = new DesignDao();
			//デザイン数(design_id)の取得
			int desginid = 0;
			//ユーザIDを取得ゲストは0
			int uid = 0;
			//ユーザID
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
			}
			//ユーザidを取得する
			user = "0" + uid + "0";
			desginid = dd.getdesignid(uid);
			//エラーor初回だったらdesignidが0
			if(desginid == 0){
				session.setAttribute("count" , 0);
			}
			//
			else{
				//セッションに取得したデザインIDを設定
				session.setAttribute("count" , desginid);
			}
			try{
				//画像URL受け取りの初期化
				String gazou = "";
				//公開フラグ(初期値0=公開無)
				int openflg = 0;
				//デザイン名の取得
				String designname = null;
				//デザイン名取得
				designname = request.getParameter("degignname");
				//生成した画像のURLを受け取る
				gazou = request.getParameter("image");
				if(gazou != null){
					//画像URLが受け取れたらresultに画像転送
					request.setAttribute("image", gazou);
					//data:image/png;base64,を切り取ったものを格納
					//生成された画像ファイルが空の場合changeがミス
					String change = gazou.replace("data:image/png;base64,","");
					//base64を画像ファイル化する
					byte[] bytes = Base64.decodeBase64(change.getBytes());
					ByteArrayInputStream input = new ByteArrayInputStream(bytes);
					BufferedImage image = ImageIO.read(input);
					//セッションの値を取得する
					//セッションの値を末尾につけた画像ファイルを生成
					//セッションの値をカウントアップ
					//FileOutputStremクラスを用いて任意の場所にファイルを生成する
					int count = (Integer)session.getAttribute("count")+1;
					//filenameに保存する画像パスを入れる
					String filename = "C:\\Users\\muto.masakazu\\Documents\\JV22\\Workspace\\20161216hew\\WebContent\\designimages\\"+user+count+".png";
					FileOutputStream output = new FileOutputStream(filename);
					ImageIO.write(image,"png",output);
					//データベースに画像pass
					String deimgpass = "designimages/"+user+count+".png";
					//didを+1する
					int did = (int) session.getAttribute("count")+1;
					//ユーザidを渡す
					uid = (int)session.getAttribute("uid");
					//designinsertメソッド呼び出し
					dd.insertdesign(did,uid,deimgpass,openflg,designname);
					//終わってからcount++
					System.out.println(session.getAttribute("count")+"542");
					session.setAttribute("count",count+1);
					System.out.println(session.getAttribute("count")+"544");
				}
				else{
					//デザインをしていないメッセージorエラー
					//errflg = true;
					disp = "err";
					request.setAttribute("error", disp);
				}
			}
			catch(IOException e){
				//errflg =true;
				disp = "IOE";
				request.setAttribute("error",disp);
			}
			catch(Exception e){
				//ゲスト
				//errflg = true;
				disp = "Exception";
				request.setAttribute("error",disp);
			}
			finally{
				//result.jspに転送する。
				RequestDispatcher reqDisp = request.getRequestDispatcher("result.jsp");
				reqDisp.forward(request,response);
				System.out.println("finnallyok");
			}
		}

		//デザイン投稿
		if(request.getParameter("open") != null){
			DesignDao dd = new DesignDao();
			int did = 0;
			if(request.getParameter("designid") != null){
				did = Integer.parseInt(request.getParameter("designid"));
			}
			int uid = 0;
			String designname = null;
			System.out.println(request.getParameter("degignname"));
			if(session.getAttribute("uid") != null){
				uid = (int) session.getAttribute("uid");
			}
			//デザイン名取得
			designname = request.getParameter("degignname");

			//did = dd.getdesignid(uid);
			//更新（引数ユーザIDとデザインID）
			daohew.opendesign(designname , uid , did);

			opendesignflg = true;
		}

		//投稿ボタン押下
		if(request.getParameter("toukou") != null){
			//投稿機能フラグを立てる
			opendesignflg = true;
		}

		//デザイン公開フラグが立っている時
		if(opendesignflg){
			DesignDao dd = new DesignDao();
			//結果取得用
			ArrayList<Design> dg = new ArrayList<Design>();
			//openflg有無
			int openflg;
			//デザインページから
			if(request.getParameter("publicopen") != null){
				openflg = 1;
				disp = "opendesign.jsp";
				//デザイン一覧取得
				dg = dd.openall(openflg);
			}
			//カスタム画面から
			else{
				//ユーザID
				int uid;
				if(session.getAttribute("uid") != null){
					uid = (int) session.getAttribute("uid");
					openflg = 0;
					disp = "open.jsp";
					//デザイン一覧取得
					dg = dd.deimg(uid, openflg);
				}
			}
			//セッションに格納
			session.setAttribute("open",dg);
			//result.jspに転送する。
			RequestDispatcher reqDisp = request.getRequestDispatcher(disp);
			reqDisp.forward(request,response);
			opendesignflg = false;
		}

	}

}
