package food_set.model;

import food.model.FoodVO;
import ingredient.model.IngredientVO;
import sauce.model.SauceVO;

public class Food_setVO implements java.io.Serializable {
	
	private Integer fs_id;
//	private Integer f_id;
//	private Integer i_id;
//	private Integer s_id;
	private FoodVO foodVO;
	private IngredientVO ingredientVO;
	private SauceVO sauceVO;
	
	
	public Integer getFs_id() {
		return fs_id;
	}
	public void setFs_id(Integer fs_id) {
		this.fs_id = fs_id;
	}
	public FoodVO getFoodVO() {
		return foodVO;
	}
	public void setFoodVO(FoodVO foodVO) {
		this.foodVO = foodVO;
	}
	public IngredientVO getIngredientVO() {
		return ingredientVO;
	}
	public void setIngredientVO(IngredientVO ingredientVO) {
		this.ingredientVO = ingredientVO;
	}
	public SauceVO getSauceVO() {
		return sauceVO;
	}
	public void setSauceVO(SauceVO sauceVO) {
		this.sauceVO = sauceVO;
	}
	
	
	
}
