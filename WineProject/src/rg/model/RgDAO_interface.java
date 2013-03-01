package rg.model;

import java.util.*;

public interface RgDAO_interface {
          public void insert(RgVO rngVO);
          public void update(RgVO rngVO);
          public void delete(Integer uid);
          public RgVO findByPrimaryKey(Integer uid);
          public List<RgVO> getAll();
}
