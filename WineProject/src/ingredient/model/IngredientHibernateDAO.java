package ingredient.model;

import hibernate.util.HibernateUtil;

import java.util.*;

import org.hibernate.Query;
import org.hibernate.Session;

public class IngredientHibernateDAO implements IngredientDAO_interface {

	private static final String GET_ALL_STMT = "FROM IngredientVO order by i_id";

	@Override
	public void insert(IngredientVO ingredientVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(ingredientVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void update(IngredientVO ingredientVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(ingredientVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public void delete(Integer i_id) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			IngredientVO ingredientVO = new IngredientVO();
			ingredientVO.setI_id(i_id);
			session.delete(ingredientVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public IngredientVO findByPrimaryKey(Integer i_id) {

		IngredientVO ingredientVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ingredientVO = (IngredientVO) session.get(IngredientVO.class, i_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return ingredientVO;
	}
	

	@Override
	public List<IngredientVO> getAll() {

		List<IngredientVO> list = new ArrayList<IngredientVO>();
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
	
	
//	public static void main(String[] args) {
//
//		IngredientHibernateDAO dao = new IngredientHibernateDAO();
//
//		// 新增
////		IngredientVO ingredientVO1 = new IngredientVO();
////		ingredientVO1.setI_name("新增馬鈴薯泥1");
////
////		dao.insert(ingredientVO1);
//
////		// 修改
////		IngredientVO ingredientVO2 = new IngredientVO();
////		ingredientVO2.setI_id(new Integer(2034));
////		ingredientVO2.setI_name("修改高麗菜12");
////
////		dao.update(ingredientVO2);
//
////		// 刪除
//		dao.delete(2035);
////
////		// // 查詢
////		IngredientVO ingredientVO3 = dao.findByPrimaryKey(102);
////		System.out.print(ingredientVO3.getI_id() + ",");
////		System.out.print(ingredientVO3.getI_name());
////		System.out.println("---------------------");
////
//		// 查詢
//		List<IngredientVO> list = dao.getAll();
//		for (IngredientVO aingredient : list) {
//			System.out.print(aingredient.getI_id() + ",");
//			System.out.print(aingredient.getI_name() + ",");
//
//			System.out.println("-1---------------1-");
//		}
//	}

}
