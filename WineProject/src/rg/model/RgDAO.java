package rg.model;

import java.util.*;
import java.sql.*;

public class RgDAO implements RgDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
			 "INSERT INTO rg (p_no,r_or_g,rgs_date,rge_date) VALUES ( ?, ?, ?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT u_id,p_no,r_or_g,rgs_date,rge_date FROM rg order by u_id";
	private static final String GET_ONE_STMT =
		      "SELECT u_id,p_no,r_or_g,rgs_date,rge_date FROM rg where u_id=?";
	private static final String DELETE =
		      "DELETE FROM rg where u_id = ?";
	private static final String UPDATE =
		      "UPDATE rg set p_no=?,r_or_g=?,rgs_date=?,rge_date=? where u_id=?";

	@Override
	public void insert(RgVO rgVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, rgVO.getP_no());
			pstmt.setString(2, rgVO.getR_or_g());

			pstmt.setDate(3, rgVO.getRgs_date());
			pstmt.setDate(4, rgVO.getRge_date());
			

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
	public void update(RgVO rgVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, rgVO.getP_no());
			pstmt.setString(2, rgVO.getR_or_g());

			pstmt.setDate(3, rgVO.getRgs_date());
			pstmt.setDate(4, rgVO.getRge_date());
			pstmt.setInt(5, rgVO.getU_id());

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
	public void delete(Integer u_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, u_id);

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
	public RgVO findByPrimaryKey(Integer u_id) {

		RgVO rgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, u_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 嚙稽嚙誶穿蕭 Domain objects
				rgVO = new RgVO();
				rgVO.setU_id(rs.getInt("u_id"));
				rgVO.setP_no(rs.getInt("p_no"));
				rgVO.setR_or_g(rs.getString("r_or_g"));

				rgVO.setRgs_date(rs.getDate("rgs_date"));
				rgVO.setRge_date(rs.getDate("rge_date"));
				
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
		return rgVO;
	}

	@Override
	public List<RgVO> getAll() {
		List<RgVO> list = new ArrayList<RgVO>();
		RgVO rgVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 嚙稽嚙誶穿蕭 Domain objects
				rgVO = new RgVO();
				rgVO.setU_id(rs.getInt("u_id"));
				rgVO.setP_no(rs.getInt("p_no"));
				rgVO.setR_or_g(rs.getString("r_or_g"));

				rgVO.setRgs_date(rs.getDate("rgs_date"));
				rgVO.setRge_date(rs.getDate("rge_date"));
				list.add(rgVO); // Store the row in the list
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

		RgDAO dao = new RgDAO();

		
		RgVO rgVO1 = new RgVO();
		rgVO1.setP_no(1);
		rgVO1.setR_or_g("r");

		rgVO1.setRgs_date(java.sql.Date.valueOf("2013-02-21"));
		rgVO1.setRge_date(java.sql.Date.valueOf("2013-4-30"));
		
		dao.insert(rgVO1);

		
		RgVO rgVO2 = new RgVO();
		rgVO2.setU_id(new Integer(2));
		rgVO2.setP_no(1);
		rgVO2.setR_or_g("r");

		rgVO2.setRgs_date(java.sql.Date.valueOf("2013-02-21"));
		rgVO2.setRge_date(java.sql.Date.valueOf("2013-4-30"));
		dao.update(rgVO2);

		
		dao.delete(1001);

		
		RgVO rgVO3 = dao.findByPrimaryKey(4);
		System.out.print(rgVO3.getU_id() + ",");
		System.out.print(rgVO3.getP_no() + ",");
		System.out.print(rgVO3.getR_or_g() + ",");

		System.out.print(rgVO3.getRgs_date() + ",");
		System.out.print(rgVO3.getRge_date() + ",");
		
		System.out.println("---------------------");

		
		List<RgVO> list = dao.getAll();
		for (RgVO aRng : list) {
			System.out.print(aRng.getU_id() + ",");
			System.out.print(aRng.getP_no() + ",");
			System.out.print(aRng.getR_or_g() + ",");

			System.out.print(aRng.getRgs_date() + ",");
			System.out.print(aRng.getRge_date() + ",");
			
			
			System.out.println();
		}
	}
}