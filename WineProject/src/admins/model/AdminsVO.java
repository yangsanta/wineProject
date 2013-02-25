package admins.model;

public class AdminsVO implements java.io.Serializable{
	private Integer a_no;
	private String a_name;
	private String a_pwd;
	private String a_role;
	
	public Integer getA_no() {
		return a_no;
	}
	public void setA_no(Integer a_no) {
		this.a_no = a_no;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_pwd() {
		return a_pwd;
	}
	public void setA_pwd(String a_pwd) {
		this.a_pwd = a_pwd;
	}
	public String getA_role() {
		return a_role;
	}
	public void setA_role(String a_role) {
		this.a_role = a_role;
	}
	
}