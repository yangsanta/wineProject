package coupon_set.model;

import java.util.*;

public interface Coupon_setDAO_interface {
          public void insert(Coupon_setVO coupon_setVO);
          public void update(Coupon_setVO coupon_setVO);
          public void delete(Integer cs_limit_price);
          public Coupon_setVO findByPrimaryKey(Integer cs_limit_price);
          public List<Coupon_setVO> getAll();
}
