package orders.model;

import java.util.*;

public interface OrdersDAO_interface {
	
	public void insert(OrdersVO orderVO);
	public void update(OrdersVO orderVO);
    public void delete(Integer o_no);
    public OrdersVO findByPrimaryKey(Integer o_no);
    public List<OrdersVO> getAll();

}
