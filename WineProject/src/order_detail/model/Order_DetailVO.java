package order_detail.model;

import java.io.Serializable;

import product.model.ProductVO;



public class Order_DetailVO implements Serializable{

//	private OrdersVO ordersVO;
	private Integer o_no;
//	private Integer p_no;
	private ProductVO productVO;
	private Integer p_num;
	private Boolean od_sales;
	private Integer od_price;
	
	public Integer getO_no() {
		return o_no;
	}
	public void setO_no(Integer o_no) {
		this.o_no = o_no;
	}
//	public Integer getP_no() {
//		return p_no;
//	}
//	public void setP_no(Integer p_no) {
//		this.p_no = p_no;
//	}
	public Integer getP_num() {
		return p_num;
	}
	public void setP_num(Integer p_num) {
		this.p_num = p_num;
	}
	public Boolean getOd_sales() {
		return od_sales;
	}
	public void setOd_sales(Boolean od_sales) {
		this.od_sales = od_sales;
	}
	public Integer getOd_price() {
		return od_price;
	}
	public void setOd_price(Integer od_price) {
		this.od_price = od_price;
	}
//	public OrdersVO getOrdersVO() {
//		return ordersVO;
//	}
//	public void setOrdersVO(OrdersVO ordersVO) {
//		this.ordersVO = ordersVO;
//	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	
	
}
