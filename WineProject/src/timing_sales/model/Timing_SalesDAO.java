package timing_sales.model;

import hibernate.util.HibernateUtil;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import product.model.ProductDAO;
import product.model.ProductVO;

public class Timing_SalesDAO implements Timing_Sales_interface{
	private static final String GET_ALL_STMT = "from Timing_Sales order by ts_date desc";
	
	@Override
	public void insert(Timing_Sales timing_salesBean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(timing_salesBean);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(Timing_Sales timing_salesBean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(timing_salesBean);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer ts_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Timing_Sales timing_Sales = new Timing_Sales();
			timing_Sales.setTs_id(ts_id);
			session.delete(timing_Sales);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public Timing_Sales findByPrimaryKey(Integer ts_id) {
		Timing_Sales timing_Sales = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			timing_Sales = (Timing_Sales) session.get(Timing_Sales.class, ts_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return timing_Sales;
	}

	@Override
	public List<Timing_Sales> getAll() {
		List<Timing_Sales> list = null;
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
	
	public Timing_Sales getDailySales() {    //查詢當天之限時特惠廣告
		Timing_Sales timing_Sales = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Date date = new Date(); //現在時間
		SimpleDateFormat bartDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		String str = bartDateFormat.format(date); 
		str = "'" + str + "'";
		String queryString = "from Timing_Sales where ts_date = " + str + "order by ts_date desc";
		try {
		session.beginTransaction();
		Query query = session.createQuery(queryString);
		List<Timing_Sales> list = query.list();
		timing_Sales = list.get(0);                   //查詢當天廣告之第一筆
	
		session.getTransaction().commit();
		
		//更改前天之product優惠狀態回"NONE" (全改)
		ProductDAO productDAO = new ProductDAO();
		List<ProductVO> pList = productDAO.getProductSales("TIME");
		for(ProductVO p: pList){
			p.setP_sales("NONE");
			productDAO.update(p);
		}
		//同時更改當天product優惠狀態 "TIME"
		Integer p_no =  timing_Sales.getProductVO().getP_no();
		ProductVO productVO = productDAO.findByPrimaryKey(p_no);
		productVO.setP_sales("TIME");
		productDAO.update(productVO);
		
		} catch (RuntimeException ex) {
		session.getTransaction().rollback();
		throw ex;
		}
		return timing_Sales;
	}
	
	public List<Timing_Sales> search(String srchString) {
		List<Timing_Sales> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			String SEARCH_STMT = "FROM Timing_Sales WHERE ts_date ='" + srchString + "'";
			Query query = session.createQuery(SEARCH_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	public static void main(String arg[]) {
		Timing_SalesDAO dao = new Timing_SalesDAO();
		
		//insert()
//		Timing_Sales ts = new Timing_Sales();
//		ProductVO productVO = new ProductVO();
//		productVO.setP_no(4);
//		
//		ts.setTs_content("content");
//		ts.setTs_date(new Timestamp(new java.util.Date().getTime()));
//		ts.setTs_pic("c:/xxxxxxxxxxx");
//		ts.setTs_price(213123123);
//		ts.setTs_slogan("goodgood");
//		ts.setTs_totalsale(0);
//		ts.setProductVO(productVO);
//		
//		dao.insert(ts);
		
		//update()
//		Timing_Sales ts2 = new Timing_Sales();
//		ProductVO productVO2 = new ProductVO();
//		productVO2.setP_no(1);
//		
//		ts2.setTs_id(2);
//		ts2.setTs_content("content");
//		ts2.setTs_date(new Timestamp(new java.util.Date().getTime()));
//		ts2.setTs_pic("d:/xxxxxxxxxxx");
//		ts2.setTs_price(213123123);
//		ts2.setTs_slogan("goodgood");
//		ts2.setTs_totalsale(0);
//		ts2.setProductVO(productVO2);
//		
//		dao.update(ts2);
		
		//delete()
//		dao.delete(2);
		
		//findByPrimaryKey
//		Timing_Sales ts3 = dao.findByPrimaryKey(3);
//		System.out.print(ts3.getTs_content() + ",");
//		System.out.print(ts3.getTs_pic() + ",");
//		System.out.print(ts3.getTs_slogan() + ",");
//		System.out.print(ts3.getProductVO().getP_name() + ",");
//		System.out.print(ts3.getTs_date() + ",");
//		System.out.print(ts3.getTs_id() + ",");
//		System.out.print(ts3.getTs_price() + ",");
//		System.out.print(ts3.getTs_totalsale());
		
		//getAll()
//		List<Timing_Sales> list = new ArrayList<Timing_Sales>();
//		list = dao.getAll();
//		for(Timing_Sales ts:list){
//			System.out.print(ts.getTs_content() + ",");
//			System.out.print(ts.getTs_pic() + ",");
//			System.out.print(ts.getTs_slogan() + ",");
//			System.out.print(ts.getProductVO().getP_name() + ",");
//			System.out.print(ts.getTs_date() + ",");
//			System.out.print(ts.getTs_id() + ",");
//			System.out.print(ts.getTs_price() + ",");
//			System.out.print(ts.getTs_totalsale());
//		}
		
		//search()
		List<Timing_Sales> list = new ArrayList<Timing_Sales>();
		list = dao.search("2013-4-1");
		for(Timing_Sales ts:list){
			System.out.print(ts.getTs_content() + ",");
			System.out.print(ts.getTs_pic() + ",");
			System.out.print(ts.getTs_slogan() + ",");
			System.out.print(ts.getProductVO().getP_name() + ",");
			System.out.print(ts.getTs_date() + ",");
			System.out.print(ts.getTs_id() + ",");
			System.out.print(ts.getTs_price() + ",");
			System.out.print(ts.getTs_totalsale());
		}
	}
}
