//package discussion.model;
//
//import java.util.*;
//import java.sql.*;
//
//public class DiscussionDAO implements DiscussionDAO_interface {
//	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
//	String userid = "sa";
//	String passwd = "sa123456";
//
//	private static final String INSERT_STMT = "INSERT INTO discussion (m_no,d_context,d_datetime,d_status,d_final_edit,d_title) VALUES (?, ?, ?, ?, ?, ?)";
//	private static final String GET_ALL_STMT = "SELECT d_no,m_no,d_context,d_datetime,d_status,d_final_edit,d_title FROM discussion order by d_datetime desc";
//	private static final String GET_ONE_STMT = "SELECT d_no,m_no,d_context,d_datetime,d_status,d_final_edit,d_title FROM discussion where d_no=?";
//	private static final String DELETE = "DELETE FROM discussion where d_no = ?";
//	private static final String UPDATE = "UPDATE discussion set m_no=?,d_context=?,d_datetime=?,d_status=?,d_final_edit=?,d_title=? where d_no=?";
//	private static final String FINDNO = "SELECT count(*) as TOTAL_NO FROM discussion";
//
//	@Override
//	public void insert(DiscussionVO discussionVO) {
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(INSERT_STMT);
//
//			pstmt.setInt(1, discussionVO.getM_no());
//			pstmt.setString(2, discussionVO.getD_context());
//			pstmt.setTimestamp(3, discussionVO.getD_datetime());
//			pstmt.setString(4, discussionVO.getD_status());
//			pstmt.setTimestamp(5, discussionVO.getD_final_edit());
//			pstmt.setString(6, discussionVO.getD_title());
//
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//
//	}
//
//	@Override
//	public void update(DiscussionVO discussionVO) {
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(UPDATE);
//
//			pstmt.setInt(1, discussionVO.getM_no());
//			pstmt.setString(2, discussionVO.getD_context());
//			pstmt.setTimestamp(3, discussionVO.getD_datetime());
//			pstmt.setString(4, discussionVO.getD_status());
//			pstmt.setTimestamp(5, discussionVO.getD_final_edit());
//			pstmt.setString(6, discussionVO.getD_title());
//
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//
//	}
//
//	@Override
//	public void delete(Integer d_no) {
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(DELETE);
//
//			pstmt.setInt(1, d_no);
//
//			pstmt.executeUpdate();
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//
//	}
//
//	@Override
//	public DiscussionVO findByPrimaryKey(Integer d_no) {
//
//		DiscussionVO discussionVO = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(GET_ONE_STMT);
//
//			pstmt.setInt(1, d_no);
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				// empVo 也稱為 Domain objects
//				discussionVO = new DiscussionVO();
//				discussionVO.setD_no(rs.getInt("d_no"));
//				discussionVO.setM_no(rs.getInt("m_no"));
//				discussionVO.setD_context(rs.getString("d_context"));
//				discussionVO.setD_datetime(rs.getTimestamp("d_datetime"));
//				discussionVO.setD_status(rs.getString("d_status"));
//				discussionVO.setD_final_edit(rs.getTimestamp("d_final_edit"));
//				discussionVO.setD_title(rs.getString("d_title"));
//
//			}
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return discussionVO;
//	}
//
//	@Override
//	public List<DiscussionVO> getAll() {
//		List<DiscussionVO> list = new ArrayList<DiscussionVO>();
//		DiscussionVO discussion = null;
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(GET_ALL_STMT);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				// empVO 也稱為 Domain objects
//				discussion = new DiscussionVO();
//				discussion.setD_no(rs.getInt("d_no"));
//				discussion.setM_no(rs.getInt("m_no"));
//				discussion.setD_context(rs.getString("d_context"));
//				discussion.setD_datetime(rs.getTimestamp("d_datetime"));
//				discussion.setD_status(rs.getString("d_status"));
//				discussion.setD_final_edit(rs.getTimestamp("d_final_edit"));
//				discussion.setD_title(rs.getString("d_title"));
//				list.add(discussion); // Store the row in the list
//			}
//
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return list;
//	}
//
//	@Override
//	public Integer findTotalNOofDiscussion() {
//		Integer totalNO = null;
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement(FINDNO);
//			rs = pstmt.executeQuery();
//
//			rs.next();
//			totalNO = rs.getInt(1);
//			// Handle any driver errors
//		} catch (ClassNotFoundException e) {
//			throw new RuntimeException("Couldn't load database driver. "
//					+ e.getMessage());
//			// Handle any SQL errors
//		} catch (SQLException se) {
//			throw new RuntimeException("A database error occured. "
//					+ se.getMessage());
//			// Clean up JDBC resources
//		} finally {
//			if (rs != null) {
//				try {
//					rs.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException se) {
//					se.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		}
//		return totalNO;
//
//	}
//
//	public static void main(String args[]) {
//
//		DiscussionDAO dao = new DiscussionDAO();
//		//測試findTotalNOofDiscussion總留言比數
////		Integer totalNO = dao.findTotalNOofDiscussion();
////		System.out.print(totalNO);
//		
//		List<DiscussionVO> list = dao.getAll();
//		for (DiscussionVO aDiscussion : list) {
////			System.out.print(aDiscussion.getD_no() + ",");
////			System.out.print(aDiscussion.getM_no() + ",");
////			System.out.print(aDiscussion.getD_context() + ",");
//			System.out.print(aDiscussion.getD_datetime() + ",");
////			System.out.print(aDiscussion.getD_status() + ",");
////			System.out.print(aDiscussion.getD_final_edit() + ",");
////			System.out.print(aDiscussion.getD_title());
//			System.out.println();	
//		}
//	}
//}