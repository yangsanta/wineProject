package order_detail.model;

import java.util.List;



public interface Order_DetailDAO_interface {
	public void insert(Order_DetailVO order_DetailVO);
    public void update(Order_DetailVO order_DetailVO);
    public void delete(Integer o_no, Integer p_no);
    public List<Order_DetailVO> findByPrimaryKey(Integer o_no, Integer p_no);
    public List<Order_DetailVO> findByO_no(Integer o_no);
    public List<Order_DetailVO> getAll();
}
