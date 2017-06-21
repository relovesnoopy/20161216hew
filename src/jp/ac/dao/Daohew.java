package jp.ac.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import jp.ac.hal.Favorite;
import jp.ac.hal.Favoritejoinproduct;
import jp.ac.hal.Logo;
import jp.ac.hal.Product;
import jp.ac.hal.Pur;
import jp.ac.hal.User;

public class Daohew extends SuperDao{

	//会員登録メソッド
	public void confilm(String fname,String lname,int sex,String tel,String add,String post,String mail,String passwd){
		int intRet = 0;
		intRet = this.getConnection();
		if(intRet == 0){
			String sql = "insert into `protohew`.`user_reg`(f_name,l_name,sex,tel,address,post,mail,password) values(?,?,?,?,?,?,?,?)";
			try{
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setString(1, fname);
				this.st.setString(2, lname);
				this.st.setInt(3, sex);
				this.st.setString(4, tel);
				this.st.setString(5, add);
				this.st.setString(6, post);
				this.st.setString(7, mail);
				this.st.setString(8, passwd);
				//SQL実行
				this.st.executeUpdate();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				//クローズ処理
				this.closeDB();
			}
		}
	}

	//ログイン
	public int login(String mail,String pass){
		int intRet = 0;
		intRet = this.getConnection();
		//結果格納用
		int intcnt = 0;
		//SQL文作成
		String sql = "select user_id from user_reg where mail=? && password=?;";
		if(intRet == 0){
			try{
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setString(1,mail);
				this.st.setString(2,pass);
				//SQL実行
				this.rs = this.st.executeQuery();
				while(rs.next()){
					intcnt = rs.getInt("user_id");
				}
			}
			catch(SQLException e){
				//ログイン失敗？
				//エラーの場合intRetの値を0にする
				intcnt = 0;
				System.out.println(e.getMessage());
			}
			catch (NullPointerException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally{
				//クローズ処理
				this.closeDB();
			}
		}
		return intcnt;
	}

	//プロフィール変更
	public void chnageuserinfo(String fname,String lname,int sex,String tel,String add,String post,String mail,String passwd,int uid){
		int intRet = 0;
		intRet = this.getConnection();
		if(intRet == 0){
			String sql = " UPDATE `protohew`.`user_reg` SET  `f_name` = ?,`l_name` = ?, `sex` = ? , `tel` = ?,`address` = ?, `post` = ?,`mail` = ?, `password` = ?  WHERE `user_reg`.`User_id` = ?;";
			try{
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setString(1, fname);
				this.st.setString(2, lname);
				this.st.setInt(3, sex);
				this.st.setString(4, tel);
				this.st.setString(5, add);
				this.st.setString(6, post);
				this.st.setString(7, mail);
				this.st.setString(8, passwd);
				this.st.setInt(9, uid);
				//SQL実行
				this.st.executeUpdate();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally{
				//クローズ処理
				this.closeDB();
			}
		}
	}


	//ユーザ情報取得
	public ArrayList<User> userinfo(int uid){
		int intRet = 0;
		//DB接続
		intRet = this.getConnection();
		//リザルトセットから値を取り出しgetdesignidに格納
		ArrayList<User> userinfo = new ArrayList<User>();
		if(intRet == 0){
			try{
				String sql = "select * from user_reg where user_id=?;";
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setInt(1,uid);
				//SQL実行
				this.rs = this.st.executeQuery();
				while(rs.next()){
					User u = new User();
					u.setUserid(rs.getInt("user_id"));
					u.setFname(rs.getString("f_name"));
					u.setLname(rs.getString("l_name"));
					u.setMail(rs.getString("mail"));
					u.setTel(rs.getString("tel"));
					u.setPost(rs.getString("post"));
					u.setAddress(rs.getString("address"));
					userinfo.add(u);
				}
			}
			catch(SQLException e){
				System.out.println(this.conn);
				e.printStackTrace();
			}
			catch(NullPointerException e){
				e.printStackTrace();
			}
			finally{
				//クローズ処理
				intRet = this.closeDB();
				if(intRet != 0){
					//異常時はgetdesignid を0に設定
					intRet = 0;
				}
			}
		}
		return userinfo;

	}


	//公開(openflg,design_nameの更新)
	public void opendesign(String desiname , int uid , int did){
		int intRet = 0;
		//DB接続
		intRet = this.getConnection();
		if(intRet == 0){
			try{
				String sql = "UPDATE `protohew`.`design` SET `openflg` = '1' , `design_name` = ? WHERE `design`.`user_id` = ? AND `design`.`design_id` = ? ;";
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setString(1 , desiname);
				this.st.setInt(2 , uid);
				this.st.setInt(3 , did);
				//SQL実行
				this.st.executeUpdate();
			}
			catch(SQLException e){
				//異常時はgetdesignid を0に設定
				e.printStackTrace();
			}
			finally{
				//クローズ処理
				intRet = this.closeDB();
			}
		}
	}

	//購入メソッド
	public int pur(int uid){
		int intRet = 0;
		//DB接続
		intRet = this.getConnection();
		if(intRet == 0){
			try{
				String sql = "INSERT INTO `protohew`.`pur` (`user_id`) VALUES (?);";
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setInt(1,uid);
				//SQL実行
				this.st.executeUpdate();
				//リザルトセットから値を取り出しgetdesignidに格納
			}
			catch(SQLException e){
				//異常時はgetdesignid を0に設定
				System.out.println(e.getMessage());
			}
			catch(NullPointerException e){
				System.out.println(e.getMessage());
			}
			finally{
				//クローズ処理
				intRet = this.closeDB();
			}
		}
		return intRet ;
	}

	//購入詳細メソッド
	public int purdetails(int order,int projectid,int itemno,int quant,String size,int shopprice,int designid){
		int intRet = 0;
		intRet = this.getConnection();
		if(intRet == 0){
			try{
				String sql = "INSERT INTO `protohew`.`purchase_details` (`order_id`,`product_id`, `item_no`,`quantity`, `size`, `shopprice`,`design_id`) VALUES (?,?,?,?,?,?,?);";
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setInt(1, order);
				this.st.setInt(2,projectid);
				this.st.setInt(3,itemno);
				this.st.setInt(4,quant);
				this.st.setString(5,size);
				this.st.setInt(6,shopprice);
				this.st.setInt(7,designid);
				//SQL実行
				this.st.executeUpdate();
				//リザルトセットから値を取り出しgetdesignidに格納
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			catch(NullPointerException e){
				e.printStackTrace();
			}
			finally{
				//クローズ処理
				intRet = this.closeDB();
			}
		}
		return 0;
	}

	//購入履歴
	public ArrayList<Pur> purhis(int uid){
		int intRet = 0;
		//DB接続
		intRet = this.getConnection();
		//リザルトセットから値を取り出しgetdesignidに格納
		ArrayList<Pur> getorderid = new ArrayList<Pur>();
		if(intRet == 0){
			try{
				String sql = "select pur.order_id,product_id,item_no,size,quantity,shopprice,design_id,pur_date from pur join purchase_details on pur.order_id=purchase_details.order_id where user_id=?;";
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setInt(1,uid);
				//SQL実行
				this.rs = this.st.executeQuery();
				while(rs.next()){
					Pur p = new Pur();
					p.setOrderid(rs.getInt("order_id"));
					p.setProduct_id(rs.getInt("product_id"));
					p.setItem_no(rs.getInt("item_no"));
					p.setSize(rs.getString("size"));
					p.setQuantity(rs.getInt("quantity"));
					p.setShopprice(rs.getInt("shopprice"));
					p.setDesignid(rs.getInt("design_id"));
					p.setPurdate(rs.getString("pur_date"));
					getorderid.add(p);
				}
			}
			catch(SQLException e){
				System.out.println(this.conn);
				e.printStackTrace();
			}
			catch(NullPointerException e){
				e.printStackTrace();
			}
			finally{
				//クローズ処理
				intRet = this.closeDB();
				if(intRet != 0){
					//異常時はgetdesignid を0に設定
					intRet = 0;
				}
			}
		}
		return getorderid;
	}
	//orderidの取得メソッド
	public ArrayList<Pur> purorder(int uid){
		int intRet = 0;
		//DB接続
		intRet = this.getConnection();
		//リザルトセットから値を取り出しgetdesignidに格納
		ArrayList<Pur> getorderid = new ArrayList<Pur>();
		if(intRet == 0){
			try{
				String sql = "SELECT `order_id` FROM `pur` WHERE `user_id` = ?;";
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setInt(1,uid);
				//SQL実行
				this.rs = this.st.executeQuery();
				while(rs.next()){
					Pur p = new Pur();
					p.setOrderid(rs.getInt("order_id"));
					getorderid.add(p);
				}
			}
			catch(SQLException e){
				System.out.println(this.conn);
				e.printStackTrace();
			}
			catch(NullPointerException e){
				e.printStackTrace();
			}
			finally{
				//クローズ処理
				intRet = this.closeDB();
				if(intRet != 0){
					//異常時はgetdesignid を0に設定
					intRet = 0;
				}
			}
		}
		return getorderid;
	}

	//履歴商品詳細
	public ArrayList<Product> item(ArrayList<Pur> pur){
		int intRet = 0;
		//DB接続
		intRet = this.getConnection();
		//リザルトセットから値を取り出しgetdesignidに格納
		ArrayList<Product> product = new ArrayList<Product>();
		if(intRet == 0){
			try{
				for(Pur element:pur){
					String sql = "SELECT product.product_id,product_name,price,item.item_no,item.color,item.image_pass FROM product JOIN item ON product.product_id = item.product_id WHERE item.product_id=? AND item.item_no=?;";
					//ステートメント作成
					this.st = this.conn.prepareStatement(sql);
					this.st.setInt(1,element.getProduct_id());
					this.st.setInt(2,element.getItem_no());
					//SQL実行
					this.rs = this.st.executeQuery();
					while(rs.next()){
						Product p = new Product();
						p.setImagepass(rs.getString("image_pass"));
						p.setColor(rs.getString("color"));
						p.setProductname(rs.getString("product_name"));
						p.setPrice(rs.getInt("price"));
						product.add(p);
					}
				}
			}
			catch(SQLException e){
				System.out.println(this.conn);
				e.printStackTrace();
			}
			catch(NullPointerException e){
				e.printStackTrace();
			}
			finally{
				//クローズ処理
				intRet = this.closeDB();
				if(intRet != 0){
					//異常時はgetdesignid を0に設定
					intRet = 0;
				}
			}
		}
		return product;
	}

	//商品 select
		public ArrayList<Product> selectproduct(){
			int intRet = 0;
			//ArratList
			ArrayList<Product> pro = new ArrayList<Product>();
			//connection
			intRet = this.getConnection();
			//conection okだったら
			if(intRet == 0){
				try{
					//sql実行or商品取り出す
					String sql = "select item.product_id,item.item_no,item.color,item.image_pass,category_id,product_name,price from product join item on product.product_id=item.product_id;";
					//statement
					this.st = this.conn.prepareStatement(sql);
					//sql 実行
					this.rs = this.st.executeQuery();
					//リザルトセットから値を取り出し product 配列に格納
					//ArrayListのインデックス初期化
					while(rs.next()){
						Product pr = new Product();
						pr.setProductid(rs.getInt("product_id"));
						pr.setItemno(rs.getInt("item_no"));
						pr.setColor(rs.getString("color"));
						pr.setImagepass(rs.getString("image_pass"));
						pr.setCategoryid(rs.getInt("category_id"));
						pr.setProductname(rs.getString("product_name"));
						pr.setPrice(rs.getInt("price"));
						pro.add(pr);
						//System.out.println(rs.getInt("price")+1);
					}
				}
				catch(SQLException e){
					e.printStackTrace();
				}
				finally{
					//クローズ処理
					intRet = this.closeDB();
				}
			}
			else{
				pro = null;
			}
			return pro;
		}

	//商品一覧絞りこみ
		public ArrayList<Product> selectcategory(int cid){
			int intRet = 0;
			//ArratList
			ArrayList<Product> pro = new ArrayList<Product>();
			//connection
			intRet = this.getConnection();
			//conection okだったら
			if(intRet == 0){
				try{
					//sql実行or商品取り出す
					String sql = "select item.product_id,item.item_no,item.color,item.image_pass,category_id,product_name,price from product join item on product.product_id=item.product_id where category_id=?;";
					//statement
					this.st = this.conn.prepareStatement(sql);
					this.st.setInt(1,cid);
					//sql 実行
					this.rs = this.st.executeQuery();
					//リザルトセットから値を取り出し product 配列に格納
					//ArrayListのインデックス初期化
					while(rs.next()){
						Product pr = new Product();
						pr.setProductid(rs.getInt("product_id"));
						pr.setItemno(rs.getInt("item_no"));
						pr.setColor(rs.getString("color"));
						pr.setImagepass(rs.getString("image_pass"));
						pr.setCategoryid(rs.getInt("category_id"));
						pr.setProductname(rs.getString("product_name"));
						pr.setPrice(rs.getInt("price"));
						pro.add(pr);
					}
				}
				catch(SQLException e){
					e.printStackTrace();
				}
				finally{
					//クローズ処理
					intRet = this.closeDB();
				}
			}
			else{
				pro = null;
			}
			return pro;
		}

		//ロゴ
			public ArrayList<Logo> logo(){
				int intRet = 0;
				//ArratList
				ArrayList<Logo> logo = new ArrayList<Logo>();
				//connection
				intRet = this.getConnection();
				//conection okだったら
				if(intRet == 0){
					try{
						//sql実行or商品取り出す
						String sql = "select * from logo;";
						//statement
						this.st = this.conn.prepareStatement(sql);
						//sql 実行
						this.rs = this.st.executeQuery();
						//リザルトセットから値を取り出し product 配列に格納
						//ArrayListのインデックス初期化
						while(rs.next()){
							Logo lg = new Logo();
							lg.setLogoid(rs.getInt("logo_id"));
							lg.setLogoname(rs.getString("logoname"));
							lg.setLogopass(rs.getString("logopass"));
							lg.setLogoprice(rs.getInt("logoprice"));
							logo.add(lg);
						}
					}
					catch(SQLException e){
						e.printStackTrace();
					}
					finally{
						//クローズ処理
						intRet = this.closeDB();
					}
				}
				return logo;
			}


			//お気に入り登録
			public void fav(int productid,int itemno, int userid){
				int intRet = 0;
				intRet = this.getConnection();
				if(intRet == 0){
					try{
						String sql = "insert into favorite(`product_id`,`item_no`,`user_id`,entered_datetime) values (?,?,?,curdate())";
						this.st = this.conn.prepareStatement(sql);
						this.st.setInt(1, productid);
						this.st.setInt(2,itemno);
						this.st.setInt(3, userid);
						this.st.executeUpdate();
					}
					catch(Exception e){
						e.printStackTrace();
					}
					finally{
						//close
						intRet = this.closeDB();
					}
				}
			}


			//お気に入り取得
			public ArrayList<Favorite> selectfavo(int uid){
				int intRet = 0;
				//ArratList
				ArrayList<Favorite> fv = new ArrayList<Favorite>();
				//connection
				intRet = this.getConnection();
				//conection okだったら
				if(intRet == 0){
					try{
						//sql実行or商品取り出す
						String sql = "select favorite_id,entered_datetime,product_id,item_no from favorite where user_id=?;";
						//statement
						this.st = this.conn.prepareStatement(sql);
						this.st.setInt(1,uid);
						//sql 実行
						this.rs = this.st.executeQuery();
						//リザルトセットから値を取り出し product 配列に格納
						//ArrayListのインデックス初期化
						while(rs.next()){
							Favorite f = new Favorite();
							f.setFavoid(rs.getInt("favorite_id"));
							f.setProductid(rs.getInt("product_id"));
							f.setItemno(rs.getInt("item_no"));
							f.setFavodate(rs.getString("entered_datetime"));
							fv.add(f);
						}
					}
					catch(SQLException e){
						e.printStackTrace();
					}
					finally{
						//クローズ処理
						intRet = this.closeDB();
					}
				}
				return fv;
			}

			public ArrayList<Favoritejoinproduct> getfavorite(int uid){
				int intRet = 0;
				//DB接続
				intRet = this.getConnection();
				//リザルトセットから値を取り出しgetdesignidに格納
				ArrayList<Favoritejoinproduct> favoriteitem = new ArrayList<Favoritejoinproduct>();
				if(intRet == 0){
					try{

						String sql = "select favorite.favorite_id,favorite.product_id,favorite.entered_datetime,product.category_id,product.price,product.product_name,item.color,item.item_no,item.image_pass from item inner join favorite on favorite.product_id = item.product_id inner join product on product.product_id = item.product_id where user_id=? and favorite.product_id=item.product_id and favorite.item_no = item.item_no;";
							//ステートメント作成
							this.st = this.conn.prepareStatement(sql);
							this.st.setInt(1,uid);
							//SQL実行
							this.rs = this.st.executeQuery();
							while(rs.next()){
								Favoritejoinproduct f = new Favoritejoinproduct();
								f.setProductid(rs.getInt("product_id"));
								f.setItemno(rs.getInt("item_no"));
								f.setImagepass(rs.getString("image_pass"));
								f.setColor(rs.getString("color"));
								f.setProductname(rs.getString("product_name"));
								f.setPrice(rs.getInt("price"));
								f.setFavoid(rs.getInt("favorite_id"));
								f.setFavodate(rs.getString("entered_datetime"));
								favoriteitem.add(f);
							}
					}
					catch(SQLException e){

						e.printStackTrace();
					}
					catch(NullPointerException e){
						e.printStackTrace();
					}
					finally{
						//クローズ処理
						intRet = this.closeDB();
					}
				}
				return favoriteitem;

			}

			//お気に入り情報取得
			public ArrayList<Product> favitem(ArrayList<Favorite> fav){
				int intRet = 0;
				//DB接続
				intRet = this.getConnection();
				//リザルトセットから値を取り出しgetdesignidに格納
				ArrayList<Product> product = new ArrayList<Product>();
				if(intRet == 0){
					try{
						for(Favorite element:fav){
							String sql = "SELECT product.product_id,product_name,price,item.item_no,item.color,item.image_pass FROM product JOIN item ON product.product_id = item.product_id WHERE item.product_id=? AND item.item_no=?;";
							//ステートメント作成
							this.st = this.conn.prepareStatement(sql);
							this.st.setInt(1,element.getProductid());
							this.st.setInt(2,element.getItemno());
							//SQL実行
							this.rs = this.st.executeQuery();
							while(rs.next()){
								Product p = new Product();
								p.setProductid(rs.getInt("product_id"));
								p.setItemno(rs.getInt("item_no"));
								p.setImagepass(rs.getString("image_pass"));
								p.setColor(rs.getString("color"));
								p.setProductname(rs.getString("product_name"));
								p.setPrice(rs.getInt("price"));
								product.add(p);
							}
						}
					}
					catch(SQLException e){
						System.out.println(this.conn);
						e.printStackTrace();
					}
					catch(NullPointerException e){
						e.printStackTrace();
					}
					finally{
						//クローズ処理
						intRet = this.closeDB();
						if(intRet != 0){
							//異常時はgetdesignid を0に設定
							intRet = 0;
						}
					}
				}
				return product;
			}

			//お気に入り削除
			public void favdelete(int fid){
				int intRet = 0;
				intRet = this.getConnection();
				if(intRet == 0){
					try{
						String sql = "DELETE FROM `protohew`.`favorite` WHERE `favorite`.`favorite_id` = ?;";
						this.st = this.conn.prepareStatement(sql);
						this.st.setInt(1,fid);
						//this.st.setInt(2,ino);
						this.st.executeUpdate();
					}
					catch(Exception e){
						e.printStackTrace();
					}
					finally{
						//close
						intRet = this.closeDB();
					}
				}
			}

}
