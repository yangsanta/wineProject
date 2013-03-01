package ab.model;

import java.util.*;
import java.sql.*;

public class AbDAO implements AbDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO ab (ab_a_p_id,ab_b_p_id) VALUES (?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT Uniid,ab_a_p_id,ab_b_p_id FROM ab order by Uniid";
	private static final String GET_ONE_STMT =
		      "SELECT Uniid,ab_a_p_id,ab_b_p_id FROM ab where Uniid=?";
	private static final String DELETE =
		      "DELETE FROM ab where Uniid = ?";
	private static final String UPDATE =
		      "UPDATE ab set ab_a_p_id=?,ab_b_p_id=? where Uniid=?";


	public void insert(AbVO abVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, abVO.getab_a_p_id());
			pstmt.setInt(2, abVO.getab_b_p_id());	

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


	public void update(AbVO abVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, abVO.getab_a_p_id());
			pstmt.setInt(2, abVO.getab_b_p_id());
			pstmt.setInt(3, abVO.getUniid());			
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
	public void delete(Integer Uniid) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, Uniid);

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


	public AbVO findByPrimaryKey(Integer Uniid) {

		AbVO abVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, Uniid);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				abVO = new AbVO();
				abVO.setUniid(rs.getInt("Uniid"));
				abVO.setab_a_p_id(rs.getInt("ab_a_p_id"));
				abVO.setab_b_p_id(rs.getInt("ab_b_p_id"));				
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
		return abVO;
	}


	public List<AbVO> getAll() {
		List<AbVO> list = new ArrayList<AbVO>();
		AbVO abVO = null;

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
				abVO = new AbVO();
				abVO.setUniid(rs.getInt("Uniid"));
				abVO.setab_a_p_id(rs.getInt("ab_a_p_id"));
				abVO.setab_b_p_id(rs.getInt("ab_b_p_id"));	
				list.add(abVO); // Store the row in the list
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

		AbDAO dao = new AbDAO();

		// 新增
		AbVO abVO1 = new AbVO();

		abVO1.setab_a_p_id(103);
		abVO1.setab_b_p_id(1003);
		dao.insert(abVO1);

		// 修改
		AbVO abVO2 = new AbVO();
		abVO2.setUniid(1);
		abVO2.setab_a_p_id(1011);
		abVO2.setab_b_p_id(10011);
		
		dao.update(abVO2);

//		// 刪除
//		dao.delete(2);

//		// 查詢
		AbVO abVO3 = dao.findByPrimaryKey(3);
		System.out.print(abVO3.getUniid() + ",");
		System.out.print(abVO3.getab_a_p_id());
		System.out.println("---------------------");

		// 查詢
		List<AbVO> list = dao.getAll();
		for (AbVO aab : list) {
			System.out.print(aab.getUniid() + ",");
			System.out.print(aab.getab_a_p_id() + ",");

			
			System.out.println("-1---------------1-");
		}
	}


}