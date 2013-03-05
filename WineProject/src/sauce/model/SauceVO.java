package sauce.model;


public class SauceVO implements java.io.Serializable{
	private Integer s_id;
	private Integer i_id;
	private String s_name;
	
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public Integer geti_id() {
		return i_id;
	}
	public void seti_id(Integer i_id) {
		this.i_id = i_id;
	}


}
