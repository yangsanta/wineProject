package food.model;

import food_set.model.Food_setVO;
import hibernate.util.HibernateUtil;

import java.util.ArrayList;
import java.util.List;

import food.model.FoodVO;

import org.hibernate.Query;
import org.hibernate.Session;

public class FoodHibernateDAO implements FoodDAO_interface {
	private static final String GET_ALL_STMT = "from FoodVO order by f_id";

	@Override
	public void insert(FoodVO foodVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(foodVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(FoodVO foodVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(foodVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer f_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			FoodVO foodVo = new FoodVO();
			foodVo.setF_id(f_id);
			session.delete(foodVo);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public FoodVO findByPrimaryKey(Integer f_id) {
		FoodVO FoodVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			FoodVO = (FoodVO) session.get(FoodVO.class, f_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return FoodVO;
	}

	@Override
	public List<FoodVO> getAll() {
		List<FoodVO> list = new ArrayList<FoodVO>();
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
	
	public FoodVO findInformation(Integer f_name) {
		FoodVO foodVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			foodVO = (FoodVO) session.get(FoodVO.class, f_name);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return foodVO;
	}
	
	
	public Integer findHaveName(String name) {
		Integer totalNO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("SELECT count(*) as count FROM FoodVO where f_name=?");
			query.setParameter(0, name);
			Long count = (Long)query.list().get(0);
			totalNO = count.intValue();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
		return totalNO;
	}
	public static void main(String[] args) {

		FoodHibernateDAO dao = new FoodHibernateDAO();

		// 新增
		// FoodVO foodVO1 = new FoodVO();
		// foodVO1.setF_name("新增乳製品");
		//
		// dao.insert(foodVO1);

		// // 修改
		// FoodVO foodVO2 = new FoodVO();
		// foodVO2.setF_id(new Integer(1007));
		// foodVO2.setF_name("修改乳製品1");
		// //
		// dao.update(foodVO2);
		//
		// // 刪除
		// dao.delete(1007);
		//
		// // // 查詢
		// FoodVO foodVO3 = dao.findByPrimaryKey(102);
		// System.out.print(foodVO3.getF_id() + ",");
		// System.out.print(foodVO3.getF_name());
		// System.out.println("---------------------");
		//
		// 查詢
		// List<FoodVO> list = dao.getAll();
		// for (FoodVO afood : list) {
		// System.out.print(afood.getF_id() + ",");
		// System.out.print(afood.getF_name() + ",");
		//
		// System.out.println("-1---------------1-");
		// }
		// }
		List<FoodVO> list = dao.getAll();
		for (FoodVO aMember : list) {
			System.out.print(aMember.getF_name() + ",");

			System.out.println("------------------");
		}
	}

}
