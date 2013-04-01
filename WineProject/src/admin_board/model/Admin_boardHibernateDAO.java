package admin_board.model;

import hibernate.util.HibernateUtil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import product.model.ProductVO;

public class Admin_boardHibernateDAO {
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

	// public void update(Admin_boardVO admin_boardVO) {
	// Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	// try {
	// session.beginTransaction();
	// session.saveOrUpdate(admin_boardVO);
	// session.getTransaction().commit();
	// } catch (RuntimeException ex) {
	// session.getTransaction().rollback();
	// throw ex;
	// }
	// }

	// public void delete(Integer i_no) {
	// Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	// try {
	// session.beginTransaction();
	// Admin_boardVO admin_boardV = new Admin_boardVO();
	// admin_boardV.seti_no(i_no);
	// session.delete(admin_boardV);
	// session.getTransaction().commit();
	// } catch (RuntimeException ex) {
	// session.getTransaction().rollback();
	// throw ex;
	// }
	// }

	public Admin_boardVO findByPrimaryKey(Integer p_no) {
		Admin_boardVO Admin_boardVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Admin_boardVO = (Admin_boardVO) session.get(Admin_boardVO.class,
					p_no);
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
			SQLQuery query = session
					.createSQLQuery("select * from admin_board where i_no in (select MAX(i_no) from admin_board group by UserAgent)");
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
			SQLQuery query = session
					.createSQLQuery("  select * from admin_board where lastReferer  IS NOT NULL order by i_no DESC");
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

	public Map<String, String> getvisiter() {
		List<Admin_boardVO> list = null;
		Map<String, String> map = new TreeMap<String, String>();
		int num = 0;
		int numday = 0;
		int nummonth = 0;
		int numlastmonth = 0;
		int numyesterday = 0;
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session
					.createQuery("select viewedate,i_no from admin_board where i_no in (select MAX(i_no) from admin_board group by  remoteAddr,CONVERT(CHAR(8), viewedate, 112))");  //mssql
//					.createSQLQuery("select * from admin_board where i_no in (select MAX(i_no) from admin_board group by  remoteAddr, DATE_FORMAT( viewedate,  '%y%m' ))"); //mysql
//			query.addEntity(Admin_boardVO.class);
			
			list = query.list();
			num = query.list().size();
			list = query.list();
			for (Admin_boardVO aEmp : list) {
				Timestamp date = aEmp.getViewedate();
				DateFormat DF = new SimpleDateFormat("yyyy-MM-dd");
				DateFormat mF = new SimpleDateFormat("yyyy-MM");
				Date today = new java.sql.Date(System.currentTimeMillis());
				Date yesterday = new java.sql.Date(System.currentTimeMillis()
						- 1 * 24 * 3600 * 1000);
				Date lastmonth = new java.sql.Date(System.currentTimeMillis()
						- 31 * 24 * 3600 * 1000);
				if ((DF.format(today)).equals(DF.format(date))) {//本日人數
					numday++;
				}
				if ((DF.format(yesterday)).equals(DF.format(date))) {//昨天人數
					numyesterday++;
				}
				if ((mF.format(today)).equals(mF.format(date))) {//本月人數
					nummonth++;
				}
				if ((mF.format(lastmonth)).equals(mF.format(date))) {//上月人數
					numlastmonth++;
				}
			}
			map.put("num", Integer.toString(num));
			map.put("numday", Integer.toString(numday));
			map.put("nummonth", Integer.toString(nummonth));
			map.put("numyesterday", Integer.toString(numyesterday));
			map.put("numlastmonth", Integer.toString(numyesterday));			

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return map;
	}
	//-----------------------
	@SuppressWarnings("null")
	public Map<String, String> getvisiterJDBC() throws ParseException {
		
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
//		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";	
		String userid = "sa";
		String passwd = "sa123456";
		Map<String, String> map = new TreeMap<String, String>();
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {List<String> list =new ArrayList<String>();
	int num = 0;
		int numday = 0;
		int nummonth = 0;
		int numlastmonth = 0;
		int numyesterday = 0;

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement("select viewedate  from admin_board where i_no in (select MAX(i_no) from admin_board group by  remoteAddr,CONVERT(CHAR(8), viewedate, 112))");

			rs = pstmt.executeQuery();

			while (rs.next()) {
	
				String ts =rs.getString(1);
				System.out.println(ts);
                 list.add(ts);
				
			}
			for (String aEmp : list) {
				String dateString = aEmp;
				
				DateFormat DF = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dateU=(java.util.Date) DF.parse(dateString);
				java.sql.Date date = new java.sql.Date(dateU.getTime());
			
				DateFormat mF = new SimpleDateFormat("yyyy-MM");
				Date today = new java.sql.Date(System.currentTimeMillis());
				Date yesterday = new java.sql.Date(System.currentTimeMillis()
						- 1 * 24 * 3600 * 1000);
				Date lastmonth = new java.sql.Date(System.currentTimeMillis()
						- 31 * 24 * 3600 * 1000);
				if ((DF.format(today)).equals(DF.format(date))) {//本日人數
					numday++;
				}
				if ((DF.format(yesterday)).equals(DF.format(date))) {//昨天人數
					numyesterday++;
				}
				if ((mF.format(today)).equals(mF.format(date))) {//本月人數
					nummonth++;
				}
				if ((mF.format(lastmonth)).equals(mF.format(date))) {//上月人數
					numlastmonth++;
				}
			}
			map.put("num", Integer.toString(num));
			map.put("numday", Integer.toString(numday));
			map.put("nummonth", Integer.toString(nummonth));
			map.put("numyesterday", Integer.toString(numyesterday));
			map.put("numlastmonth", Integer.toString(numyesterday));			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return map;
	}
	//------------------------

	public Map<String, String> getpv() {
		List<Timestamp> list = null;
		Map<String, String> map = new TreeMap<String, String>();
		int num = 0;
		int numday = 0;
		int nummonth = 0;
		int numyesterday = 0;
		int numlastmonth = 0;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session
					.createQuery("select viewedate from Admin_boardVO ");
			list = query.list();
			num = query.list().size();
			for (Timestamp aEmp : list) {
				Timestamp date = aEmp;
				DateFormat DF = new SimpleDateFormat("yyyy-MM-dd");
				DateFormat mF = new SimpleDateFormat("yyyy-MM");
				Date today = new java.sql.Date(System.currentTimeMillis());
				Date yesterday = new java.sql.Date(System.currentTimeMillis()
						- 1 * 24 * 3600 * 1000);
				Date lastmonth = new java.sql.Date(System.currentTimeMillis()
						- 31 * 24 * 3600 * 1000);
				if ((DF.format(today)).equals(DF.format(date))) {  //本日pv
					numday++;
				}
				if ((DF.format(yesterday)).equals(DF.format(date))) { //昨日pv
					numyesterday++;
				}
				if ((mF.format(today)).equals(mF.format(date))) { //本月pv
					nummonth++;
				}
				if ((mF.format(lastmonth)).equals(mF.format(date))) {//上月pv
					numlastmonth++;
				}
			}

			map.put("num", Integer.toString(num));
			map.put("numday", Integer.toString(numday));
			map.put("nummonth", Integer.toString(nummonth));
			map.put("numyesterday", Integer.toString(numyesterday));
			map.put("numlastmonth", Integer.toString(numyesterday));
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

		return map;
	}

	// -------------------------------------------------------
	public static void main(String arg[]) {
		Admin_boardHibernateDAO dao = new Admin_boardHibernateDAO();
		// List<String> listStyle = dao.findGrapeType("紅葡萄酒");
		// for (String aEmp : listStyle) {
		//
		// System.out.println(aEmp);
		// }

		// 新增
		// Admin_boardVO admin_boardVOO1 = new Admin_boardVO();
		// admin_boardVOO1.setQueryString("QueryString路易拉葡萄酒");
		// admin_boardVOO1.setRemoteAddr("布利一級setRemoteAddr葡萄園白2008");
		// admin_boardVOO1.setServletPath("布利一級葡萄setServletPath");
		// admin_boardVOO1.setUserAgent("7圖夏園白setUserAgent");
		// admin_boardVOO1.setLastReferer("123");
		// admin_boardVOO1.setViewedate(new Timestamp(new
		// java.util.Date().getTime()));
		// admin_boardVOO1.setUser_os("123");
		// dao.insert(admin_boardVOO1);

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
		Map<String, String> list = dao.getpv();
		System.out.println(new java.sql.Date(System.currentTimeMillis()));
		System.out.println("卓天"
				+ new java.sql.Date(System.currentTimeMillis() - 1 * 24 * 3600
						* 1000));
		System.out.println("*-*-*-" + list);
		// for (Admin_boardVO aEmp : list) {
		// System.out.print(aEmp.a );
		// System.out.print(aEmp.getQueryString() + ",");
		// System.out.print(aEmp.getRemoteAddr() + ",");
		// System.out.print(aEmp.getServletPath() + ",");
		// System.out.print(aEmp.getLastReferer() + ",");
		// System.out.println(aEmp.getUserAgent() + ",");
		// System.out.print(aEmp.getViewedate() + ",");
		// System.out.print(aEmp.getUser_os() + ",");
		// System.out.println(aEmp.getUser_browser() + ",");
		// System.out.println();
		// }
	}

}
