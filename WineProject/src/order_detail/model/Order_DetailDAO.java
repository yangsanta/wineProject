package order_detail.model;

import hibernate.util.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import coupon.model.CouponHibernateDAO;


public class Order_DetailDAO implements Order_DetailDAO_interface {

	private static final String GET_ALL_STMT = "from Order_DetailVO order by o_no";
	private static final String GET_OD_STMT = "from Order_DetailVO where o_no=? and p_no=? order by o_no";
	private static final String GET_ODbyO_no_STMT = "from Order_DetailVO where o_no=? order by o_no";
	private static final String DEL_OD_STMT = "delete Order_DetailVO where o_no=? and p_no=? order by o_no";
	@Override
	public void insert(Order_DetailVO order_DetailVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(order_DetailVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(Order_DetailVO order_DetailVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(order_DetailVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer o_no, Integer p_no) {
		List<Order_DetailVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(DEL_OD_STMT);
			query.setParameter(0, o_no);
			query.setParameter(1, p_no);
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public List<Order_DetailVO> findByPrimaryKey(Integer o_no, Integer p_no) {
		List<Order_DetailVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_OD_STMT);
			query.setParameter(0, o_no);
			query.setParameter(1, p_no);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<Order_DetailVO> findByO_no(Integer o_no) {
		List<Order_DetailVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ODbyO_no_STMT);
			query.setParameter(0, o_no);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	@Override
	public List<Order_DetailVO> getAll() {
		List<Order_DetailVO> list = null;
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
