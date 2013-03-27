package food.model;

import java.util.HashSet;
import java.util.Set;

import food_set.model.Food_setVO;

public class FoodVO implements java.io.Serializable {
	private Integer f_id;
	private String f_name;
	private Set<Food_setVO> emps = new HashSet<Food_setVO>();

	public Set<Food_setVO> getEmps() {
		return emps;
	}

	public void setEmps(Set<Food_setVO> emps) {
		this.emps = emps;
	}

	public FoodVO() {
	}

	public FoodVO(int parseInt) {
		// TODO Auto-generated constructor stub
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public Integer getF_id() {
		return f_id;
	}

	public void setF_id(Integer f_id) {
		this.f_id = f_id;
	}

}
