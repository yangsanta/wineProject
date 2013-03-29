package coupon_set.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coupon_set.model.Coupon_setDAO;
import coupon_set.model.Coupon_setVO;

public class Coupon_setFacade {
	HttpServletRequest request = null;
	HttpServletResponse response = null;

	public Coupon_setFacade() {
		System.out.println("OrdersFacade Constructor without Parameter!");
	}

	public Coupon_setFacade(HttpServletRequest request,	HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public List<Coupon_setVO> getAll() {
		Coupon_setDAO cdao = new Coupon_setDAO();
		List<Coupon_setVO> clist = cdao.getAll();
		
		return clist;
	}

	public void addCouponSet() {
		// TODO Auto-generated method stub
		
	}

	public void deleteCouponSet() {
		// TODO Auto-generated method stub
		
	}

	

}
