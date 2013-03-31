package coupon_set.model;

import java.util.*;
import java.sql.*;

public class Coupon_setDAO implements Coupon_setDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	String driver = "com.mysql.jdbc.Driver ";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
//	String url = "jdbc:mysql://localhost:3306/WineProject?characterEncoding=UTF-8";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO coupon_set (cs_price,cs_limit_price) VALUES (?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT cs_limit_price,cs_price FROM coupon_set order by cs_limit_price";
	private static final String GET_ONE_STMT =
		      "SELECT cs_limit_price,cs_price FROM coupon_set where cs_limit_price=?";
	private static final String DELETE =
		      "DELETE FROM coupon_set where cs_limit_price = ?";
	private static final String UPDATE =
		      "UPDATE coupon_set set cs_price=? where cs_limit_price=?";


	public void insert(Coupon_setVO coupon_setVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, coupon_setVO.getcs_price());
			pstmt.setInt(2, coupon_setVO.getcs_limit_price());	

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


	public void update(Coupon_setVO coupon_setVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, coupon_setVO.getcs_price());
			pstmt.setInt(2, coupon_setVO.getcs_limit_price());
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
	public void delete(Integer cs_limit_price) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, cs_limit_price);

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


	public Coupon_setVO findByPrimaryKey(Integer cs_limit_price) {

		Coupon_setVO coupon_setVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, cs_limit_price);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				coupon_setVO = new Coupon_setVO();
				coupon_setVO.setcs_limit_price(rs.getInt("cs_limit_price"));
				coupon_setVO.setcs_price(rs.getInt("cs_price"));
				
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
		return coupon_setVO;
	}


	public List<Coupon_setVO> getAll() {
		List<Coupon_setVO> list = new ArrayList<Coupon_setVO>();
		Coupon_setVO coupon_setVO = null;

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
				coupon_setVO = new Coupon_setVO();
				coupon_setVO.setcs_limit_price(rs.getInt("cs_limit_price"));
				coupon_setVO.setcs_price(rs.getInt("cs_price"));
				
				list.add(coupon_setVO); // Store the row in the list
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

		Coupon_setDAO dao = new Coupon_setDAO();

		// 新增
//		Coupon_setVO coupon_setVO1 = new Coupon_setVO();
//
//		coupon_setVO1.setcs_price(501);
//		coupon_setVO1.setcs_limit_price(30001);
//		dao.insert(coupon_setVO1);

		// 修改
//		Coupon_setVO coupon_setVO2 = new Coupon_setVO();
//		coupon_setVO2.setcs_limit_price(30001);
//		coupon_setVO2.setcs_price(502);
//
//		dao.update(coupon_setVO2);

//		// 刪除
//		dao.delete(30001);

//		// 查詢
//		Coupon_setVO coupon_setVO3 = dao.findByPrimaryKey(500);
//		System.out.print(coupon_setVO3.getcs_limit_price() + ",");
//		System.out.print(coupon_setVO3.getcs_price());
//		System.out.println("---------------------");

		// 查詢
		List<Coupon_setVO> list = dao.getAll();
		for (Coupon_setVO acoupon_set : list) {
			System.out.print(acoupon_set.getcs_limit_price() + ",");
			System.out.print(acoupon_set.getcs_price() + ",");

			
			System.out.println("-1---------------1-");
		}
	}


}