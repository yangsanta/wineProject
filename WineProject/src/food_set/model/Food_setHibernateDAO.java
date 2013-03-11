package food_set.model;

import hibernate.util.HibernateUtil;

import java.util.*;
import java.sql.*;

import order_detail.model.Order_DetailHibernateDAO;
import order_detail.model.Order_DetailVO;

import org.hibernate.Query;
import org.hibernate.Session;

import coupon.model.CouponVO;

public class Food_setHibernateDAO implements Food_setDAO_interface {

	private static final String GET_ALL_STMT = "FROM Food_setVO order by Uniid desc";
	
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
	public void delete(Integer Uniid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Food_setVO food_setVO = new Food_setVO();
			food_setVO.setUniid(Uniid);
			session.delete(food_setVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public Food_setVO findByPrimaryKey(Integer Uniid) {
		Food_setVO food_setVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			food_setVO = (Food_setVO) session.get(Food_setVO.class, Uniid);
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

	@Override
	public Integer findTotalNOofFood_set() {
		Integer totalNO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("SELECT count(*) as count FROM Food_setVO ");
			Long count = (Long)query.list().get(0);
			totalNO = count.intValue();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
		return totalNO;
	}

	public static void main(String args[]) {
		
		Food_setHibernateDAO dao = new Food_setHibernateDAO();
		

		

		
		//測試insert()
//		DiscussionVO discussionVO1 = new DiscussionVO();
//		discussionVO1.setM_no(111);
//		discussionVO1.setD_context("oooxxxoooxxx");
//		discussionVO1.setD_datetime(new java.sql.Timestamp(new java.util.Date().getTime()));
//		discussionVO1.setD_status("000");
//		discussionVO1.setD_final_edit(new java.sql.Timestamp(new java.util.Date().getTime()));
//		discussionVO1.setD_title("請問聰明人喝的酒跟笨蛋喝的酒的差別?");
//		dao.insert(discussionVO1);
		
		
		//測試update()
//		DiscussionVO discussionVO2 = new DiscussionVO();
//		discussionVO2.setD_no(1010);
//		discussionVO2.setM_no(111);
//		discussionVO2.setD_context("11111111111");
//		discussionVO2.setD_datetime(new java.sql.Timestamp(new java.util.Date().getTime()));
//		discussionVO2.setD_status("000");
//		discussionVO2.setD_final_edit(new java.sql.Timestamp(new java.util.Date().getTime()));
//		discussionVO2.setD_title("請問聰明人喝的酒跟笨蛋喝的酒的差別?");
//		dao.update(discussionVO2);
				
		//測試delete()
//		dao.delete(1014);
		
		//測試findByPrimaryKey()
//		DiscussionVO aDiscussion= dao.findByPrimaryKey(1013);
//		System.out.print(aDiscussion.getD_no() + ",");
//		System.out.print(aDiscussion.getM_no() + ",");
//		System.out.print(aDiscussion.getD_context() + ",");
//		System.out.print(aDiscussion.getD_datetime() + ",");
//		System.out.print(aDiscussion.getD_status() + ",");
//		System.out.print(aDiscussion.getD_final_edit() + ",");
//		System.out.print(aDiscussion.getD_title());
//		System.out.println();	
		
		//測試getAll()
		List<Food_setVO> list = dao.getAll();
		for (Food_setVO aFood_set : list) {
			System.out.print(aFood_set.getUniid() + ",");
			System.out.print(aFood_set.getFs_id() + ",");
			System.out.print(aFood_set.getS_id());
			System.out.println();	
		}		
		
		//測試findTotalNOofDiscussion()總留言筆數
		Integer totalNO = dao.findTotalNOofFood_set();
		System.out.println("總留言筆數 = " + totalNO);
	}
}