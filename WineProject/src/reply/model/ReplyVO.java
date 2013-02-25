package reply.model;
import java.sql.Date;

public class ReplyVO  implements java.io.Serializable{
	private Integer d_no;
	private Integer r_no;
	private String r_context;
	private Integer m_no;
	private Date r_datetime;
	private String r_status;
	private Date r_final_edit;
	
	public Integer getD_no() {
		return d_no;
	}
	public void setD_no(Integer d_no) {
		this.d_no = d_no;
	}
	public Integer getR_no() {
		return r_no;
	}
	public void setR_no(Integer r_no) {
		this.r_no = r_no;
	}
	public String getR_context() {
		return r_context;
	}
	public void setR_context(String r_context) {
		this.r_context = r_context;
	}
	public Integer getM_no() {
		return m_no;
	}
	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}
	public Date getR_datetime() {
		return r_datetime;
	}
	public void setR_datetime(Date r_datetime) {
		this.r_datetime = r_datetime;
	}
	public String getR_status() {
		return r_status;
	}
	public void setR_status(String r_status) {
		this.r_status = r_status;
	}
	public Date getR_final_edit() {
		return r_final_edit;
	}
	public void setR_final_edit(Date r_final_edit) {
		this.r_final_edit = r_final_edit;
	}
	
}
