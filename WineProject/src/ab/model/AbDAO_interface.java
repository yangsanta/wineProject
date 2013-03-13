package ab.model;

import java.util.*;

import admins.model.AdminsVO;

public interface AbDAO_interface {
          public void insert(AbVO abVO);
          public void update(AbVO abVO);
          public void delete(Integer Uniid);
          public AbVO findByPrimaryKey(Integer Uniid);
          public AbVO findByAKey(Integer Aid);
          public List<AbVO> getAll();
}
