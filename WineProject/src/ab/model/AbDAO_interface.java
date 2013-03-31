package ab.model;

import java.util.*;

import admins.model.AdminsVO;

public interface AbDAO_interface {
          public void insert(AbVO abVO);
          public void update(AbVO abVO);
          public void delete(Integer Uniid);
          public AbVO findByPrimaryKey(Integer Uniid);
          public List<AbVO> getAll();
          public AbVO findByAKey(Integer ab_a_p_id);
          public AbVO findByBKey(Integer ab_b_p_id);
          public void deleteByA(Integer ab_a_p_id);
          public void deleteByB(Integer ab_b_p_id);
}
