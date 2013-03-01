package admins.model;

import java.util.*;

public interface AdminsDAO_interface {
          public void insert(AdminsVO adminsVO);
          public void update(AdminsVO adminsVO);
          public void delete(Integer a_no);
          public AdminsVO findByPrimaryKey(Integer a_no);
          public List<AdminsVO> getAll();
}
