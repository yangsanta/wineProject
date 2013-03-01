package admins.model;

import java.util.*;
import java.sql.*;

public class AdminsDAO implements AdminsDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO admins (a_name,a_pwd,a_role) VALUES (?, ?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT a_no,a_name,a_pwd,a_role FROM admins order by a_no";
	private static final String GET_ONE_STMT =
		      "SELECT a_no,a_name,a_pwd,a_role FROM admins where a_no=?";
	private static final String DELETE =
		      "DELETE FROM admins where a_no = ?";
	private static final String UPDATE =
		      "UPDATE admins set a_name=?,a_pwd=?,a_role=? where a_no=?";

	@Override
	public void insert(AdminsVO adminsVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, adminsVO.getA_name());
			pstmt.setString(2, adminsVO.getA_pwd());
			pstmt.setString(3, adminsVO.getA_role());
			
			

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
	public void update(AdminsVO adminsVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, adminsVO.getA_name());
			pstmt.setString(2, adminsVO.getA_pwd());
			pstmt.setString(3, adminsVO.getA_role());
			pstmt.setInt(4, adminsVO.getA_no());

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
	public void delete(Integer a_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, a_no);

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
	public AdminsVO findByPrimaryKey(Integer a_no) {

		AdminsVO adminsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, a_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				adminsVO = new AdminsVO();
				adminsVO.setA_no(rs.getInt("a_no"));
				adminsVO.setA_name(rs.getString("a_name"));
				adminsVO.setA_pwd(rs.getString("a_pwd"));
				adminsVO.setA_role(rs.getString("a_role"));
			
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
		return adminsVO;
	}

	@Override
	public List<AdminsVO> getAll() {
		List<AdminsVO> list = new ArrayList<AdminsVO>();
		AdminsVO adminsVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);//what
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
		
				adminsVO = new AdminsVO();
				adminsVO.setA_no(rs.getInt("a_no"));
				adminsVO.setA_name(rs.getString("a_name"));
				adminsVO.setA_pwd(rs.getString("a_pwd"));
				adminsVO.setA_role(rs.getString("a_role"));
			
				list.add(adminsVO); // Store the row in the list
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

		AdminsDAO dao = new AdminsDAO();

		
		AdminsVO adminsVO1 = new AdminsVO();
		adminsVO1.setA_name("adm1");
		adminsVO1.setA_pwd("111");
		adminsVO1.setA_role("LV_1");
		
		dao.insert(adminsVO1);////next WHAT

		
		AdminsVO adminsVO2 = new AdminsVO();
		adminsVO2.setA_no(new Integer(2));
		adminsVO2.setA_name("adm2");
		adminsVO2.setA_pwd("222");
		adminsVO2.setA_role("LV_2");
		
	
		dao.update(adminsVO2);

		
		dao.delete(1);

		
		AdminsVO adminsVO3 = dao.findByPrimaryKey(3);
		System.out.print(adminsVO3.getA_no() + ",");
		System.out.print(adminsVO3.getA_name() + ",");
		System.out.print(adminsVO3.getA_pwd() + ",");
		System.out.print(adminsVO3.getA_role() + ",");
		System.out.println();
		System.out.println("---------------------");


		List<AdminsVO> list = dao.getAll();
		for (AdminsVO aAdm : list) {
			System.out.print(aAdm.getA_no() + ",");
			System.out.print(aAdm.getA_name() + ",");
			System.out.print(aAdm.getA_pwd() + ",");
			System.out.print(aAdm.getA_role() + ",");
			
			
			System.out.println();
		}
	}
}