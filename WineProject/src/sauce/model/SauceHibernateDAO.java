package sauce.model;

import food.model.FoodVO;
import hibernate.util.HibernateUtil;

import java.util.*;

import org.hibernate.Query;
import org.hibernate.Session;

public class SauceHibernateDAO implements SauceDAO_interface {

	private static final String GET_ALL_STMT = "FROM SauceVO order by s_id";

	@Override
	public void insert(SauceVO sauceVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(sauceVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(SauceVO sauceVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(sauceVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer s_id) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			SauceVO sauceVO = new SauceVO();
			sauceVO.setS_id(s_id);
			session.delete(sauceVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public SauceVO findByPrimaryKey(Integer s_id) {

		SauceVO sauceVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			sauceVO = (SauceVO) session.get(SauceVO.class, s_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return sauceVO;
	}
	

	@Override
	public List<SauceVO> getAll() {

		List<SauceVO> list = new ArrayList<SauceVO>();
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
	
//	public static void main(String[] args) {
//
//		SauceHibernateDAO dao = new SauceHibernateDAO();

		// 新增
//		SauceVO sauceVO1 = new SauceVO();
//		sauceVO1.setS_name("番茄醬1");
//
//		dao.insert(sauceVO1);

//		// 修改
//		SauceVO sauceVO2 = new SauceVO();
//		sauceVO2.setS_id(new Integer(3047));
//		sauceVO2.setS_name("king番茄醬1");
//
//		dao.update(sauceVO2);
//
//		// 刪除
//		dao.delete(3047);
//
////		// 查詢
//		SauceVO sauceVO3 = dao.findByPrimaryKey(102);
//		System.out.print(sauceVO3.getS_id() + ",");
//		System.out.print(sauceVO3.getS_name());
//		System.out.println("---------------------");

//		// 查詢
//		List<SauceVO> list = dao.getAll();
//		for (SauceVO asauce : list) {
//			System.out.print(asauce.getS_id() + ",");
//			System.out.print(asauce.getS_name() + ",");
//
//			
//			System.out.println("-1---------------1-");
//		}
//	}

	
}
