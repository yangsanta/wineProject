package food.model;

import java.util.*;

public interface FoodDAO_interface {
          public void insert(FoodVO foodVO);
          public void update(FoodVO foodVO);
          public void delete(Integer f_id);
          public FoodVO findByPrimaryKey(Integer f_id);
          public List<FoodVO> getAll();
}
