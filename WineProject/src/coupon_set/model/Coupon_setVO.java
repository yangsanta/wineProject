package coupon_set.model;


public class Coupon_setVO implements java.io.Serializable{
	private Integer cs_limit_price;
	private Integer cs_price;
	
	public Integer getCs_limit_price() {
		return cs_limit_price;
	}
	public void setCs_limit_price(Integer cs_limit_price) {
		this.cs_limit_price = cs_limit_price;
	}
	public Integer getCs_price() {
		return cs_price;
	}
	public void setCs_price(Integer cs_price) {
		this.cs_price = cs_price;
	}
	
}
