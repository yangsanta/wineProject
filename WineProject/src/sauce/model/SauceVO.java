package sauce.model;

import java.util.HashSet;
import java.util.Set;

import food_set.model.Food_setVO;

public class SauceVO implements java.io.Serializable {
	private Integer s_id;
	private String s_name;

	private Set<Food_setVO> emps2 = new HashSet<Food_setVO>();

	public Set<Food_setVO> getEmps2() {
		return emps2;
	}

	public void setEmps2(Set<Food_setVO> emps2) {
		this.emps2 = emps2;
	}

	public SauceVO() {
	}

	public SauceVO(int parseInt) {
		// TODO Auto-generated constructor stub
	}

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
}
