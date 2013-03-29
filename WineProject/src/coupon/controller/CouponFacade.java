package coupon.controller;

import java.util.UUID;

public class CouponFacade {

	public CouponFacade() {
		// TODO Auto-generated constructor stub
	}

	public static String createCoupon(){
		String c_key = UUID.randomUUID().toString();
		String[] c_keys = c_key.split("-"); 
		return c_keys[c_keys.length-1];
	}
	
	public static String createPwd(){
		String c_key = UUID.randomUUID().toString();
		String[] c_keys = c_key.split("-"); 
		return c_keys[0];
	}
	
//	public static void main(String[] args) {
//		System.out.println(createCoupon());
//
//	}

}
