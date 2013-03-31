package coupon_set.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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
	
	public String createJson(List<Coupon_setVO> clist) {
		JSONObject jsonO = null;
		JSONArray jsonA = new JSONArray();
		
		for (Coupon_setVO cs: clist){
			try {
				jsonO = new JSONObject();
				jsonO.put("cs_limit_price", cs.getCs_limit_price());
				jsonO.put("cs_price", cs.getCs_price());
				jsonA.put(jsonO);
			} catch (JSONException e) {
				e.printStackTrace();
			}//try-catch
		}//forEach
		
		return jsonA.toString();
	}

	public void addCouponSet(Integer new_cs_limit_price, Integer new_cs_price) {
		Coupon_setDAO cdao = new Coupon_setDAO();
		Coupon_setVO coupon_setVO = cdao.findByPrimaryKey(new_cs_limit_price);		
		
		if (coupon_setVO != null){
			coupon_setVO.setCs_price(new_cs_price);
			cdao.update(coupon_setVO);
		} else {
			coupon_setVO = new Coupon_setVO();
			coupon_setVO.setCs_limit_price(new_cs_limit_price);
			coupon_setVO.setCs_price(new_cs_price);
			cdao.insert(coupon_setVO);
		}
	}

	public void deleteCouponSet(Integer cs_limit_price) {
		new Coupon_setDAO().delete(cs_limit_price);
		
	}

	

}
