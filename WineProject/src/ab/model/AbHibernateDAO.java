package ab.model;

import hibernate.util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class AbHibernateDAO implements AbDAO_interface {
	
	private static final String GET_ALL_STMT = "FROM AbVO order by Uniid";

	@Override
	public void insert(AbVO abVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(abVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(AbVO abVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(abVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer Uniid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			AbVO abVO = new AbVO();
			abVO.setUniid(Uniid);
			session.delete(abVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public AbVO findByPrimaryKey(Integer Uniid) {
		AbVO abVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			abVO = (AbVO) session.get(AbVO.class, Uniid);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return abVO;
	}

	@Override
	public List<AbVO> getAll() {
		List<AbVO> list = new ArrayList<AbVO>();
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
	public AbVO findByAKey(Integer ab_a_p_id) {
		List<AbVO> list = new ArrayList<AbVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Criteria query = session.createCriteria(AbVO.class);
			query.addOrder(Order.desc("Uniid"));
			query.add( Restrictions.eq("ab_a_p_id", ab_a_p_id) );
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list.get(0);
	}
	
	@Override
	public AbVO findByBKey(Integer ab_b_p_id) {
		List<AbVO> list = new ArrayList<AbVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Criteria query = session.createCriteria(AbVO.class);
			query.addOrder(Order.desc("Uniid"));
			query.add( Restrictions.eq("ab_b_p_id", ab_b_p_id) );
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list.get(0);
	}

	@Override
	public void deleteByA(Integer ab_a_p_id) {
		List<AbVO> list = new ArrayList<AbVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Criteria query = session.createCriteria(AbVO.class);
			query.addOrder(Order.desc("Uniid"));
			query.add( Restrictions.eq("ab_a_p_id", ab_a_p_id) );
			list = query.list();
			delete(list.get(0).getUniid());
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void deleteByB(Integer ab_b_p_id) {
		List<AbVO> list = new ArrayList<AbVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Criteria query = session.createCriteria(AbVO.class);
			query.addOrder(Order.desc("Uniid"));
			query.add( Restrictions.eq("ab_b_p_id", ab_b_p_id) );
			list = query.list();
			delete(list.get(0).getUniid());
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

}
