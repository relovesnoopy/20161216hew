package jp.ac.hal;

public class Favoritejoinproduct {
	private int favoid;
	private int userid;
	private String favodate;
	private int productid;
	private int itemno;
	private int categoryid;
	public int getFavoid() {
		return favoid;
	}
	public void setFavoid(int favoid) {
		this.favoid = favoid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getFavodate() {
		return favodate;
	}
	public void setFavodate(String favodate) {
		this.favodate = favodate;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getItemno() {
		return itemno;
	}
	public void setItemno(int itemno) {
		this.itemno = itemno;
	}
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getImagepass() {
		return imagepass;
	}
	public void setImagepass(String imagepass) {
		this.imagepass = imagepass;
	}
	private String productname ;
	private int price;
	private String color;
	private String imagepass;
}
