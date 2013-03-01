package member.model;

import java.util.*;
import java.sql.*;

public class MemberDAO implements MemberDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO member (m_name,m_pwd,m_mobile,m_email,m_bday,m_addr,m_pic,m_safety_q,m_safety_a,m_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT m_no,m_name,m_pwd,m_mobile,m_email,m_bday,m_addr,m_pic,m_safety_q,m_safety_a,m_status FROM member order by m_no";
	private static final String GET_ONE_STMT =
		      "SELECT m_no,m_name,m_pwd,m_mobile,m_email,m_bday,m_addr,m_pic,m_safety_q,m_safety_a,m_status FROM member where m_no=?";
	private static final String DELETE =
		      "DELETE FROM member where m_no = ?";
	private static final String UPDATE =
		      "UPDATE member set m_name=?,m_pwd=?,m_mobile=?,m_email=?,m_bday=?,m_addr=?,m_pic=?,m_safety_q=?,m_safety_a=?,m_status=? where m_no=?";

	@Override
	public void insert(MemberVO memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, memberVO.getM_name());
			pstmt.setString(2, memberVO.getM_pwd());
			pstmt.setString(3, memberVO.getM_mobile());
			pstmt.setString(4, memberVO.getM_email());
			pstmt.setDate(5, memberVO.getM_bday());
			pstmt.setString(6, memberVO.getM_addr());
			pstmt.setString(7, memberVO.getM_pic());
			pstmt.setString(8, memberVO.getM_safety_q());
			pstmt.setString(9, memberVO.getM_safety_a());
			pstmt.setInt(10, memberVO.getM_status());

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
	public void update(MemberVO memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, memberVO.getM_name());
			pstmt.setString(2, memberVO.getM_pwd());
			pstmt.setString(3, memberVO.getM_mobile());
			pstmt.setString(4, memberVO.getM_email());
			pstmt.setDate(5, memberVO.getM_bday());
			pstmt.setString(6, memberVO.getM_addr());
			pstmt.setString(7, memberVO.getM_pic());
			pstmt.setString(8, memberVO.getM_safety_q());
			pstmt.setString(9, memberVO.getM_safety_a());
			pstmt.setInt(10, memberVO.getM_status());
			pstmt.setInt(11, memberVO.getM_no());

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
	public void delete(Integer m_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, m_no);

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
	public MemberVO findByPrimaryKey(Integer m_no) {

		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, m_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				memberVO = new MemberVO();
				memberVO.setM_no(rs.getInt("m_no"));
				memberVO.setM_name(rs.getString("m_name"));
				memberVO.setM_pwd(rs.getString("m_pwd"));
				memberVO.setM_mobile(rs.getString("m_mobile"));
				memberVO.setM_email(rs.getString("m_email"));
				memberVO.setM_bday(rs.getDate("m_bday"));
				memberVO.setM_addr(rs.getString("m_addr"));
				memberVO.setM_pic(rs.getString("m_pic"));
				memberVO.setM_safety_q(rs.getString("m_safety_q"));
				memberVO.setM_safety_a(rs.getString("m_safety_a"));
				memberVO.setM_status(rs.getInt("m_status"));
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
		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO memberVO = null;

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
				memberVO = new MemberVO();
				memberVO.setM_no(rs.getInt("m_no"));
				memberVO.setM_name(rs.getString("m_name"));
				memberVO.setM_pwd(rs.getString("m_pwd"));
				memberVO.setM_mobile(rs.getString("m_mobile"));
				memberVO.setM_email(rs.getString("m_email"));
				memberVO.setM_bday(rs.getDate("m_bday"));
				memberVO.setM_addr(rs.getString("m_addr"));
				memberVO.setM_pic(rs.getString("m_pic"));
				memberVO.setM_safety_q(rs.getString("m_safety_q"));
				memberVO.setM_safety_a(rs.getString("m_safety_a"));
				memberVO.setM_status(rs.getInt("m_status"));
				list.add(memberVO); // Store the row in the list
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

		MemberDAO dao = new MemberDAO();

		// 新增
		MemberVO memberVO1 = new MemberVO();
		memberVO1.setM_name("king21");
		memberVO1.setM_pwd("president");
		memberVO1.setM_mobile("0955959888");
		memberVO1.setM_email("kk.jj@yahoo.com");
		memberVO1.setM_bday(java.sql.Date.valueOf("1981-11-17"));
		memberVO1.setM_addr("Taipei,Taiwan,ROC.");
		memberVO1.setM_pic("D:/userimages/00000.jpg");
		memberVO1.setM_safety_q("Whats the name of my best classmate in elementary school?");
		memberVO1.setM_safety_a("Queen");
		memberVO1.setM_status(new Integer(2));
		dao.insert(memberVO1);

		// 修改
		MemberVO memberVO2 = new MemberVO();
		memberVO2.setM_no(new Integer(1002));
		memberVO2.setM_name("king12");
		memberVO2.setM_pwd("president");
		memberVO2.setM_mobile("0955959888");
		memberVO2.setM_email("kk.jj@yahoo.com");
		memberVO2.setM_bday(java.sql.Date.valueOf("1981-11-17"));
		memberVO2.setM_addr("Taipei,Taiwan,ROC.");
		memberVO2.setM_pic("D:/userimages/00000.jpg");
		memberVO2.setM_safety_q("Whats the name of my best classmate in elementary school?");
		memberVO2.setM_safety_a("Queen");
		memberVO2.setM_status(new Integer(2));
		dao.update(memberVO2);

		// 刪除
		dao.delete(1001);

		// 查詢
		MemberVO memberVO3 = dao.findByPrimaryKey(1004);
		System.out.print(memberVO3.getM_no() + ",");
		System.out.print(memberVO3.getM_name() + ",");
		System.out.print(memberVO3.getM_pwd() + ",");
		System.out.print(memberVO3.getM_mobile() + ",");
		System.out.print(memberVO3.getM_email() + ",");
		System.out.print(memberVO3.getM_bday() + ",");
		System.out.println(memberVO3.getM_addr());
		System.out.println(memberVO3.getM_pic());
		System.out.println(memberVO3.getM_safety_q());
		System.out.println(memberVO3.getM_safety_a());
		System.out.println(memberVO3.getM_status());
		System.out.println("---------------------");

		// 查詢
		List<MemberVO> list = dao.getAll();
		for (MemberVO aMember : list) {
			System.out.print(aMember.getM_no() + ",");
			System.out.print(aMember.getM_name() + ",");
			System.out.print(aMember.getM_pwd() + ",");
			System.out.print(aMember.getM_mobile() + ",");
			System.out.print(aMember.getM_email() + ",");
			System.out.print(aMember.getM_bday() + ",");
			System.out.println(aMember.getM_addr());
			System.out.println(aMember.getM_pic());
			System.out.println(aMember.getM_safety_q());
			System.out.println(aMember.getM_safety_a());
			System.out.println(aMember.getM_status());
			
			System.out.println();
		}
	}
}