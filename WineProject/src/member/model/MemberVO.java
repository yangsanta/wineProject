package member.model;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class MemberVO implements java.io.Serializable{
	private Integer m_no;
	private String m_id;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	private String m_name = null;
	private String m_pwd = null;
	private String m_mobile = null;
	private String m_email = null;
	private Date m_bday = null;
	private String m_addr = null;
	private String m_pic = null;
	private String m_safety_q = null;
	private String m_safety_a = null;
	private Integer m_status = null;
	
	private Set<MemberVO> members = new HashSet<MemberVO>();
	public Set<MemberVO> getMembers() {
		return members;
	}
	public void setMembers(Set<MemberVO> members) {
		this.members = members;
	}
	
	
	public Integer getM_no() {
		return m_no;
	}
	public void setM_no(Integer m_no) {
		this.m_no = m_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_mobile() {
		return m_mobile;
	}
	public void setM_mobile(String m_mobile) {
		this.m_mobile = m_mobile;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public Date getM_bday() {
		return m_bday;
	}
	public void setM_bday(Date m_bday) {
		this.m_bday = m_bday;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_pic() {
		return m_pic;
	}
	public void setM_pic(String m_pic) {
		this.m_pic = m_pic;
	}
	public String getM_safety_q() {
		return m_safety_q;
	}
	public void setM_safety_q(String m_safety_q) {
		this.m_safety_q = m_safety_q;
	}
	public String getM_safety_a() {
		return m_safety_a;
	}
	public void setM_safety_a(String m_safety_a) {
		this.m_safety_a = m_safety_a;
	}
	public Integer getM_status() {
		return m_status;
	}
	public void setM_status(Integer m_status) {
		this.m_status = m_status;
	}

}
