package rg.model;
import java.sql.Date;

public class RgVO implements java.io.Serializable{
	private Integer u_id;
	private Integer p_no;
	private String r_or_g;
	private Integer rg_area;
	private Date rgs_date;
	private Date rge_date;
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public Integer getP_no() {
		return p_no;
	}
	public void setP_no(Integer p_no) {
		this.p_no = p_no;
	}
	public String getR_or_g() {
		return r_or_g;
	}
	public void setR_or_g(String r_or_g) {
		this.r_or_g = r_or_g;
	}
	public Integer getRg_area() {
		return rg_area;
	}
	public void setRg_area(Integer rg_area) {
		this.rg_area = rg_area;
	}
	public Date getRgs_date() {
		return rgs_date;
	}
	public void setRgs_date(Date rgs_date) {
		this.rgs_date = rgs_date;
	}
	public Date getRge_date() {
		return rge_date;
	}
	public void setRge_date(Date rge_date) {
		this.rge_date = rge_date;
	}
}
	
	