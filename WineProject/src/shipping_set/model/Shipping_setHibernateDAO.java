package shipping_set.model;

import hibernate.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class Shipping_setHibernateDAO implements Shipping_setDAO_interface {
	
	private static final String GET_ALL_STMT = "FROM Shipping_setVO order by min_pirce";

	@Override
	public void insert(Shipping_setVO shipping_setVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(shipping_setVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(Shipping_setVO shipping_setVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(shipping_setVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer min_pirce) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Shipping_setVO shipping_setVO = new Shipping_setVO();
			shipping_setVO.setMin_pirce(min_pirce);
			session.delete(shipping_setVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public Shipping_setVO findByPrimaryKey(Integer min_pirce) {
		Shipping_setVO shipping_setVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			shipping_setVO = (Shipping_setVO) session.get(Shipping_setVO.class, min_pirce);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return shipping_setVO;
	}

	@Override
	public List<Shipping_setVO> getAll() {
		List<Shipping_setVO> list = new ArrayList<Shipping_setVO>();
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
