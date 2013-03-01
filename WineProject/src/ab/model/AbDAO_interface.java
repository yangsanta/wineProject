package ab.model;

import java.util.*;

public interface AbDAO_interface {
          public void insert(AbVO abVO);
          public void update(AbVO abVO);
          public void delete(Integer Uniid);
          public AbVO findByPrimaryKey(Integer Uniid);
          public List<AbVO> getAll();
}
