package food.model;

 
public class FoodVO implements java.io.Serializable{
	private Integer f_id;
	private String f_name;
	
	public Integer getf_id() {
		return f_id;
	}
	public void setf_id(Integer f_id) {
		this.f_id = f_id;
	}
	public String getf_name() {
		return f_name;
	}
	public void setf_name(String f_name) {
		this.f_name = f_name;
	}


}
