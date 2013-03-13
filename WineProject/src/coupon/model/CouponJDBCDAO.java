package coupon.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import coupon.model.*;

public class CouponJDBCDAO implements CouponDAO_interface {

	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO coupon (c_key, c_price, c_status, c_deadline) VALUES (?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT c_key, c_price, c_status, c_deadline FROM coupon order by c_key";
	private static final String GET_ONE_STMT = "SELECT c_key, c_price, c_status, c_deadline FROM coupon where c_key = ?";
	private static final String GET_MANY_STMT = "SELECT c_key, c_price, c_status, c_deadline FROM coupon where c_status = ?";
	private static final String DELETE = "DELETE FROM coupon where c_key = ?";
	private static final String UPDATE = "UPDATE coupon set c_price=?, c_status=?, c_deadline=? where c_key = ?";

	@Override
	public void insert(CouponVO couponVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, couponVO.getC_key());
			pstmt.setInt(2, couponVO.getC_price());
			pstmt.setBoolean(3, couponVO.getC_status());
			pstmt.setTimestamp(4, couponVO.getC_deadline());

			pstmt.executeUpdate();

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
	public void update(CouponVO couponVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, couponVO.getC_key());
			pstmt.setInt(2, couponVO.getC_price());
			pstmt.setBoolean(3, couponVO.getC_status());
			pstmt.setTimestamp(4, couponVO.getC_deadline());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void delete(String c_key) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, c_key);

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public CouponVO findByPrimaryKey(String c_key) {
		CouponVO couponVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, c_key);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				couponVO = new CouponVO();
				couponVO.setC_key(rs.getString("c_key"));
				couponVO.setC_price(rs.getInt("c_price"));
				couponVO.setC_status(rs.getBoolean("c_status"));
				couponVO.setC_deadline(rs.getTimestamp("c_deadline"));
			}

			// Handle any driver errors
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
		return couponVO;
	}

	@Override
	public List<CouponVO> getAll() {
		List<CouponVO> list = new ArrayList<CouponVO>();
		CouponVO couponVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// couponVO 也稱為 Domain objects
				couponVO = new CouponVO();
				couponVO.setC_key(rs.getString("c_key"));
				couponVO.setC_price(rs.getInt("c_price"));
				couponVO.setC_status(rs.getBoolean("c_status"));
				couponVO.setC_deadline(rs.getTimestamp("c_deadline"));
				list.add(couponVO); // Store the row in the list
			}

			// Handle any driver errors
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

	// @Override
	// public List<CouponVO> getCouponByStatus(Integer c_status) {
	// List<CouponVO> list = new ArrayList<CouponVO>();
	// CouponVO couponVO = null;
	//
	// Connection con = null;
	// PreparedStatement pstmt = null;
	// ResultSet rs = null;
	//
	// try {
	//
	// con = ds.getConnection();
	// pstmt = con.prepareStatement(GET_ALL_STMT);
	// rs = pstmt.executeQuery();
	//
	// while (rs.next()) {
	// // couponVO 也稱為 Domain objects
	// couponVO = new CouponVO();
	// couponVO.setC_key(rs.getString("c_key"));
	// couponVO.setC_price(rs.getInt("c_price"));
	// couponVO.setC_status(rs.getInt("c_status"));
	// couponVO.setC_deadline(rs.getTimestamp("c_deadline"));
	// list.add(couponVO); // Store the row in the list
	// }
	//
	// // Handle any driver errors
	// } catch (SQLException se) {
	// throw new RuntimeException("A database error occured. "
	// + se.getMessage());
	// // Clean up JDBC resources
	// } finally {
	// if (rs != null) {
	// try {
	// rs.close();
	// } catch (SQLException se) {
	// se.printStackTrace(System.err);
	// }
	// }
	// if (pstmt != null) {
	// try {
	// pstmt.close();
	// } catch (SQLException se) {
	// se.printStackTrace(System.err);
	// }
	// }
	// if (con != null) {
	// try {
	// con.close();
	// } catch (Exception e) {
	// e.printStackTrace(System.err);
	// }
	// }
	// }
	// return list;
	// }

	public static void main(String args[]) {

		CouponJDBCDAO dao = new CouponJDBCDAO();

		coupon.model.CouponVO couponVO = new coupon.model.CouponVO();
		couponVO.setC_key("Test");
		couponVO.setC_price(10000000);
		couponVO.setC_status(true);
		couponVO.setC_deadline(java.sql.Timestamp
				.valueOf("default"));

		dao.insert(couponVO);
	}

	@Override
	public List<CouponVO> findByM_no(Integer m_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
