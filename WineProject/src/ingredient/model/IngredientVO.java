package ingredient.model;


public class IngredientVO implements java.io.Serializable{
	private Integer i_id;
	private Integer f_id;
	private String i_name;
	
	public Integer geti_id() {
		return i_id;
	}
	public void seti_id(Integer i_id) {
		this.i_id = i_id;
	}
	public String geti_name() {
		return i_name;
	}
	public void seti_name(String i_name) {
		this.i_name = i_name;
	}
	public Integer getf_id() {
		return f_id;
	}
	public void setf_id(Integer f_id) {
		this.f_id = f_id;
	}


}
