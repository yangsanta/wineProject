package coupon_set.model;

import hibernate.util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class Coupon_setHibernateDAO implements Coupon_setDAO_interface {
	
	private static final String GET_ALL_STMT = "FROM Coupon_setDAO order by cs_limit_price";

	@Override
	public void insert(Coupon_setVO coupon_setVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(coupon_setVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(Coupon_setVO coupon_setVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(coupon_setVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer cs_limit_price) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Coupon_setVO coupon_setVO = new Coupon_setVO();
			coupon_setVO.setCs_limit_price(cs_limit_price);
			session.delete(coupon_setVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public Coupon_setVO findByPrimaryKey(Integer cs_limit_price) {
		Coupon_setVO coupon_setVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			coupon_setVO = (Coupon_setVO) session.get(Coupon_setVO.class, cs_limit_price);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return coupon_setVO;
	}

	@Override
	public List<Coupon_setVO> getAll() {
		List<Coupon_setVO> list = new ArrayList<Coupon_setVO>();
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

}
