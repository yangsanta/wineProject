package discussion.model;

import hibernate.util.HibernateUtil;

import java.util.*;
import java.sql.*;

import order_detail.model.Order_DetailHibernateDAO;
import order_detail.model.Order_DetailVO;

import org.hibernate.Query;
import org.hibernate.Session;

import coupon.model.CouponVO;

public class DiscussionHibernateDAO implements DiscussionDAO_interface {

	private static final String GET_ALL_STMT = "FROM DiscussionVO order by d_no";
	
	@Override
	public void insert(DiscussionVO discussionVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(discussionVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
}

	@Override
	public void update(DiscussionVO discussionVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(discussionVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
}

	@Override
	public void delete(Integer d_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			DiscussionVO discussionVO = new DiscussionVO();
			discussionVO.setD_no(d_no);
			session.delete(discussionVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public DiscussionVO findByPrimaryKey(Integer d_no) {
		DiscussionVO discussionVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			discussionVO = (DiscussionVO) session.get(DiscussionVO.class, d_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return discussionVO;
	}

	@Override
	public List<DiscussionVO> getAll() {
		List<DiscussionVO> list = new ArrayList<DiscussionVO>();
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
	public Integer findTotalNOofDiscussion() {
		Integer totalNO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("SELECT count(*) as count FROM DiscussionVO ");
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
		
		DiscussionHibernateDAO dao = new DiscussionHibernateDAO();
		

		

		
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
		List<DiscussionVO> list = dao.getAll();
		for (DiscussionVO aDiscussion : list) {
			System.out.print(aDiscussion.getD_no() + ",");
			System.out.print(aDiscussion.getM_no() + ",");
			System.out.print(aDiscussion.getD_context() + ",");
			System.out.print(aDiscussion.getD_datetime() + ",");
			System.out.print(aDiscussion.getD_status() + ",");
			System.out.print(aDiscussion.getD_final_edit() + ",");
			System.out.print(aDiscussion.getD_title());
			System.out.println();	
		}		
		
		//測試findTotalNOofDiscussion()總留言筆數
		Integer totalNO = dao.findTotalNOofDiscussion();
		System.out.println("總留言筆數 = " + totalNO);
	}
}