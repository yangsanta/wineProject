package sauce.model;

import java.util.*;
import java.sql.*;

public class sauceDAO implements sauceDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO sauce (s_name) VALUES ( ?)";
	private static final String GET_ALL_STMT =
		      "SELECT s_id,s_name FROM sauce order by s_id";
	private static final String GET_ONE_STMT =
		      "SELECT s_id,s_name FROM sauce where s_id=?";
	private static final String DELETE =
		      "DELETE FROM sauce where s_id = ?";
	private static final String UPDATE =
		      "UPDATE sauce set s_name=? where s_id=?";


	public void insert(sauceVO sauceVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, sauceVO.getS_name());
			

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


	public void update(sauceVO sauceVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, sauceVO.getS_name());
			pstmt.setInt(2, sauceVO.getS_id());

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
	public void delete(Integer s_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, s_id);

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


	public sauceVO findByPrimaryKey(Integer s_id) {

		sauceVO sauceVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, s_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]�٬� Domain objects
				sauceVO = new sauceVO();
				sauceVO.setS_id(rs.getInt("s_id"));
				sauceVO.setS_name(rs.getString("s_name"));
				
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
		return sauceVO;
	}


	public List<sauceVO> getAll() {
		List<sauceVO> list = new ArrayList<sauceVO>();
		sauceVO sauceVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO �]�٬� Domain objects
				sauceVO = new sauceVO();
				sauceVO.setS_id(rs.getInt("s_id"));
				sauceVO.setS_name(rs.getString("s_name"));
				
				list.add(sauceVO); // Store the row in the list
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

		sauceDAO dao = new sauceDAO();

		// �s�W
		sauceVO sauceVO1 = new sauceVO();
		sauceVO1.setS_name("�f�X��1");

		dao.insert(sauceVO1);

		// �ק�
		sauceVO sauceVO2 = new sauceVO();
		sauceVO2.setS_id(new Integer(102));
		sauceVO2.setS_name("king12");

		dao.update(sauceVO2);

		// �R��
		dao.delete(101);

//		// �d��
		sauceVO sauceVO3 = dao.findByPrimaryKey(102);
		System.out.print(sauceVO3.getS_id() + ",");
		System.out.print(sauceVO3.getS_name());
		System.out.println("---------------------");

		// �d��
		List<sauceVO> list = dao.getAll();
		for (sauceVO asauce : list) {
			System.out.print(asauce.getS_id() + ",");
			System.out.print(asauce.getS_name() + ",");

			
			System.out.println("-1---------------1-");
		}
	}


}