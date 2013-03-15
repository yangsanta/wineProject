package shoppingCart.controller;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import shoppingCart.model.ShoppingProduct;

public class ShipingCart {
	public ShipingCart() {
	}

	private Map<Integer, ShoppingProduct> cart = new LinkedHashMap<Integer, ShoppingProduct>();

	public Map<Integer, ShoppingProduct> getContent() {
		return cart;
	}

	public void addToCart(Integer productNumber, ShoppingProduct shoppingProduct) {
		if (shoppingProduct.getProductNumber() <= 0) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if (cart.get(productNumber) ==null ) {
			cart.put(productNumber, shoppingProduct);
			
		} else {
			// 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			ShoppingProduct OldShoppingProduct = cart.get(productNumber);
			// 加購的數量：shoppingProduct.getProductNumber()
			// 原有的數量：OldShoppingProduct.getProductNumber()
			OldShoppingProduct
					.setProductNumber(shoppingProduct.getProductNumber()
							+ OldShoppingProduct.getProductNumber());
			
						// 計算小計
			OldShoppingProduct.setSubTotal(shoppingProduct.getSubTotal()+OldShoppingProduct.getSubTotal());
	

		}
	}
	//計算總商品總價
	public Integer getTotal() {
		Integer total = 0;
		Set<Integer> set = cart.keySet();
		for (Integer n : set) {
			Integer price =  (Integer)cart.get(n).getSubTotal();
			total += price;
		}
		return total;
	}
	//計算總商品數量
	public Integer getBottleNumber() {
		Integer bottleNumber = 0;
		Set<Integer> set = cart.keySet();
		for (Integer n : set) {
			Integer number =  (Integer)cart.get(n).getProductNumber();
			bottleNumber += number;
		}
		return bottleNumber;
	}

	
	
	
}
