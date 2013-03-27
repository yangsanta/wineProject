package ingredient.model;

import java.util.HashSet;
import java.util.Set;

import food_set.model.Food_setVO;

public class IngredientVO implements java.io.Serializable {
	private Integer i_id;
	private String i_name;
	private Set<Food_setVO> emps1 = new HashSet<Food_setVO>();

	public Set<Food_setVO> getEmps1() {
		return emps1;
	}

	public void setEmps1(Set<Food_setVO> emps1) {
		this.emps1 = emps1;
	}

	public IngredientVO() {
	}

	public IngredientVO(int parseInt) {
		// TODO Auto-generated constructor stub
	}

	public Integer getI_id() {
		return i_id;
	}

	public void setI_id(Integer i_id) {
		this.i_id = i_id;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

}
