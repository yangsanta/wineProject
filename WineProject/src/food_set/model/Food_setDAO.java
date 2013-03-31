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

public class Food_setDAO implements Food_setDAO_interface {

	private static final String GET_ALL_STMT = "FROM Food_setVO order by fs_id";
	private static final String GET_SOME_STMT_f_id = "FROM Food_setVO where f_id=? ";
	private static final String GET_SOME_STMT_f_i_s_id = "FROM Food_setVO where f_id=? i_id=? s_id=? ";

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

	public List<Food_setVO> getSome(Integer f_id) {

		List<Food_setVO> list = new ArrayList<Food_setVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_SOME_STMT_f_id);
			query.setParameter(0, f_id);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;

	}
	
	public List<Food_setVO> getSomeFIS(Integer f_id, Integer i_id, Integer s_id) {

		List<Food_setVO> list = new ArrayList<Food_setVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_SOME_STMT_f_i_s_id);
			query.setParameter(0, f_id);
			query.setParameter(0, i_id);
			query.setParameter(0, s_id);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;

	}


}
