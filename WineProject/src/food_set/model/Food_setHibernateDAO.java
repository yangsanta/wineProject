package food_set.model;

import hibernate.util.HibernateUtil;
import ingredient.model.IngredientVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

public class Food_setHibernateDAO implements Food_setDAO_interface {

	private static final String GET_ALL_STMT = "FROM Food_setVO order by fs_id";
	private static final String GET_SOME_STMT_f_id = "FROM Food_setVO where f_id=? ";
	private static final String GET_SOME_STMT_i_id = " FROM Food_setVO where i_id=? ";

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

	// @Override
	// public void delete(Integer i_id) {
	// Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	// try {
	// session.beginTransaction();
	// IngredientVO ingredientVO = (IngredientVO) session.get(
	// IngredientVO.class, i_id);
	// session.delete(ingredientVO);
	// session.getTransaction().commit();
	// } catch (RuntimeException ex) {
	// session.getTransaction().rollback();
	// throw ex;
	// }
	// }

	// @Override
	// public void delete(Integer fs_id) {
	//
	// Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	// try {
	// session.beginTransaction();
	// Food_setVO food_setVO = new Food_setVO();
	// food_setVO.setFs_id(fs_id);
	// session.delete(food_setVO);
	// session.getTransaction().commit();
	// } catch (RuntimeException ex) {
	// session.getTransaction().rollback();
	// throw ex;
	// }
	//
	// }

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

	public Integer getSecendcountI_id() {
		Integer getSecendcountI_id;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			SQLQuery query = session
					.createSQLQuery(" select COUNT(a.i_id) from (select distinct i_id from food_set)as a");
			getSecendcountI_id = (Integer) query.uniqueResult();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return getSecendcountI_id;
	}

	// food 不重複最大值
	public Integer getlastReferer() {
		Integer list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			SQLQuery query = session
					.createSQLQuery("select COUNT( DISTINCT f_id) from food_set ");
			list = (Integer) query.uniqueResult();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	public Map<Integer, String> getSomebydF_id(Integer f_id) {
		List<Food_setVO> list = new ArrayList<Food_setVO>();
		List<String> list2 = new ArrayList<String>();
		List<IngredientVO> list3 = new ArrayList<IngredientVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			SQLQuery query = session
					.createSQLQuery("select * from food_set where i_id in (select Distinct i_id from food_set where f_id = ?)");
			query.setParameter(0, f_id);
			query.addEntity(Food_setVO.class);

			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

		Map<Integer, String> map = new HashMap<Integer, String>();
		for (Food_setVO a : list) {
			map.put(a.getIngredientVO().getI_id(), a.getIngredientVO()
					.getI_name());
		}

		return map;
		// return list;
	}

	public List<Food_setVO> getSomebyI_id(Integer i_id) {
		List<Food_setVO> list = new ArrayList<Food_setVO>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_SOME_STMT_i_id);
			query.setParameter(0, i_id);
			query.setCacheable(true); // 啟動Query快取
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;

	}

	// public List<Food_setVO> getSome(Integer f_id, Integer i_id, Integer s_id)
	// {
	//
	// List<Food_setVO> list = new ArrayList<Food_setVO>();
	// Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	// try {
	// session.beginTransaction();
	// Query query = session.createQuery(GET_SOME_STMT_f_i_s_id);
	// query.setParameter(0, f_id);
	// query.setParameter(1, i_id);
	// query.setParameter(2, s_id);
	// list = query.list();
	// session.getTransaction().commit();
	// } catch (RuntimeException ex) {
	// session.getTransaction().rollback();
	// throw ex;
	// }
	// return list;
	//
	// }

	public List<Food_setVO> getSomebyF_id(Integer f_id) {
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

	public static void main(String arg[]) {
		Food_setHibernateDAO dao = new Food_setHibernateDAO();
		System.out.println(dao.getlastReferer());
		Map<Integer, String> map = dao.getSomebydF_id(1);
		Set<Integer> set = map.keySet();
		for (Integer a : set) {
			System.out.println(a);
			System.out.println(map.get(a));
		}

	}

}
