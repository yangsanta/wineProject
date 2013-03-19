package product.model;

import java.sql.Timestamp;

public class ProductVO implements java.io.Serializable {
	private Integer p_no;
	private String p_name;
	private String p_pic;
	private Integer p_year;
	private Integer p_rate;
	private String p_area;
	private String p_intro;
	private Integer p_num;
	private Integer p_price;
	private String p_status;
	private String p_winery;
	private Integer p_click_count;
	private Integer p_buy_count;
	private String p_style;
	private String p_sales;
	private Integer p_vol;
	private Double p_alcho;
	private Timestamp p_date;
	private String p_type;
	private String p_grape;

	private String p_country;
	
	public ProductVO(){}
	
	public ProductVO(int parseInt) {
		
	}

	public String getP_country() {
		return p_country;
	}

	public void setP_country(String p_country) {
		this.p_country = p_country;
	}

	public String getP_pic() {
		return p_pic;
	}

	

	public void setP_pic(String p_pic) {
		this.p_pic = p_pic;
	}

	public Timestamp getP_date() {
		return p_date;
	}

	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}

	public String getP_type() {
		return p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

	public String getP_grape() {
		return p_grape;
	}

	public void setP_grape(String p_grape) {
		this.p_grape = p_grape;
	}

	public Integer getP_no() {
		return p_no;
	}

	public void setP_no(Integer p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public Integer getP_year() {
		return p_year;
	}

	public void setP_year(Integer p_year) {
		this.p_year = p_year;
	}

	public Integer getP_rate() {
		return p_rate;
	}

	public void setP_rate(Integer p_rate) {
		this.p_rate = p_rate;
	}

	public String getP_area() {
		return p_area;
	}

	public void setP_area(String p_area) {
		this.p_area = p_area;
	}

	public String getP_intro() {
		return p_intro;
	}

	public void setP_intro(String p_intro) {
		this.p_intro = p_intro;
	}

	public Integer getP_num() {
		return p_num;
	}

	public void setP_num(Integer p_num) {
		this.p_num = p_num;
	}

	public Integer getP_price() {
		return p_price;
	}

	public void setP_price(Integer p_price) {
		this.p_price = p_price;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	public String getP_winery() {
		return p_winery;
	}

	public void setP_winery(String p_winery) {
		this.p_winery = p_winery;
	}

	public Integer getP_click_count() {
		return p_click_count;
	}

	public void setP_click_count(Integer p_click_count) {
		this.p_click_count = p_click_count;
	}

	public Integer getP_buy_count() {
		return p_buy_count;
	}

	public void setP_buy_count(Integer p_buy_count) {
		this.p_buy_count = p_buy_count;
	}

	public String getP_style() {
		return p_style;
	}

	public void setP_style(String p_style) {
		this.p_style = p_style;
	}

	public String getP_sales() {
		return p_sales;
	}

	public void setP_sales(String p_sales) {
		this.p_sales = p_sales;
	}

	public Integer getP_vol() {
		return p_vol;
	}

	public void setP_vol(Integer p_vol) {
		this.p_vol = p_vol;
	}

	public Double getP_alcho() {
		return p_alcho;
	}

	public void setP_alcho(Double p_alcho) {
		this.p_alcho = p_alcho;
	}

}
