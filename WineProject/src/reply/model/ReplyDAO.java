package reply.model;

import java.util.*;
import java.sql.*;

public class ReplyDAO implements ReplyDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO reply (d_no,r_context,m_no,r_datetime,r_status,r_final_edit) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT d_no,r_no,r_context,m_no,r_datetime,r_status,r_final_edit FROM reply order by r_no";
	private static final String GET_ONE_STMT =
		      "SELECT d_no,r_no,r_context,m_no,r_datetime,r_status,r_final_edit FROM reply where r_no=?";
	private static final String DELETE =
		      "DELETE FROM reply where r_no = ?";
	private static final String UPDATE =
		      "UPDATE reply set d_no=?,r_context=?,m_no=?,r_datetime=?,r_status=?,r_final_edit=? where r_no=?";

	@Override
	public void insert(ReplyVO replyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, replyVO.getD_no());
			pstmt.setString(2, replyVO.getR_context());
			pstmt.setInt(3, replyVO.getM_no());
			pstmt.setDate(4, replyVO.getR_datetime());
			pstmt.setString(5, replyVO.getR_status());
			pstmt.setDate(6, replyVO.getR_final_edit());

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
	public void update(ReplyVO replyVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setInt(1, replyVO.getD_no());
			pstmt.setString(2, replyVO.getR_context());
			pstmt.setInt(3, replyVO.getM_no());
			pstmt.setDate(4, replyVO.getR_datetime());
			pstmt.setString(5, replyVO.getR_status());
			pstmt.setDate(6, replyVO.getR_final_edit());
			
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
	public void delete(Integer r_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, r_no);

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
	public ReplyVO findByPrimaryKey(Integer r_no) {

		ReplyVO replyVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, r_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				replyVO = new ReplyVO();
				replyVO.setD_no(rs.getInt("d_no"));
				replyVO.setR_no(rs.getInt("r_no"));
				replyVO.setR_context(rs.getString("r_context"));
				replyVO.setM_no(rs.getInt("m_no"));
				replyVO.setR_datetime(rs.getDate("r_datetime"));
				replyVO.setR_status(rs.getString("r_status"));
				replyVO.setR_final_edit(rs.getDate("r_final_edit"));

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
		return replyVO;
	}

	@Override
	public List<ReplyVO> getAll() {
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		ReplyVO replyVO = null;

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
				replyVO = new ReplyVO();
				replyVO.setD_no(rs.getInt("d_no"));
				replyVO.setR_no(rs.getInt("r_no"));
				replyVO.setR_context(rs.getString("r_context"));
				replyVO.setM_no(rs.getInt("m_no"));
				replyVO.setR_datetime(rs.getDate("r_datetime"));
				replyVO.setR_status(rs.getString("r_status"));
				replyVO.setR_final_edit(rs.getDate("r_final_edit"));
				list.add(replyVO); // Store the row in the list
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
	
}
