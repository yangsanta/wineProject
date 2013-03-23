package timing_sales.model;

import hibernate.util.HibernateUtil;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import product.model.ProductVO;

public class Timing_SalesDAO implements Timing_Sales_interface{
	private static final String GET_ALL_STMT = "from Timing_Sales order by ts_id";
	
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
	}
}
