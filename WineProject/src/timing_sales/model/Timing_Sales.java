package timing_sales.model;

import java.sql.Timestamp;

import product.model.ProductVO;

public class Timing_Sales implements java.io.Serializable{
	Integer ts_id;
	ProductVO productVO; 
	Integer ts_price;
	String ts_slogan; 
	String ts_pic;
	String ts_content;
	Timestamp ts_date;
	Integer ts_totalsale;
	
	public Integer getTs_id() {
		return ts_id;
	}
	public void setTs_id(Integer ts_id) {
		this.ts_id = ts_id;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public Integer getTs_price() {
		return ts_price;
	}
	public void setTs_price(Integer ts_price) {
		this.ts_price = ts_price;
	}
	public String getTs_slogan() {
		return ts_slogan;
	}
	public void setTs_slogan(String ts_slogan) {
		this.ts_slogan = ts_slogan;
	}
	public String getTs_pic() {
		return ts_pic;
	}
	public void setTs_pic(String ts_pic) {
		this.ts_pic = ts_pic;
	}
	public String getTs_content() {
		return ts_content;
	}
	public void setTs_content(String ts_content) {
		this.ts_content = ts_content;
	}
	public Timestamp getTs_date() {
		return ts_date;
	}
	public void setTs_date(Timestamp ts_date) {
		this.ts_date = ts_date;
	}
	public Integer getTs_totalsale() {
		return ts_totalsale;
	}
	public void setTs_totalsale(Integer ts_totalsale) {
		this.ts_totalsale = ts_totalsale;
	}
	
}
