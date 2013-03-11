package orders.model;

import hibernate.util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

public class OrdersDAO implements OrdersDAO_interface {

	private static final String GET_ALL_STMT = "FROM OrdersVO order by o_no";
	private static final String GET_SOME_STMT_M_no = "FROM OrdersVO where m_no=:m_no order by o_no";

	@Override
	public void insert(OrdersVO orderVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(orderVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(OrdersVO orderVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(orderVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer o_no) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			OrdersVO ordersVO = new OrdersVO();
			ordersVO.setO_no(o_no);
			session.delete(ordersVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public OrdersVO findByPrimaryKey(Integer o_no) {

		OrdersVO ordersVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ordersVO = (OrdersVO) session.get(OrdersVO.class, o_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return ordersVO;
	}
	
	@Override
	public List<OrdersVO> getOrdersByM_no(Integer m_no) {

		List<OrdersVO> list = new ArrayList<OrdersVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Criteria query = session.createCriteria(OrdersVO.class);
			query.addOrder(Order.asc("o_no"));
			query.add( Restrictions.eq("m_no", m_no) );
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
		
	}

	@Override
	public List<OrdersVO> getAll() {

		List<OrdersVO> list = new ArrayList<OrdersVO>();
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
