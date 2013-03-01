package coupon.model;

import java.util.*;

public interface CouponDAO_interface {
	public void insert(CouponVO couponVO);
    public void update(CouponVO couponVO);
    public void delete(String c_key);
    public CouponVO findByPrimaryKey(String c_key);
    public List<CouponVO> getAll();
//    public List<CouponVO> getCouponByStatus(Integer c_status);
}
