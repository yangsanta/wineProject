package food_set.model;

import java.util.*;
import java.sql.*;

import food_set.model.Food_setDAO;
import food_set.model.Food_setVO;

public class Food_setDAO implements Food_setDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT = "INSERT INTO food_set (f_name) VALUES ( ?)";
	private static final String GET_ALL_STMT = "SELECT fs_id, f_is, i_id, s_id FROM food_set order by fs_id";
	private static final String GET_ONE_STMT = "SELECT fs_id, f_is, i_id, s_id FROM food_set where fs_id=?";
	private static final String DELETE = "DELETE FROM food_set where fs_id = ?";
	private static final String UPDATE = "UPDATE food fs_is=?, f_is=?, i_id=?, s_id=? where fs_id=?";

	public void insert(Food_setVO food_setVO) {
			// TODO Auto-generated method stub
			
		
		
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, food_setVO.getFs_id());
			pstmt.setInt(2, food_setVO.getF_id());
			pstmt.setInt(3, food_setVO.getI_id());
			pstmt.setInt(4, food_setVO.getS_id());

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
	public void update(Food_setVO food_setVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, food_setVO.getF_id());
			pstmt.setInt(2, food_setVO.getI_id());
			pstmt.setInt(3, food_setVO.getS_id());
			pstmt.setInt(4, food_setVO.getFs_id());

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
	public void delete(Integer fs_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, fs_id);

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
	
	public Food_setVO findByPrimaryKey(Integer fs_id) {

		Food_setVO food_setVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, fs_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				food_setVO = new Food_setVO();
				food_setVO.setFs_id(rs.getInt("fs_id"));
				food_setVO.setF_id(rs.getInt("f_id"));
				food_setVO.setI_id(rs.getInt("i_id"));
				food_setVO.setS_id(rs.getInt("s_id"));

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
		return food_setVO;
	}

	public List<Food_setVO> getAll() {
		List<Food_setVO> list = new ArrayList<Food_setVO>();
		Food_setVO food_setVO = null;

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
				food_setVO = new Food_setVO();
				food_setVO.setFs_id(rs.getInt("fs_id"));
				food_setVO.setF_id(rs.getInt("f_id"));
				food_setVO.setI_id(rs.getInt("i_id"));
				food_setVO.setS_id(rs.getInt("s_id"));
				
				list.add(food_setVO); // Store the row in the list
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

//	public static void main(String[] args) {
//
//		Food_setDAO dao = new Food_setDAO();
//
//		// 新增
//		Food_setVO food_setVO1 = new Food_setVO();
//		food_setVO1.setFs_id("4456");
//		food_setVO1.setF_id("1001");
//		food_setVO1.setI_id("2001");
//		food_setVO1.setS_id("3001");
//
//		dao.insert(food_setVO1);
//
//		// 修改
//		Food_setVO food_setVO2 = new Food_setVO();
//		food_setVO2.setFs_id(new Integer(4001));
//		food_setVO2.setF_id(1001);
//		food_setVO2.setF_id(2001);
//		food_setVO2.setF_id(3001);
//		//
//		dao.update(food_setVO2);
//
//		// 刪除
//		dao.delete(101);
//
//		// // 查詢
//		Food_setVO food_setVO3 = dao.findByPrimaryKey(102);
//		System.out.print(food_setVO3.getFs_id() + ",");
//		System.out.print(food_setVO3.getF_id() + ",");
//		System.out.print(food_setVO3.getI_id() + ",");
//		System.out.print(food_setVO3.getS_id() );
//		System.out.println("---------------------");
//
//		// 查詢
//		List<Food_setVO> list = dao.getAll();
//		for (Food_setVO afood_set : list) {
//			System.out.print(afood_set.getFs_id() + ",");
//			System.out.print(afood_set.getF_id() + ",");
//			System.out.print(afood_set.getI_id() + ",");
//			System.out.print(afood_set.getS_id() + ",");
//			System.out.println("-1---------------1-");
//		}
//	}
	@Override
	public Integer findTotalNOofFood_set() {
		// TODO Auto-generated method stub
		return null;
	}

	

	

	

}