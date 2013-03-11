package food_set.model;

import java.util.*;

public interface Food_setDAO_interface {
          public void insert(Food_setVO food_setVO);
          public void update(Food_setVO food_setVO);
          public void delete(Integer Uniid);
          public Food_setVO findByPrimaryKey(Integer Uniid);
          public List<Food_setVO> getAll();
          public Integer findTotalNOofFood_set();
          
}
