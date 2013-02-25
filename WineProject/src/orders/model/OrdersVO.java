package orders.model;
import java.awt.Image;
import java.sql.Date;

public class OrdersVO implements java.io.Serializable{
	
	private Integer o_no;
	private Integer m_no;
	private Date o_date;
	private String c_key;
	private Double o_shipping;
	private Double o_after_sales;
	private String o_recipient;
	private String o_recipient_addr;
	private String o_recipient_tel;
	private String o_status;
	private String o_pic;
	
	public Integer getO_no() {
		return o_no;
	}
	public void setO_no(Integer o_no) {
		this.o_no = o_no;
	}
	public Integer getM_no() {
		return m_no;
	}
	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	public String getC_key() {
		return c_key;
	}
	public void setC_key(String c_key) {
		this.c_key = c_key;
	}
	public Double getO_shipping() {
		return o_shipping;
	}
	public void setO_shipping(Double o_shipping) {
		this.o_shipping = o_shipping;
	}
	public Double getO_after_sales() {
		return o_after_sales;
	}
	public void setO_after_sales(Double o_after_sales) {
		this.o_after_sales = o_after_sales;
	}
	public String getO_recipient() {
		return o_recipient;
	}
	public void setO_recipient(String o_recipient) {
		this.o_recipient = o_recipient;
	}
	public String getO_recipient_addr() {
		return o_recipient_addr;
	}
	public void setO_recipient_addr(String o_recipient_addr) {
		this.o_recipient_addr = o_recipient_addr;
	}
	public String getO_recipient_tel() {
		return o_recipient_tel;
	}
	public void setO_recipient_tel(String o_recipient_tel) {
		this.o_recipient_tel = o_recipient_tel;
	}
	public String getO_status() {
		return o_status;
	}
	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
	public String getO_pic() {
		return o_pic;
	}
	public void setO_pic(String o_pic) {
		this.o_pic = o_pic;
	}
	
	
}
