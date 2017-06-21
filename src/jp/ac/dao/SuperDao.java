package jp.ac.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SuperDao {
	//接続情報
		private String url;
		private String user;
		private String password;
		//コネクション
		protected Connection conn;
		//ステートメント
		protected PreparedStatement st;
		//リザルトセット
		protected ResultSet rs;

		public SuperDao(){
			//初期値を設定
			this.url = "jdbc:mysql://localhost/protohew";
			this.user = "hew_user";
			this.password = "hewhew";
			//コネクションオブジェクト初期化
			this.conn = null;
			//ステートメントの初期化
			this.st = null;
			//リザルトセットの初期化
			this.rs = null;
		}

		//getConnectionメソッド
		@SuppressWarnings("finally")
		protected int getConnection(){
			int intRet = 0;
			try{
				//ドライバーの読み込み
				Class.forName("com.mysql.jdbc.Driver");
				//コネクション作成
				this.conn = DriverManager.getConnection(url,user,password);
			}
			catch(SQLException e){
				intRet = 2;
			}
			catch(Exception e){
				intRet = 1;
			}
			finally{
				return intRet;
			}
		}

		//closeDBメソッド
		@SuppressWarnings("finally")
		protected int closeDB(){
			int intRet = 0;
			try{
				//リザルトセットのクローズ
				if(this.rs != null){
					this.rs.close();
				}
				//ステートメントのクローズ
				if(this.st != null){
					this.st.close();
				}
				//コネクションのクローズ
				if(this.conn != null){
					this.conn.close();
				}
			}
			catch(SQLException e){
				e.printStackTrace();
				intRet = 1;
			}
			finally{
				return intRet;
			}
		}
}
