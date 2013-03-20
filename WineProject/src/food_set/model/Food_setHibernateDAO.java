package food_set.model;

import food.model.FoodHibernateDAO;
import food.model.FoodVO;
import hibernate.util.HibernateUtil;
import ingredient.model.IngredientVO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import sauce.model.SauceVO;
import product.model.ProductVO;

public class Food_setHibernateDAO implements Food_setDAO_interface {

	private static final String GET_ALL_STMT = "FROM Food_setVO order by fs_id";
	private static final String GET_SOME_STMT_f_i_s_id = "FROM Food_setVO where f_id=? and i_id=? and s_id=?";

	@Override
	public void insert(Food_setVO food_setVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(food_setVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(Food_setVO food_setVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(food_setVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer fs_id) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Food_setVO food_setVO = new Food_setVO();
			food_setVO.setFs_id(fs_id);
			session.delete(food_setVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public Food_setVO findByPrimaryKey(Integer fs_id) {
		Food_setVO food_setVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			food_setVO = (Food_setVO) session.get(Food_setVO.class, fs_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return food_setVO;
	}

	@Override
	public List<Food_setVO> getAll() {

		List<Food_setVO> list = new ArrayList<Food_setVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;

	}

	public List<Food_setVO> getSome(Integer f_id, Integer i_id, Integer s_id) {

		List<Food_setVO> list = new ArrayList<Food_setVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_SOME_STMT_f_i_s_id);
			query.setParameter(0, f_id);
			query.setParameter(1, i_id);
			query.setParameter(2, s_id);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;

	}

	public static void main(String[] args) {
		Food_setHibernateDAO dao = new Food_setHibernateDAO();

		// 新增
		 Food_setVO food_setVO = new Food_setVO();
		 food_setVO.setFs_id(new Integer(1));
		
		 ProductVO productVO = new ProductVO();
		 productVO.setP_no(30);
		
		 FoodVO foodVO = new FoodVO();
		 foodVO.setF_id(1001);
		
		 IngredientVO ingredientVO = new IngredientVO();
		 ingredientVO.setI_id(2001);
		
		 SauceVO sauceVO = new SauceVO();
		 sauceVO.setS_id(3001);
		
		 food_setVO.setProductVO(productVO);
		 food_setVO.setFoodVO(foodVO);
		 food_setVO.setIngredientVO(ingredientVO);
		 food_setVO.setSauceVO(sauceVO);
		 dao.insert(food_setVO);

		// // 刪除
		// dao.delete(1);

		// // // 查詢
		// Food_setVO food_setVO3 = dao.findByPrimaryKey(5);
		// System.out.print(food_setVO3.getFs_id() + ",");
		// System.out.print(food_setVO3.getProductVO().getP_no() + ",");
		// System.out.print(food_setVO3.getProductVO().getP_name() + ",");
		// System.out.print(food_setVO3.getFoodVO().getF_id() + ",");
		// System.out.print(food_setVO3.getFoodVO().getF_name() + ",");
		// System.out.print(food_setVO3.getIngredientVO().getI_id() + ",");
		// System.out.print(food_setVO3.getIngredientVO().getI_name() + ",");
		// System.out.print(food_setVO3.getSauceVO().getS_id() + ",");
		// System.out.print(food_setVO3.getSauceVO().getS_name() + ",");
		// System.out.println("---------------------");

		// 查詢all
		// List<Food_setVO> list = dao.getAll();
		// for (Food_setVO afood_set : list) {
		// System.out.print(afood_set.getFs_id() + ",");
		// System.out.print(afood_set.getProductVO().getP_no() + ",");
		// System.out.print(afood_set.getProductVO().getP_name() + ",");
		// System.out.print(afood_set.getFoodVO().getF_id() + ",");
		// System.out.print(afood_set.getFoodVO().getF_name() + ",");
		// System.out.print(afood_set.getIngredientVO().getI_id() + ",");
		// System.out.print(afood_set.getIngredientVO().getI_name() + ",");
		// System.out.print(afood_set.getSauceVO().getS_id() + ",");
		// System.out.print(afood_set.getSauceVO().getS_name() + ",");
		// System.out.println("---------------------");

		List<Food_setVO> list = dao.getAll();
		for (Food_setVO aEmp : list) {
			System.out.print(aEmp.getFs_id() + ",");
			System.out.print(aEmp.getProductVO().getP_no() + ",");
			System.out.print(aEmp.getProductVO().getP_name() + ",");
			System.out.print(aEmp.getFoodVO().getF_id() + ",");
			System.out.print(aEmp.getFoodVO().getF_name() + ",");
			System.out.print(aEmp.getIngredientVO().getI_id() + ",");
			System.out.print(aEmp.getIngredientVO().getI_name() + ",");
			System.out.print(aEmp.getSauceVO().getS_id() + ",");
			System.out.print(aEmp.getSauceVO().getS_name() + ",");
			// 注意以下三行的寫法 (優!)
			// System.out.print(aEmp.getDeptVO().getDeptno() + ",");
			// System.out.print(aEmp.getDeptVO().getDname() + ",");
			System.out.println();

		}
	}
}
