package reply.model;

import hibernate.util.HibernateUtil;

import java.util.*;
import java.sql.*;

import org.hibernate.Query;
import org.hibernate.Session;

import discussion.model.DiscussionVO;

public class ReplyHibernateDAO implements ReplyDAO_interface {

	private static final String GET_ALL_STMT = "FROM ReplyVO order by r_datetime desc";

	@Override
	public void insert(ReplyVO replyVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(replyVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(ReplyVO replyVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(replyVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer r_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			DiscussionVO discussionVO = new DiscussionVO();
			discussionVO.setD_no(r_no);
			session.delete(discussionVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public ReplyVO findByPrimaryKey(Integer r_no) {
		ReplyVO replyVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			replyVO = (ReplyVO) session.get(ReplyVO.class, r_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return replyVO;
	}

	@Override
	public List<ReplyVO> getAll() {
		List<ReplyVO> list = new ArrayList<ReplyVO>();
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
	public static void main(String[] args) {

		ReplyHibernateDAO dao = new ReplyHibernateDAO();

		// 新增
//		ReplyVO replyVO1 = new ReplyVO();
//		replyVO.setD_no(1001);
//		replyVO.setM_no(1001);
//		replyVO.setR_datetime(new java.sql.Timestamp(new java.util.Date().getTime()));
//		replyVO.setR_final_edit(new java.sql.Timestamp(new java.util.Date().getTime()));
//		dao.insert(replyVO);

		// 修改
//		ReplyVO replyVO2 = new ReplyVO();
//		replyVO2.setR_no(1001);
//		replyVO2.setD_no(1001);
//		replyVO2.setR_context("aaaaaaaaaaaa");
//		replyVO2.setM_no(1004);
//		replyVO2.setR_datetime(new java.sql.Timestamp(new java.util.Date().getTime()));
//		replyVO2.setR_status("1");
//		replyVO2.setR_final_edit(new java.sql.Timestamp(new java.util.Date().getTime()));
//		dao.update(replyVO2);

		// 刪除
//		dao.delete(1001);

		// 查詢
//		ReplyVO replyVO3 = dao.findByPrimaryKey(1004);
//
//		System.out.print(replyVO3.getR_no() + ",");
//		System.out.print(replyVO3.getD_no() + ",");
//		System.out.print(replyVO3.getR_context() + ",");
//		System.out.print(replyVO3.getM_no() + ",");
//		System.out.print(replyVO3.getR_datetime() + ",");
//		System.out.print(replyVO3.getR_status() + ",");
//		System.out.println(replyVO3.getR_final_edit());
//		System.out.println("---------------------");

		// 查詢
//		List<ReplyVO> list = dao.getAll();
//		for (ReplyVO aMember : list) {
//			System.out.print(aMember.getR_no() + ",");
//			System.out.print(aMember.getD_no() + ",");
//			System.out.print(aMember.getR_context() + ",");
//			System.out.print(aMember.getM_no() + ",");
//			System.out.print(aMember.getR_datetime() + ",");
//			System.out.print(aMember.getR_status() + ",");
//			System.out.print(aMember.getR_final_edit());
//			
//			System.out.println("------------------");
//		}
	}

}


