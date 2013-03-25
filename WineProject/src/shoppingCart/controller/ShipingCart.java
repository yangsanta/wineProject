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

		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if (cart.get(productNumber) ==null ) {
			if (shoppingProduct.getProductNumber() <= 0) {
				return;
			}else
			cart.put(productNumber, shoppingProduct);
			
		} else {
			// 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			ShoppingProduct OldShoppingProduct = cart.get(productNumber);
			// 加購的數量：shoppingProduct.getProductNumber()
			// 原有的數量：OldShoppingProduct.getProductNumber()

			// 如果新加入的商品為買A送B的B商品，若用戶原已選購B商品，且贈送的B商品數量>=原購買的B商品數量，則扣抵原購B商品的價格（而非直接增加B商品的數量）
			if (shoppingProduct.getSaleType().equals("B")  && (OldShoppingProduct.getSubTotal() != 0) && (shoppingProduct.getProductNumber() >= OldShoppingProduct.getProductNumber())){
				OldShoppingProduct.setProductNumber(shoppingProduct.getProductNumber());
				OldShoppingProduct.setSubTotal(shoppingProduct.getSubTotal());
			} else if (shoppingProduct.getSaleType().equals("B") && (OldShoppingProduct.getSubTotal() != 0) && (shoppingProduct.getProductNumber() < OldShoppingProduct.getProductNumber())) {
				OldShoppingProduct
				.setProductNumber(OldShoppingProduct.getProductNumber());
				OldShoppingProduct.setSubTotal(OldShoppingProduct.getSubTotal() - shoppingProduct.getProductPrice()*shoppingProduct.getProductNumber());
			// 此外則照原規則
			} else {
				OldShoppingProduct
						.setProductNumber(shoppingProduct.getProductNumber()
								+ OldShoppingProduct.getProductNumber());
				// 計算小計
				OldShoppingProduct.setSubTotal(shoppingProduct.getSubTotal()+OldShoppingProduct.getSubTotal());
			}
			
			// 如果新加入的商品B為買A送B的結果，SalesNumber往上加，以便確認訂單頁面判斷是否顯示已折扣
			if (shoppingProduct.getSaleType().equals("B")){
				OldShoppingProduct.setSalesNumber(shoppingProduct.getSalesNumber()+OldShoppingProduct.getSalesNumber());
			}

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
	public void deleteProduct(Integer productNo){
		cart.remove(productNo);
		}
	
	
	
}
