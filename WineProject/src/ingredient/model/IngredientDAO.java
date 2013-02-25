package ingredient.model;

import java.util.*;
import java.sql.*;

public class IngredientDAO implements IngredientDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT =
		      "INSERT INTO ingredient (i_name) VALUES ( ?)";
	private static final String GET_ALL_STMT =
		      "SELECT i_id,i_name FROM ingredient order by i_id";
	private static final String GET_ONE_STMT =
		      "SELECT i_id,i_name FROM ingredient where i_id=?";
	private static final String DELETE =
		      "DELETE FROM ingredient where i_id = ?";
	private static final String UPDATE =
		      "UPDATE ingredient set i_name=? where i_id=?";


	public void insert(IngredientVO ingredientVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, ingredientVO.geti_name());
			

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


	public void update(IngredientVO ingredientVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, ingredientVO.geti_name());
			pstmt.setInt(2, ingredientVO.geti_id());

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
	public void delete(Integer i_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, i_id);

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


	public IngredientVO findByPrimaryKey(Integer i_id) {

		IngredientVO ingredientVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, i_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo �]�٬� Domain objects
				ingredientVO = new IngredientVO();
				ingredientVO.seti_id(rs.getInt("i_id"));
				ingredientVO.seti_name(rs.getString("i_name"));
				
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
		return ingredientVO;
	}


	public List<IngredientVO> getAll() {
		List<IngredientVO> list = new ArrayList<IngredientVO>();
		IngredientVO ingredientVO = null;

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
				ingredientVO = new IngredientVO();
				ingredientVO.seti_id(rs.getInt("i_id"));
				ingredientVO.seti_name(rs.getString("i_name"));
				
				list.add(ingredientVO); // Store the row in the list
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

		IngredientDAO dao = new IngredientDAO();

		// �s�W
		IngredientVO ingredientVO1 = new IngredientVO();
		ingredientVO1.seti_name("�s�W���a���d1");

		dao.insert(ingredientVO1);

		// �ק�
		IngredientVO ingredientVO2 = new IngredientVO();
		ingredientVO2.seti_id(new Integer(102));
		ingredientVO2.seti_name("�קﰪ�R��12");

		dao.update(ingredientVO2);

		// �R��
		dao.delete(101);

//		// �d��
		IngredientVO ingredientVO3 = dao.findByPrimaryKey(102);
		System.out.print(ingredientVO3.geti_id() + ",");
		System.out.print(ingredientVO3.geti_name());
		System.out.println("---------------------");

		// �d��
		List<IngredientVO> list = dao.getAll();
		for (IngredientVO aingredient : list) {
			System.out.print(aingredient.geti_id() + ",");
			System.out.print(aingredient.geti_name() + ",");

			
			System.out.println("-1---------------1-");
		}
	}


}