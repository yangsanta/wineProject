package adminLogin.model;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class AdminLoginVO implements java.io.Serializable{
	private Integer a_no;

	private String a_name = null;
	private String a_pwd = null;
	private String a_role = null;

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
