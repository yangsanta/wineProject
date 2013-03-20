package ads.model;

import java.util.List;

public interface AdsDAO_interface {
	public void insert(AdsVO adsVO);
    public void update(AdsVO adsVO);
    public void delete(Integer ads_no);
    public AdsVO findByPrimaryKey(Integer ads_no);
    public List<AdsVO> findByAds_filename(String ads_filename);
    public List<AdsVO> getAll();
    public List<AdsVO> findByP_no(Integer p_no);

}
