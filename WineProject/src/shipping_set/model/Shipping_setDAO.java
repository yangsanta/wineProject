package shipping_set.model;

import java.util.*;
import java.sql.*;

public class Shipping_setDAO implements Shipping_setDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO shipping_set (min_pirce) VALUES ( ?)";
	private static final String GET_ALL_STMT =
		      "SELECT min_pirce FROM shipping_set order by min_pirce";
	private static final String GET_ONE_STMT =
		      "SELECT min_pirce FROM shipping_set where min_pirce=?";
	private static final String DELETE =
		      "DELETE FROM shipping_set where min_pirce = ?";
	private static final String UPDATE =
		      "UPDATE shipping_set set min_pirce=? ";


	public void insert(Shipping_setVO shipping_setVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, shipping_setVO.getMin_pirce());
			

			pstmt.executeUpdate();

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

	}


	public void update(Shipping_setVO shipping_setVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, shipping_setVO.getMin_pirce());

			pstmt.executeUpdate();

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

	}

	@Override
	public void delete(Integer min_pirce) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, min_pirce);

			pstmt.executeUpdate();

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

	}


	public Shipping_setVO findByPrimaryKey(Integer min_pirce) {

		Shipping_setVO shipping_setVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, min_pirce);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				shipping_setVO = new Shipping_setVO();
				shipping_setVO.setMin_pirce(rs.getInt("min_pirce"));
				
			}

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
		return shipping_setVO;
	}


	public List<Shipping_setVO> getAll() {
		List<Shipping_setVO> list = new ArrayList<Shipping_setVO>();
		Shipping_setVO shipping_setVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				shipping_setVO = new Shipping_setVO();
				shipping_setVO.setMin_pirce(rs.getInt("min_pirce"));
				
				list.add(shipping_setVO); // Store the row in the list
			}

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
		return list;
	}

	public static void main(String[] args) {

		Shipping_setDAO dao = new Shipping_setDAO();

		// 新增
//		Shipping_setVO shipping_setVO1 = new Shipping_setVO();
//		shipping_setVO1.setMin_pirce(300);
//		dao.insert(shipping_setVO1);

		// 修改
//		Shipping_setVO shipping_setVO2 = new Shipping_setVO();
//		shipping_setVO2.setMin_pirce(400);
//
//		dao.update(shipping_setVO2);

		// 刪除
//		dao.delete(300);

		// 查詢
//		Shipping_setVO shipping_setVO3 = dao.findByPrimaryKey(800);
//		System.out.print(shipping_setVO3.getMin_pirce() + ",");
//		System.out.println("---------------------");

		// 查詢
		List<Shipping_setVO> list = dao.getAll();
		for (Shipping_setVO ashipping_set : list) {
			System.out.print(ashipping_set.getMin_pirce() + ",");

			
			System.out.println("-1---------------1-");
		}
	}


}