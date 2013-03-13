package coupon.model;

import java.sql.Timestamp;

public class CouponVO {

	private String c_key;
	private Integer c_price;
	private Boolean c_status;
	private Timestamp c_deadline;
	private Integer m_no;
	
	public String getC_key() {
		return c_key;
	}
	public void setC_key(String c_key) {
		this.c_key = c_key;
	}
	public Integer getC_price() {
		return c_price;
	}
	public void setC_price(Integer c_price) {
		this.c_price = c_price;
	}
	public Boolean getC_status() {
		return c_status;
	}
	public void setC_status(Boolean c_status) {
		this.c_status = c_status;
	}
	public Timestamp getC_deadline() {
		return c_deadline;
	}
	public void setC_deadline(Timestamp c_deadline) {
		this.c_deadline = c_deadline;
	}
	public Integer getM_no() {
		return m_no;
	}
	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}
	
	
}
