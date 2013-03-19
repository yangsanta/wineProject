package admin_board.model;

import hibernate.util.HibernateUtil;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

public class Admin_boardHibernateDAO  {
	private static final String GET_ALL_STMT = "from Admin_boardVO order by i_no";


	public void insert(Admin_boardVO admin_boardVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(admin_boardVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}


//	public void update(Admin_boardVO admin_boardVO) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			session.saveOrUpdate(admin_boardVO);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//	}


//	public void delete(Integer i_no) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			Admin_boardVO admin_boardV = new Admin_boardVO();
//			admin_boardV.seti_no(i_no);
//			session.delete(admin_boardV);
//			session.getTransaction().commit();
//		} catch (RuntimeException ex) {
//			session.getTransaction().rollback();
//			throw ex;
//		}
//	}


	public Admin_boardVO findByPrimaryKey(Integer p_no) {
		Admin_boardVO Admin_boardVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Admin_boardVO = (Admin_boardVO) session.get(Admin_boardVO.class, p_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return Admin_boardVO;
	}


	public List<Admin_boardVO> getAll() {
		List<Admin_boardVO> list = null;
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

	public List<Admin_boardVO> getagents() {
		List<Admin_boardVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			SQLQuery query = session.createSQLQuery("select * from admin_board where i_no in (select MAX(i_no) from admin_board group by UserAgent)");
			query.addEntity(Admin_boardVO.class);
			query.setFirstResult(0);
			query.setMaxResults(10);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	public List<Admin_boardVO> getlastReferer() {
		List<Admin_boardVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			SQLQuery query = session.createSQLQuery("  select * from admin_board where lastReferer  IS NOT NULL order by i_no DESC");
			query.setFirstResult(0);
			query.setMaxResults(10);
			query.addEntity(Admin_boardVO.class);
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
		Admin_boardHibernateDAO dao = new Admin_boardHibernateDAO();
//		 List<String> listStyle = dao.findGrapeType("紅葡萄酒");
//		 for (String aEmp : listStyle) {
//		
//		 System.out.println(aEmp);
//		 }
		
		// 新增
//		 Admin_boardVO admin_boardVOO1 = new Admin_boardVO();
//		 admin_boardVOO1.setQueryString("QueryString路易拉葡萄酒");
//		 admin_boardVOO1.setRemoteAddr("布利一級setRemoteAddr葡萄園白2008");
//		 admin_boardVOO1.setServletPath("布利一級葡萄setServletPath");
//		 admin_boardVOO1.setUserAgent("7圖夏園白setUserAgent");
//		 admin_boardVOO1.setLastReferer("123");	
//		 admin_boardVOO1.setViewedate(new Timestamp(new java.util.Date().getTime()));
//		 admin_boardVOO1.setUser_os("123");		 
//		 dao.insert(admin_boardVOO1);

		// ------------------------------------------------
		// 查詢

		// Admin_boardVO admin_boardVOO3 = dao.findByPrimaryKey(2);
		// System.out.println(admin_boardVOO3.getP_no() + ",");
		// System.out.println(admin_boardVOO3.getP_name() + ",");
		// System.out.println(admin_boardVOO3.getP_year() + ",");
		// System.out.println(admin_boardVOO3.getP_rate() + ",");
		// System.out.println(admin_boardVOO3.getP_grape() );
		// System.out.println();
		// 查詢
		List<Admin_boardVO> list = dao.getlastReferer();
		for (Admin_boardVO aEmp : list) {
			 System.out.print(aEmp.getI_no() + ",");
			 System.out.print(aEmp.getQueryString() + ",");
			 System.out.print(aEmp.getRemoteAddr() + ",");
			 System.out.print(aEmp.getServletPath() + ",");
			 System.out.print(aEmp.getLastReferer() + ",");			 
			 System.out.println(aEmp.getUserAgent() + ",");
			 System.out.print(aEmp.getViewedate() + ",");			 
			 System.out.print(aEmp.getUser_os() + ",");
			 System.out.println(aEmp.getUser_browser() + ",");
			 System.out.println();
		}
	}





}
