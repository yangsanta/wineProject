package recipe.model;

import java.util.*;

public interface RecipeDAO_interface {
          public void insert(RecipeVO recipeVO);
          public void update(RecipeVO recipeVO);
          public void delete(Integer rp_id);
          public RecipeVO findByPrimaryKey(Integer rp_id);
          public List<RecipeVO> getAll();
}
