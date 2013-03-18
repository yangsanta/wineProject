package food_set.model;

import ingredient.model.IngredientVO;
import product.model.ProductVO;
import sauce.model.SauceVO;
import food.model.FoodVO;

public class Food_setVO implements java.io.Serializable {
	
	private Integer fs_id;
	private ProductVO productVO;
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
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	
	
}
