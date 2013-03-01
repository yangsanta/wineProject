package sauce.model;

import java.util.*;

public interface SauceDAO_interface {
          public void insert(SauceVO sauceVO);
          public void update(SauceVO sauceVO);
          public void delete(Integer s_id);
          public SauceVO findByPrimaryKey(Integer s_id);
          public List<SauceVO> getAll();
}
