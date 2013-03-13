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
}
