package orders.model;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrdersDAO implements OrdersDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";
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

	private static final String INSERT_STMT = "INSERT INTO orders (m_no,o_date,c_key,o_shipping,o_after_sales,o_recipient,o_recipient_addr,o_recipient_tel,o_status,o_pic) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT o_no,m_no,o_date,c_key,o_shipping,o_after_sales,o_recipient,o_recipient_addr,o_recipient_tel,o_status,o_pic FROM orders order by o_no";
	private static final String GET_ONE_STMT = "SELECT o_no,m_no,o_date,c_key,o_shipping,o_after_sales,o_recipient,o_recipient_addr,o_recipient_tel,o_status,o_pic FROM orders where o_no = ?";
	private static final String DELETE = "DELETE FROM orders where o_no = ?";
	private static final String UPDATE = "UPDATE orders set m_no=?, o_date=?, c_key=?, o_shipping=?, o_after_sales=?, o_recipient=?, o_recipient_addr=?, o_recipient_tel =?, o_status=?, o_pic=? where o_no = ?";

	@Override
	public void insert(OrdersVO orderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, orderVO.getM_no());
			pstmt.setDate(2, orderVO.getO_date());
			pstmt.setString(3, orderVO.getC_key());
			pstmt.setDouble(4, orderVO.getO_shipping());
			pstmt.setDouble(5, orderVO.getO_after_sales());
			pstmt.setString(6, orderVO.getO_recipient());
			pstmt.setString(7, orderVO.getO_recipient_addr());
			pstmt.setString(8, orderVO.getO_recipient_tel());
			pstmt.setString(9, orderVO.getO_status());
			pstmt.setString(10, orderVO.getO_pic());

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
	public void update(OrdersVO orderVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, orderVO.getM_no());
			pstmt.setDate(2, orderVO.getO_date());
			pstmt.setString(3, orderVO.getC_key());
			pstmt.setDouble(4, orderVO.getO_shipping());
			pstmt.setDouble(5, orderVO.getO_after_sales());
			pstmt.setString(6, orderVO.getO_recipient());
			pstmt.setString(7, orderVO.getO_recipient_addr());
			pstmt.setString(8, orderVO.getO_recipient_tel());
			pstmt.setString(9, orderVO.getO_status());
			pstmt.setString(10, orderVO.getO_pic());
			pstmt.setInt(11, orderVO.getO_no());

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
	public void delete(Integer o_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, o_no);

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
	public OrdersVO findByPrimaryKey(Integer o_no) {

		OrdersVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, o_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				orderVO = new OrdersVO();
				orderVO.setO_no(rs.getInt("o_no"));
				orderVO.setM_no(rs.getInt("m_no"));
				orderVO.setO_date(rs.getDate("o_date"));
				orderVO.setC_key(rs.getString("c_key"));
				orderVO.setO_shipping(rs.getDouble("o_shipping"));
				orderVO.setO_after_sales(rs.getDouble("o_after_sales"));
				orderVO.setO_recipient(rs.getString("o_recipient"));
				orderVO.setO_recipient_addr(rs.getString("o_recipient_addr"));
				orderVO.setO_recipient_tel(rs.getString("o_recipient_tel"));
				orderVO.setO_status(rs.getString("o_status"));
				orderVO.setO_pic(rs.getString("o_pic"));
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
		return orderVO;
	}

	@Override
	public List<OrdersVO> getAll() {
		List<OrdersVO> list = new ArrayList<OrdersVO>();
		OrdersVO orderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				orderVO = new OrdersVO();
				orderVO.setO_no(rs.getInt("o_no"));
				orderVO.setM_no(rs.getInt("m_no"));
				orderVO.setO_date(rs.getDate("o_date"));
				orderVO.setC_key(rs.getString("c_key"));
				orderVO.setO_shipping(rs.getDouble("o_shipping"));
				orderVO.setO_after_sales(rs.getDouble("o_after_sales"));
				orderVO.setO_recipient(rs.getString("o_recipient"));
				orderVO.setO_recipient_addr(rs.getString("o_recipient_addr"));
				orderVO.setO_recipient_tel(rs.getString("o_recipient_tel"));
				orderVO.setO_status(rs.getString("o_status"));
				orderVO.setO_pic(rs.getString("o_pic"));
				list.add(orderVO); // Store the row in the list
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
}
