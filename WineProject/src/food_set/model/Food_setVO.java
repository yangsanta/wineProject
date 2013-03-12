package food_set.model;

import member.model.HashSet;
import member.model.MemberVO;
import member.model.Set;


public class Food_setVO implements java.io.Serializable{
	private Integer Uniid;
	private Integer fs_id;
	private Integer s_id;
	private ProductVO productVO;
	
	private Set<Food_setVO> food_set = new HashSet<Food_setVO>();
	public Set<Food_setVO> getFood_set() {
		return food_set;
	}
	public void setFood_set(Set<Food_setVO> food_set) {
		this.food_set = food_set;
	}
	
	public Integer getUniid() {
		return Uniid;
	}
	public void setUniid(Integer Uniid) {
		this.Uniid = Uniid;
	}
	public Integer getFs_id() {
		return fs_id;
	}
	public void setFs_id(Integer fs_id) {
		this.fs_id = fs_id;
	}
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}


}
