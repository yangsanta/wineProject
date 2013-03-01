package member.model;

import java.util.*;

public interface MemberDAO_interface {
          public void insert(MemberVO memberVO);
          public void update(MemberVO memberVO);
          public void delete(Integer m_no);
          public MemberVO findByPrimaryKey(Integer m_no);
          public List<MemberVO> getAll();
}
