package recipe.model;

import java.util.*;
import java.sql.*;

public class RecipeDAO implements RecipeDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO recipe (f_id,i_id,s_id) VALUES (?, ?, ?)";
	private static final String GET_ALL_STMT =
		      "SELECT rp_id,f_id,i_id,s_id FROM recipe order by rp_id";
	private static final String GET_ONE_STMT =
		      "SELECT rp_id,f_id,i_id,s_id FROM recipe where rp_id=?";
	private static final String DELETE =
		      "DELETE FROM recipe where rp_id = ?";
	private static final String UPDATE =
		      "UPDATE recipe set f_id=?,i_id=?,s_id=? where rp_id=?";

	@Override
	public void insert(RecipeVO recipeVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, recipeVO.getF_id());
			pstmt.setInt(2, recipeVO.getI_id());
			pstmt.setInt(3, recipeVO.getS_id());
			
			

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
	public void update(RecipeVO recipeVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, recipeVO.getF_id());
			pstmt.setInt(2, recipeVO.getI_id());
			pstmt.setInt(3, recipeVO.getS_id());
			pstmt.setInt(4, recipeVO.getRp_id());

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
	public void delete(Integer rp_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, rp_id);

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
	public RecipeVO findByPrimaryKey(Integer rp_id) {

		RecipeVO recipeVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, rp_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				recipeVO = new RecipeVO();
				recipeVO.setRp_id(rs.getInt("rp_id"));
				recipeVO.setF_id(rs.getInt("f_id"));
				recipeVO.setI_id(rs.getInt("i_id"));
				recipeVO.setS_id(rs.getInt("s_id"));
			
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
		return recipeVO;
	}

	@Override
	public List<RecipeVO> getAll() {
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		RecipeVO recipeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);//what
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				recipeVO = new RecipeVO();
				recipeVO.setRp_id(rs.getInt("rp_id"));
				recipeVO.setF_id(rs.getInt("f_id"));
				recipeVO.setI_id(rs.getInt("i_id"));
				recipeVO.setS_id(rs.getInt("s_id"));
			
				list.add(recipeVO); // Store the row in the list
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

		RecipeDAO dao = new RecipeDAO();

		// insert
//		RecipeVO recipeVO1 = new RecipeVO();
//		recipeVO1.setF_id(103);
//		recipeVO1.setI_id(103);
//		recipeVO1.setS_id(103);
//		
//		dao.insert(recipeVO1);

		// update
//		RecipeVO recipeVO2 = new RecipeVO();
//		recipeVO2.setRp_id(103);
//		recipeVO2.setF_id(104);
//		recipeVO2.setI_id(104);
//		recipeVO2.setS_id(104);
//		
//	
//		dao.update(recipeVO2);

		// delete
//		dao.delete(102);

		// select
//		RecipeVO recipeVO3 = dao.findByPrimaryKey(101);
//		System.out.print(recipeVO3.getRp_id() + ",");
//		System.out.print(recipeVO3.getF_id() + ",");
//		System.out.print(recipeVO3.getI_id() + ",");
//		System.out.print(recipeVO3.getS_id() + ",");
//		System.out.println();
//		System.out.println("---------------------");

		// ¬d¸ß
		List<RecipeVO> list = dao.getAll();
		for (RecipeVO aRecipe : list) {
			System.out.print(aRecipe.getRp_id() + ",");
			System.out.print(aRecipe.getF_id() + ",");
			System.out.print(aRecipe.getI_id() + ",");
			System.out.print(aRecipe.getS_id() + ",");
			
			
			System.out.println();
		}
	}
}