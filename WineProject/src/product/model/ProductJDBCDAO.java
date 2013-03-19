package product.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductJDBCDAO implements ProductDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=WineProject";
	String userid = "sa";
	String passwd = "sa123456";

	private static final String INSERT_STMT = "INSERT INTO product (p_name,p_year,p_rate,p_area,p_intro,p_num,p_price,p_status,p_winery,p_click_count,p_buy_count,p_style,p_sales,p_vol,p_alcho,p_date,p_type,p_grape) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = "SELECT p_no,p_name,p_year,p_rate,p_area,p_intro,p_num,p_price,p_status,p_winery,p_click_count,p_buy_count,p_style,p_sales,p_vol,p_alcho,p_date,p_type,p_grape FROM product order by p_no";
	private static final String GET_ONE_STMT = "SELECT p_no,p_name,p_year,p_rate,p_area,p_intro,p_num,p_price,p_status,p_winery,p_click_count,p_buy_count,p_style,p_sales,p_vol,p_alcho,p_date,p_type,p_grape FROM product where p_no = ?";
	private static final String DELETE = "DELETE FROM product where p_no = ?";
	private static final String UPDATE = "UPDATE product set p_name= ?,p_year= ?,p_rate= ?,p_area= ?,p_intro= ?,p_num= ?,p_price= ?,p_status= ?,p_winery= ?,p_click_count= ?,p_buy_count= ?,p_style= ?,p_sales= ?,p_vol= ?,p_alcho= ? ,p_date=?,p_type=?,p_grape=? where p_no = ?";

	@Override
	public void insert(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, productVO.getP_name());
			pstmt.setInt(2, productVO.getP_year());
			pstmt.setInt(3, productVO.getP_rate());
			pstmt.setString(4, productVO.getP_area());
			pstmt.setString(5, productVO.getP_intro());
			pstmt.setInt(6, productVO.getP_num());
			pstmt.setDouble(7, productVO.getP_price());
			pstmt.setString(8, productVO.getP_status());
			pstmt.setString(9, productVO.getP_winery());
			pstmt.setInt(10, productVO.getP_click_count());
			pstmt.setInt(11, productVO.getP_buy_count());
			pstmt.setString(12, productVO.getP_style());
			pstmt.setString(13, productVO.getP_sales());
			pstmt.setInt(14, productVO.getP_vol());
			pstmt.setDouble(15, productVO.getP_alcho());
			pstmt.setTimestamp(16, productVO.getP_date());
			pstmt.setString(17, productVO.getP_type());
			pstmt.setString(18, productVO.getP_grape());
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
	public void update(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, productVO.getP_name());
			pstmt.setInt(2, productVO.getP_year());
			pstmt.setInt(3, productVO.getP_rate());
			pstmt.setString(4, productVO.getP_area());
			pstmt.setString(5, productVO.getP_intro());
			pstmt.setInt(6, productVO.getP_num());
			pstmt.setDouble(7, productVO.getP_price());
			pstmt.setString(8, productVO.getP_status());
			pstmt.setString(9, productVO.getP_winery());
			pstmt.setInt(10, productVO.getP_click_count());
			pstmt.setInt(11, productVO.getP_buy_count());
			pstmt.setString(12, productVO.getP_style());
			pstmt.setString(13, productVO.getP_sales());
			pstmt.setInt(14, productVO.getP_vol());
			pstmt.setDouble(15, productVO.getP_alcho());
			pstmt.setTimestamp(16, productVO.getP_date());
			pstmt.setString(17, productVO.getP_type());
			pstmt.setString(18, productVO.getP_grape());
			pstmt.setInt(19, productVO.getP_no());

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
	public void delete(Integer p_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, p_no);

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
	public ProductVO findByPrimaryKey(Integer p_no) {
		ProductVO productVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, p_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				productVO = new ProductVO();
				productVO.setP_no(rs.getInt("p_no"));
				productVO.setP_name(rs.getString("p_name"));
				productVO.setP_year(rs.getInt("p_year"));
				productVO.setP_rate(rs.getInt("p_rate"));
				productVO.setP_area(rs.getString("p_area"));
				productVO.setP_intro(rs.getString("p_intro"));
				productVO.setP_num(rs.getInt("p_num"));
				productVO.setP_price(rs.getInt("p_price"));
				productVO.setP_status(rs.getString("p_status"));
				productVO.setP_winery(rs.getString("p_winery"));
				productVO.setP_click_count(rs.getInt("p_click_count"));
				productVO.setP_buy_count(rs.getInt("p_buy_count"));
				productVO.setP_style(rs.getString("p_style"));
				productVO.setP_sales(rs.getString("p_sales"));
				productVO.setP_vol(rs.getInt("p_vol"));
				productVO.setP_alcho(rs.getDouble("p_alcho"));
				productVO.setP_date(rs.getTimestamp("p_date"));
				productVO.setP_type(rs.getString("p_type"));
				productVO.setP_grape(rs.getString("p_grape"));

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
		return productVO;
	}

	@Override
	public List<ProductVO> getAll() {
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO productVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				productVO = new ProductVO();
				productVO.setP_no(rs.getInt("p_no"));
				productVO.setP_name(rs.getString("p_name"));
				productVO.setP_year(rs.getInt("p_year"));
				productVO.setP_rate(rs.getInt("p_rate"));
				productVO.setP_area(rs.getString("p_area"));
				productVO.setP_intro(rs.getString("p_intro"));
				productVO.setP_num(rs.getInt("p_num"));
				productVO.setP_price(rs.getInt("p_price"));
				productVO.setP_status(rs.getString("p_status"));
				productVO.setP_winery(rs.getString("p_winery"));
				productVO.setP_click_count(rs.getInt("p_click_count"));
				productVO.setP_buy_count(rs.getInt("p_buy_count"));
				productVO.setP_style(rs.getString("p_style"));
				productVO.setP_sales(rs.getString("p_sales"));
				productVO.setP_vol(rs.getInt("p_vol"));
				productVO.setP_alcho(rs.getDouble("p_alcho"));
				productVO.setP_date(rs.getTimestamp("p_date"));
				productVO.setP_type(rs.getString("p_type"));
				productVO.setP_grape(rs.getString("p_grape"));
				list.add(productVO);
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

	@Override
	public List findProductType(String productlist) {
		List list = new ArrayList();

		ProductVO productVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			Statement st = con.createStatement();
			
			
			while (rs.next()) {String aaa = list.toString();

			list.add(aaa);
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

	@Override
	public List<String> findGrapeType(String productType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> findSomeProduct(String lcondition,
			String conditionValue) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> findFuzzyProductName(String fuzzyProductName) {
		// TODO Auto-generated method stub
		return null;
	}



}
