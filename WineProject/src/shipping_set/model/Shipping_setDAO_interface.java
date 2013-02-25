package shipping_set.model;

import java.util.*;

public interface Shipping_setDAO_interface {
          public void insert(Shipping_setVO shipping_setVO);
          public void update(Shipping_setVO shipping_setVO);
          public void delete(Integer min_pirce);
          public Shipping_setVO findByPrimaryKey(Integer min_pirce);
          public List<Shipping_setVO> getAll();
}
