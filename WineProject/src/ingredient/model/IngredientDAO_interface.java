package ingredient.model;

import java.util.*;

public interface IngredientDAO_interface {
          public void insert(IngredientVO ingredientVO);
          public void update(IngredientVO ingredientVO);
          public void delete(Integer i_id);
          public IngredientVO findByPrimaryKey(Integer i_id);
          public List<IngredientVO> getAll();
}
