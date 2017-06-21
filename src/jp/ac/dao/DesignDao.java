package jp.ac.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import jp.ac.hal.Design;
import jp.ac.hal.Pur;

public class DesignDao extends SuperDao{

	//designデータ設定
	//design_id,user_id,de_img_passの設定
	public void insertdesign(int did,int uid,String deimgpass,int openflg,String designname){
		int intRet = 0;
		intRet = this.getConnection();
		if(intRet == 0){
			//実行SQLを作成
			String sql = "insert into `protohew`.`design` (`design_id`,`user_id`,`de_img_pass`,`openflg`,`design_name`) values (?,?,?,?,?);";
			try{
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				//SQLにユーザIDと画像passを埋め込む
				this.st.setInt(1,did);
				this.st.setInt(2,uid);
				this.st.setString(3,deimgpass);
				this.st.setInt(4,openflg);
				this.st.setString(5,designname);
				//SQL実行
				this.st.executeUpdate();
			}
			catch(SQLException e){
				e.printStackTrace();
			}
			finally
			{
				//クローズ処理
				this.closeDB();
			}
		}
	}


	//design_idの取得
	public int getdesignid(int uid){
		int intRet = 0;
		//結果取得用
		int getdesignid = 0;
		//DB接続
		intRet = this.getConnection();
		if(intRet == 0){
			try{
				String sql = "select design_id from design where user_id=?;";
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setInt(1,uid);
				//SQL実行
				this.rs = this.st.executeQuery();
				//リザルトセットから値を取り出しgetdesignidに格納
				while(rs.next()){
					//ユーザ情報格納
					getdesignid = rs.getInt("design_id");
					System.out.println(getdesignid);
				}
			}
			catch(SQLException e){
				//異常時はgetdesignid を0に設定
				getdesignid = 0;
				System.out.println(this.conn);
				System.out.println(e.getMessage());
			}
			finally{
				//クローズ処理
				intRet = this.closeDB();
				if(intRet != 0){
					//異常時はgetdesignid を0に設定
					getdesignid = 0;
				}
			}
		}
		return getdesignid ;
	}

	//デザイン画像一覧（ユーザごと）
	public ArrayList<Design> deimg(int uid,int openflg){
		int intRet = 0;
		ArrayList<Design> dimage = new ArrayList<Design>();
		//DB接続
		intRet = this.getConnection();
		if(intRet == 0){
			try{
				String sql = "SELECT * FROM `design` WHERE `user_id` = ? AND `openflg` = ? ;";
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setInt(1,uid);
				this.st.setInt(2,openflg);
				//SQL実行
				this.rs = this.st.executeQuery();
				//リザルトセットから値を取り出し配列dfavoに格納
				while(rs.next()){
					Design dg = new Design();
					dg.setDesignid(rs.getInt("design_id"));
					dg.setDesignimagepass(rs.getString("de_img_pass"));
					dg.setDesignname(rs.getString("design_name"));
					dg.setUserid(rs.getInt("user_id"));
					dg.setOpenflg(rs.getInt("openflg"));
					dimage.add(dg);
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
		return dimage;
	}

	//デザイン画像一覧(すべて)
	public ArrayList<Design> openall(int openflg){
		int intRet = 0;
		ArrayList<Design> dimage = new ArrayList<Design>();
		//DB接続
		intRet = this.getConnection();
		if(intRet == 0){
			try{
				String sql = "SELECT * FROM `design` WHERE `openflg` = ? ;";
				//ステートメント作成
				this.st = this.conn.prepareStatement(sql);
				this.st.setInt(1,openflg);
				//SQL実行
				this.rs = this.st.executeQuery();
				//リザルトセットから値を取り出し配列dfavoに格納
				while(rs.next()){
					Design dg = new Design();
					dg.setDesignid(rs.getInt("design_id"));
					dg.setDesignimagepass(rs.getString("de_img_pass"));
					dg.setDesignname(rs.getString("design_name"));
					dg.setUserid(rs.getInt("user_id"));
					dg.setOpenflg(rs.getInt("openflg"));
					dimage.add(dg);
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
		return dimage;
	}


	//デザイン画像一覧(すべて)
		public ArrayList<Design> designhistory(int uid){
			int intRet = 0;
			ArrayList<Design> dhis = new ArrayList<Design>();
			//DB接続
			intRet = this.getConnection();
			if(intRet == 0){
				try{
					String sql = "SELECT * FROM `design` WHERE `user_id` = ? ;";
					//ステートメント作成
					this.st = this.conn.prepareStatement(sql);
					this.st.setInt(1,uid);
					//SQL実行
					this.rs = this.st.executeQuery();
					//リザルトセットから値を取り出し配列dfavoに格納
					while(rs.next()){
						Design dg = new Design();
						dg.setDesignid(rs.getInt("design_id"));
						dg.setDesignimagepass(rs.getString("de_img_pass"));
						dg.setDesignname(rs.getString("design_name"));
						dg.setUserid(rs.getInt("user_id"));
						dg.setOpenflg(rs.getInt("openflg"));
						dg.setDesigndatetime(rs.getString("design_reg_datetime"));
						dhis.add(dg);
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
			return dhis;
		}

	//デザイン購入履歴
	public ArrayList<Design> designpurhis(ArrayList<Pur> pur,int uid){
		int intRet = 0;
		//DB接続
		intRet = this.getConnection();
		//リザルトセットから値を取り出しgetdesignidに格納
		ArrayList<Design> design = new ArrayList<Design>();
		if(intRet == 0){
			try{
				for(Pur element:pur){
					String sql = "SELECT * FROM design WHERE design_id=? AND user_id=?;";
					//ステートメント作成
					this.st = this.conn.prepareStatement(sql);
					this.st.setInt(1,element.getDesignid());
					this.st.setInt(2,uid);
					//SQL実行
					this.rs = this.st.executeQuery();
					while(rs.next()){
						Design d = new Design();
						d.setDesignid(rs.getInt("design_id"));
						d.setDesignname(rs.getString("design_name"));
						d.setDesignimagepass(rs.getString("de_img_pass"));
						design.add(d);
					}
				}
			}
			catch(SQLException e){
				System.out.println(this.conn);
				e.printStackTrace();
			}
			finally{
				//クローズ処理
				intRet = this.closeDB();
			}
		}
		return design;
	}
}
