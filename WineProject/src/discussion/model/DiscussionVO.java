package discussion.model;
import java.sql.Timestamp;

import member.model.MemberVO;

public class DiscussionVO  implements java.io.Serializable{
	private Integer d_no;
//	private Integer m_no;
	private MemberVO memberVO;
	public MemberVO getMemberVO(){
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO){
		this.memberVO = memberVO;
	}
	
	private String d_context;
	private Timestamp d_datetime;
	private String d_status;
	private Timestamp d_final_edit;
	private String d_title;
//	private String m_name;
//	
//	public String getM_name() {
//		return m_name;
//	}
//	public void setM_name(String m_name) {
//		this.m_name = m_name;
//	}
	
	
	public Integer getD_no() {
		return d_no;
	}
	public void setD_no(Integer d_no) {
		this.d_no = d_no;
	}
	public String getD_context() {
		return d_context;
	}
	public void setD_context(String d_context) {
		this.d_context = d_context;
	}
	public Timestamp getD_datetime() {
		return d_datetime;
	}
	public void setD_datetime(Timestamp d_datetime) {
		this.d_datetime = d_datetime;
	}
	public String getD_status() {
		return d_status;
	}
	public void setD_status(String d_status) {
		this.d_status = d_status;
	}
	public Timestamp getD_final_edit() {
		return d_final_edit;
	}
	public void setD_final_edit(Timestamp d_final_edit) {
		this.d_final_edit = d_final_edit;
	}
	public String getD_title() {
		return d_title;
	}
	public void setD_title(String d_title) {
		this.d_title = d_title;
	}
	
}
