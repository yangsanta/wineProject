package product.model;

import hibernate.util.HibernateUtil;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public class ProductHibernateDAO implements ProductDAO_interface {
	private static final String GET_ALL_STMT = "from ProductVO order by p_no";

	@Override
	public void insert(ProductVO productVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(productVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(ProductVO productVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(productVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer p_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ProductVO productV = new ProductVO();
			productV.setP_no(p_no);
			session.delete(productV);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public ProductVO findByPrimaryKey(Integer p_no) {
		ProductVO ProductVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ProductVO = (ProductVO) session.get(ProductVO.class, p_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return ProductVO;
	}

	@Override
	public List<ProductVO> getAll() {
		List<ProductVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<String> findProductType(String productlist) {
		List list = new ArrayList();
		List list1 = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			Query query = session.createQuery("SELECT DISTINCT " + productlist
					+ "  FROM ProductVO");
			list1 = query.list();

			for (int i = 0; i < list1.size(); i++) {
				String aaa = list1.get(i).toString();

				list.add(aaa);
			}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	public List<String> findGrapeType(String productType) {
		List list = null;

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		try {
			session.beginTransaction();
			
			Query query = session.createQuery("SELECT DISTINCT p_grape FROM ProductVO where p_type=?");
			query.setParameter(0, productType);
			list = query.list();

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	// -------------------------------------------------------
	public static void main(String arg[]) {
		ProductHibernateDAO dao = new ProductHibernateDAO();
//		 List<String> listStyle = dao.findGrapeType("¬õ¸²µå°s");
//		 for (String aEmp : listStyle) {
//		
//		 System.out.println(aEmp);
//		 }
		// ·s¼W
//		 ProductVO productVOO1 = new ProductVO();
//		 productVOO1.setP_name("¸ô©ö©Ô¹Ï®L¥¬§Q¤@¯Å¸²µå¶é¥Õ¸²µå°s");
//		 productVOO1.setP_year(2008);
//		 productVOO1.setP_rate(90);
//		 productVOO1.setP_area("ªk°ê¥¬®Ú¦a®L¥¬§Q");
//		 productVOO1
//		 .setP_intro("¸ô©ö©Ô¹Ï®L¥¬§Q¤@¯Å¸²µå¶é¥Õ¸²µå°s¬O¥Ñ®L¥¬§Q¤@¯Å¸²µå¶é¤ººë¿ï¥X³Ì¦nªº®L¦h¤º¸²µå¡A©ÒÆC³y¥X¤f¨ý¯S§O²Ó½o²M¶®ªº¥Õ°s¡C¸ô©ö©Ô¹Ï°s¼t¸g¥Ñ­°§C¸²µåªº¥Í²£¶q©M¤£Â_¶i¨BªººØ´Ó»PÆC³y§Þ³N¨Ó½T«O¨C¦~¸²µå«~½èªºÃ­©w¡C¸ô©ö©Ô¹Ï®L¥¬§Q¤@¯Å¸²µå¶é¥Õ¸²µå°s¦b¤£ÄÃ¿û¼Ñ¤¤µo»Ã¡A¥H«O¯d·sÂAªG¨ý¡C¦¹¥~¡A¦Ê¤À¤§¦Êªº¨Å»Äµo»Ã¹Lµ{¡AÅý°s½è§ó¥[Ã­©w¡A¤f·P§ó¥[¶ê¼í¡C®a±Ú¥N¥N¶Ç©Ó¸gÀçªº¸ô©ö©Ô¹Ï°s¼t (Maison Louis Latour)¡A¬Oªk°ê¥¬®Ú¦a§B®¦²£°Ï¤­¤jµÛ¦W°s°Ó¤§¤@¡A¦Û1797¦~³Ð¥ß¥H¨Ó¡A¤@ª½°í¦u¶Ç²Î©M«~½è¡A¦ý¤]«i©ó­²·s©M³Ð³y¡A¥H¨äÀu¨}ªº¥¬®Ú¦a¬õ¡B¥Õ°s«~½è»D¦W¥@¬É¡A¦P®É¤]¬O¥Í²£¥¬®Ú¦a²£°Ï¥H¥~¦pArd áche(ªü¼wºk)ªºÀu½è¸²µå°sªº¥ýÅX¡C©Ô¹Ï®a±Ú¦Û17¥@¬ö¥H¨Ó«K¶}©l¾Ö¦³»P¼W¥[¦Û¦³¸²µå¶é¡A¦p¤µ¦b¥¬®Ú¦a¤w¦³50¤½³¼ªº¸²µå¶é¡A½d³ò¡C±q¥_³¡ªº­»¨©¤¦(Chambertin)©µ¦ù¨ì«nÃäªº·²¥Ë¨½­C- »X«¢ºk(Chevalier-Montrachet)¡A¨ä¤¤¦³30¤½³¼ªº¯S¯Å¸²µå¶é¡A¥]¬A0.8¤½³¼ªº­»¨©¤¦¡B1¤½³¼ªº«J°¨¤º-¸tºû¶¾(Romanee Saint Vivant)¡B17¤½³¼ªº°ªµn(Corton) ¥H¤Îªñ9¤½³¼ªº°ªµn¬d²z°Ò(Corton-Charlemagne)¡A¨Ã¬O¦bª÷¥C(Cote d'Or) ¾Ö¦³³Ì¤j¤ñ¨Òªº¯S¯Å¸²µå¶éªº°s°Ó¡C¸ô©ö©Ô¹Ï©Ò¦³ªº¦Û¦³¸²µå¶é¸Ì©Ò¥Í²£ªº¸²µå¡A¬Ò¦bªüÃ¹´µ-°ªµn (Aloxe-Corton)ªº°ªµn®æÄõºk³ù(Ch ðteau Corton Grancey)¸Ìªº°sµ¢ÆC»s»P³¯¦~¡C³o¬Oªk°ê²Ä¤@­Ó¨Ì¥\¯à©Ê«Ø³yªº°sµ¢¡A¤´ºû«ù¶Ç²Îªº¹B§@¤è¦¡¡A¬°©T¦u¶Ç²Î¡A¦Ü¤µ¸ô©ö©Ô¹Ï©Ò¦³¦Û¦³¸²µå¶éªº°s¥þ³¡¨Ï¥Î¤H¤u½ò¥Ö¡A¥t¤@¯S¦â¬O¬õ°s¸û¤Ö¨Ï¥Î·s¾ó¤ì±í³¯¦~¡A¦Ó·s¾ó¤ì±í«h¥Î©ó¥Õ°s¡A£¸¨â¦~«á¦A¨Ï¥Î©ó¬õ°s¡A»P¬Y¨Ç¥¬®Ú¦a°s¼t¤è¦¡¬Û¤Ï¡CºØºØ°í«ù¡A¨Ï¸ô©ö©Ô¹Ï¥Õ°s´I¦³¿@­§ªºªG¨ý»P­»¯ó¡BºdªGµ¥­»®ð¡A¬õ°s«h¤f·P¶ê¼íÂ×´I¡C¸ô©ö©Ô¹Ï°s¼t¦³³\¦h¨ä¥L»P²³¤£¦P¤§³B¡A¨Ò¦p¾Ö¦³¦Û¤vªº¾ó¤ì±í°s¼t¡B¦L¨ê¼t¡B²î¹B¤½¥q¡A³s²~«¬¤]¦³±M¥Î§Îª¬¡A°í«ù¦Û¤vªº­·®æ¡C¸ô©ö©Ô¹Ï¦Û²Ä¤T¥N´xªù¤H°_¡A«K¬O³\¦h¤ý¤½¶Q±Úªº³Ì·R¡A¡A¦b¥@¬É¦U¤j°ª¯Å¶º©±»PÀ\ÆU¡A¦p¤Ú¾¤»X¦a¥dÃ¹(Monte Carlo's)¶º©±¡B¤é¤º¥ËLe Beau-Rivage¡B¤Ú¾¤ÄR¦À¶º©±(The Paris Ritz)ªº°s³æ¤W³£¬Ý±o¨ì¸ô©ö©Ô¹Ï¡A§óºa¿ï¬°2008¦~G8°ª®p·|«ü©w¥Î¤[¡A¬O±z¤£®e¿ù¹Lªº¥¬®Ú¦a¦W¼t¡C");
//		 productVOO1.setP_num(85);
//		 productVOO1.setP_price(1650.0);
//		 productVOO1.setP_status("¤W¬[¤¤");
//		 productVOO1.setP_winery("Chardonnay");
//		 productVOO1.setP_click_count(80);
//		 productVOO1.setP_buy_count(90);
//		 productVOO1.setP_style("¤g¨ý");
//		 productVOO1.setP_sales("RG");
//		 productVOO1.setP_vol(750);
//		 productVOO1.setP_alcho(13.0);
//		 productVOO1.setP_date(new Timestamp(new java.util.Date().getTime()));
//		 productVOO1.setP_type("¥Õ¸²µå°s");
//		 productVOO1.setP_grape("Pinot Noir");
//		 dao.insert(productVOO1);
		// -------------------------------------------------
		// ­×§ï
		// ProductVO productVOO2 = new ProductVO();
		// productVOO2.setP_no(1);
		// productVOO2.setP_name("³Ç¥d´µ¿²ÂÃ¤Ú¬¥¨F®u«¢¬õ°s");
		// productVOO2.setP_year(2008);
		// productVOO2.setP_rate(80);
		// productVOO2.setP_area("¿D¬w");
		// productVOO2
		// .setP_intro("±o2005 Taster Guide International Wine Judgingµ¥¥D­n°ê»ÚÄvÁÉªÖ©w,¦b1847¦~¡A¤@¦ì¦~»´ªº¤Ú¥ï§Q¨È²¾¥Á¬ù¿«.¸¯Äõ¡]Johann Gramp¡^¨Ó¨ì¤F«n¿Dªº¤Ú¬¥¨Fªe¨¦¡A¦b¤@±ø¦W¬°³Ç¥d´µ·Ë¯`ºØ¤U¤F¥Lªº²Ä¤@´Ê¸²µå¾ð¡C¸g¹L129¦~ªºÃ­©wµo®i¡A1976¦~¥¿¦¡¥H¡y³Ç¥d´µ¡z¬°«~µP¦WºÙ¦b¥þ²y¤W¥«¡A®É¦Ü¤µ¤é¡A¨C¦~¶W¹L8¦Ê¸U½cªº¥X¤f¶q¡AÅý³Ç¥d´µ¦¨¬°¿D¬w³Ì¨üÅwªïªº¸²µå°s¼t¡C¨C¤Ñ¡Aªñ2¦Ê¸UªMªº³Ç¥d´µ¸²µå°s¦b¥@¬É¦U¦aªº¤H­Ì¤â¤¤³Q¨É¥Î¡A½èÀu©ö¶¼ªº³Ç¥d´µ­·®æ²`´Ó¤H¤ß¡C¥Î©ó¿²ÂÃ¨t¦Cªº¸²µå¡A±Ä¦Ûºë¿ï¸²µå¶éªºªG¹ê¡AÆC°s®vºë¿ï¨Ó¦ÛPadthaway, Langhorne Creek, Coonawarra¥H¤Î§J¨Ó¨à¨¦¦aµ¥¦a°Ï¡AªG¹ê¥R¤À¼ô¦¨´I¦³¿@­§«~ºØ­·¨ý»P²Ó½o³æ¹çªº¸²µå¡A§@¬°ÆC³y¿²ÂÃ¨t¦Cªº¨Ó·½¡C­»®ð¶°¤¤¡B¿@ÁY­·¨ý¡A¦b¾ó¤ì±í¤º¼ô¦¨18-22­Ó¤ë¡]®u«¢¬õ°s¡^¡C");
		// productVOO2.setP_num(50);
		// productVOO2.setP_price(800.0);
		// productVOO2.setP_status("¤U¬[¤¤");
		// productVOO2.setP_winery("Jacob¡¦s Creek");
		// productVOO2.setP_click_count(100);
		// productVOO2.setP_buy_count(150);
		// productVOO2.setP_style("¨¯»¶¨ý");
		// productVOO2.setP_sales("B");
		// productVOO2.setP_vol(750);
		// productVOO2.setP_alcho(14.5);
		// productVOO2.setP_date(new Timestamp(new java.util.Date().getTime()));
		// productVOO2.setP_type("red wine");
		// productVOO2.setP_grape("Syrah \\ Shiraz");
		// dao.update(productVOO2);
		// ---------------------------------------------
		// §R°£
		// dao.delete(5);
		// ------------------------------------------------
		// ¬d¸ß

		// ProductVO productVOO3 = dao.findByPrimaryKey(2);
		// System.out.println(productVOO3.getP_no() + ",");
		// System.out.println(productVOO3.getP_name() + ",");
		// System.out.println(productVOO3.getP_year() + ",");
		// System.out.println(productVOO3.getP_rate() + ",");
		// System.out.println(productVOO3.getP_area() + ",");
		// System.out.println(productVOO3.getP_intro() + ",");
		// System.out.println(productVOO3.getP_num() + ",");
		// System.out.println(productVOO3.getP_price() + ",");
		// System.out.println(productVOO3.getP_status() + ",");
		// System.out.println(productVOO3.getP_winery() + ",");
		// System.out.println(productVOO3.getP_click_count() + ",");
		// System.out.println(productVOO3.getP_buy_count() + ",");
		// System.out.println(productVOO3.getP_style() + ",");
		// System.out.println(productVOO3.getP_sales() + ",");
		// System.out.println(productVOO3.getP_vol() + ",");
		// System.out.println(productVOO3.getP_alcho() + ",");
		// System.out.println(productVOO3.getP_date() + ",");
		// System.out.println(productVOO3.getP_type() + ",");
		// System.out.println(productVOO3.getP_grape() );
		// System.out.println();
		// ¬d¸ß
		List<ProductVO> list = dao.getAll();
		for (ProductVO aEmp : list) {
			System.out.println(aEmp.getP_no() + ",");
			System.out.println(aEmp.getP_name() + ",");
			System.out.println(aEmp.getP_pic() + ",");
			System.out.println(aEmp.getP_year() + ",");
			System.out.println(aEmp.getP_rate() + ",");
			System.out.println(aEmp.getP_area() + ",");
			System.out.println(aEmp.getP_intro() + ",");
			System.out.println(aEmp.getP_num() + ",");
			System.out.println(aEmp.getP_price() + ",");
			System.out.println(aEmp.getP_status() + ",");
			System.out.println(aEmp.getP_winery() + ",");
			System.out.println(aEmp.getP_click_count() + ",");
			System.out.println(aEmp.getP_buy_count() + ",");
			System.out.println(aEmp.getP_style() + ",");
			System.out.println(aEmp.getP_sales() + ",");
			System.out.println(aEmp.getP_vol() + ",");
			System.out.println(aEmp.getP_alcho() + ",");
			System.out.println(aEmp.getP_date() + ",");
			System.out.println(aEmp.getP_type() + ",");
			System.out.println(aEmp.getP_grape());
			System.out.println();
		}
	}

}
