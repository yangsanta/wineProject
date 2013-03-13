package shoppingCart.model;

public class ShoppingProduct {
	private Integer productNo;
	private String productName;
	private Integer productPrice=0;
	private Integer productNumber=0;
	private Integer subTatle=0;
	private String saleType;
	private Integer salesNumber=0;
	public Integer getSubTatle() {
		return subTatle;
	}
	public void setSubTatle(Integer subTatle) {
		this.subTatle = subTatle;
	}
	public Integer getProductNo() {
		return productNo;
	}
	public void setProductNo(Integer productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Integer productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(Integer productNumber) {
		this.productNumber = productNumber;
	}
	public String getSaleType() {
		return saleType;
	}
	public void setSaleType(String saleType) {
		this.saleType = saleType;
	}
	public Integer getSalesNumber() {
		return salesNumber;
	}
	public void setSalesNumber(Integer salesNumber) {
		this.salesNumber = salesNumber;
	}

	
}
