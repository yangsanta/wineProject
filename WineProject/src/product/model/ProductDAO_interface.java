package product.model;

import java.util.*;

public interface ProductDAO_interface {
	public void insert(ProductVO productVO);

	public void update(ProductVO productVO);

	public void delete(Integer p_no);

	public ProductVO findByPrimaryKey(Integer p_no);

	public List<ProductVO> getAll();

	public List findProductType(String productlist);

	public List<String> findGrapeType(String productType);
}
