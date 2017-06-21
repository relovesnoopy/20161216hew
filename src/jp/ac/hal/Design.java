package jp.ac.hal;

public class Design {
	private int  designid;
	private int userid;
	private String designname;
	private String designimagepass;
	private int openflg;
	private String designdatetime;
	public int getDesignid() {
		return designid;
	}
	public void setDesignid(int designid) {
		this.designid = designid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getDesignname() {
		return designname;
	}
	public void setDesignname(String designname) {
		this.designname = designname;
	}
	public String getDesignimagepass() {
		return designimagepass;
	}
	public void setDesignimagepass(String designimagepass) {
		this.designimagepass = designimagepass;
	}
	public int getOpenflg() {
		return openflg;
	}
	public void setOpenflg(int openflg) {
		this.openflg = openflg;
	}
	public String getDesigndatetime() {
		return designdatetime;
	}
	public void setDesigndatetime(String designdatetime) {
		this.designdatetime = designdatetime;
	}

}
