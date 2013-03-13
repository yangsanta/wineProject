package shoppingCart.controller;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import shoppingCart.model.ShoppingProduct;

public class ShipingCart {
	public ShipingCart() {
	}
private int aNumber=0;
private int bNumber=0;
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
			OldShoppingProduct.setSubTatle(shoppingProduct.getSubTatle()+OldShoppingProduct.getSubTatle());
	
			// cart.put(bookID, oib);
		}
	}

	
	public void calculate(){}
	public Integer getTotal() {
		Integer total = 0;
		Set<Integer> set = cart.keySet();
		for (Integer n : set) {
			Integer price =  (Integer)cart.get(n).getSubTatle();
			total += price;
		}
		return total;
	}

	public int getaNumber() {
		return aNumber;
	}

	public void setaNumber(int aNumber) {
		this.aNumber = aNumber;
	}

	public int getbNumber() {
		return bNumber;
	}

	public void setbNumber(int bNumber) {
		this.bNumber = bNumber;
	}
	
	
	
}
