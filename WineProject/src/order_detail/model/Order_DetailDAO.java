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

	public static void main(String[] args) {

		Order_DetailDAO dao = new Order_DetailDAO();

		//● 新增 														OK!!!!!!!!!!!!

//		Order_DetailVO order_DetailVO1 = new Order_DetailVO();
//		order_DetailVO1.setO_no(123);
//		order_DetailVO1.setP_no(5555555);
//		order_DetailVO1.setP_num(1);
//		order_DetailVO1.setOd_sales(true);
//		order_DetailVO1.setOd_price(999);
//		dao.insert(order_DetailVO1);



		//● 修改  OK!!!!
//		Order_DetailVO order_DetailVO2 = new Order_DetailVO();
//		order_DetailVO2.setO_no(0001);
//		order_DetailVO2.setP_no(2222);
//		order_DetailVO2.setP_num(999);
//		order_DetailVO2.setOd_sales(true);
//		order_DetailVO2.setOd_price(10000);
//		dao.update(order_DetailVO2);


		//● 刪除               									OK!!!!!
//		dao.delete(1,1111);



		//● 查詢-findByPrimaryKey                              OK!!!!!!!!
//		List<Order_DetailVO> list = dao.findByPrimaryKey(1,2222);
//		for (Order_DetailVO order_DetailVO3 : list) {
//			System.out.print(order_DetailVO3.getO_no() + ",");
//			System.out.print(order_DetailVO3.getP_no() + ",");
//			System.out.print(order_DetailVO3.getP_num() + ",");
//			System.out.print(order_DetailVO3.getOd_sales() + ",");
//			System.out.print(order_DetailVO3.getOd_price() + ",");
//			System.out.println();
//		}
		
		//● 查詢-findByO_no                              OK!!!!!!!!
//		List<Order_DetailVO> list = dao.findByO_no(123);
//		for (Order_DetailVO order_DetailVO3 : list) {
//			System.out.print(order_DetailVO3.getO_no() + ",");
//			System.out.print(order_DetailVO3.getP_no() + ",");
//			System.out.print(order_DetailVO3.getP_num() + ",");
//			System.out.print(order_DetailVO3.getOd_sales() + ",");
//			System.out.print(order_DetailVO3.getOd_price() + ",");
//			System.out.println();
//		}	
		

		//● 查詢-getAll 										OK!!!!!!!!!!!!
		List<Order_DetailVO> list = dao.getAll();
		for (Order_DetailVO order_DetailVO1 : list) {
			System.out.print(order_DetailVO1.getO_no() + ",");
			System.out.print(order_DetailVO1.getP_no() + ",");
			System.out.print(order_DetailVO1.getP_num() + ",");
			System.out.print(order_DetailVO1.getOd_sales() + ",");
			System.out.print(order_DetailVO1.getOd_price() + ",");
			System.out.println();
		}
	}
}
