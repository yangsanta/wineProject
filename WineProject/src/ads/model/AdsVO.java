package ads.model;

import product.model.ProductVO;

public class AdsVO {
	private Integer ads_no;
	private ProductVO productVO;
	private String ads_filename;
	
	public Integer getAds_no() {
		return ads_no;
	}
	public void setAds_no(Integer ads_no) {
		this.ads_no = ads_no;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public String getAds_filename() {
		return ads_filename;
	}
	public void setAds_filename(String ads_filename) {
		this.ads_filename = ads_filename;
	}

}
