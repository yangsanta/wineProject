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
		List<DiscussionVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			DiscussionVO discussionVO = new DiscussionVO();
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
		
		//測試findTotalNOofDiscussion總留言筆數
		DiscussionHibernateDAO dao = new DiscussionHibernateDAO();
		Integer totalNO = dao.findTotalNOofDiscussion();
		System.out.println(totalNO);
	}
}