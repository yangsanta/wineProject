﻿package member.model;

import hibernate.util.HibernateUtil;

import java.util.*;
import java.sql.*;

import org.hibernate.Query;
import org.hibernate.Session;

import discussion.model.DiscussionVO;

public class MemberHibernateDAO implements MemberDAO_interface {
	
	private static final String GET_ALL_STMT = "FROM MemberVO order by m_no";
	
	@Override
	public void insert(MemberVO memberVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(memberVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	
	}

	@Override
	public void update(MemberVO memberVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(memberVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer m_no) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			DiscussionVO discussionVO = new DiscussionVO();
			discussionVO.setD_no(m_no);
			session.delete(discussionVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public MemberVO findByPrimaryKey(Integer m_no) {
		MemberVO memberVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			memberVO = (MemberVO) session.get(MemberVO.class, m_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
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

	public MemberVO findInformation(Integer m_no) {
		MemberVO memberVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			memberVO = (MemberVO) session.get(MemberVO.class, m_no);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return memberVO;
	}
	//利用帳號去搜尋該會員資訊
	public MemberVO findInformationByM_id(String m_id) {
		MemberVO memberVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM MemberVO WHERE m_id = ?");
			query.setParameter(0, m_id);
			memberVO=(MemberVO) query.uniqueResult();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return memberVO;
	}
	
	public Integer findHaveName(String id) {
		Integer totalNO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("SELECT count(*) as count FROM MemberVO where m_id=?");
			query.setParameter(0, id);
			Long count = (Long)query.list().get(0);
			totalNO = count.intValue();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
		return totalNO;
	}
	
	public MemberVO Login(String id ,String pwd) {
		MemberVO memberVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM MemberVO where m_id=? AND m_pwd=?");
			query.setParameter(0, id);
			query.setParameter(1, pwd);
			if(!query.list().isEmpty()){
			memberVO=(MemberVO) query.list().get(0);}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
		return memberVO;
	}
	
	public MemberVO FBLogin(String id) { //fb登入用 會員登入 檢查是否有該UID
		MemberVO memberVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try {
			session.beginTransaction();
			Query query = session.createQuery("FROM MemberVO where m_fbuid=? ");
			query.setParameter(0, id);
			if(!query.list().isEmpty()){
			memberVO=(MemberVO) query.list().get(0);}
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}		
		return memberVO;
	}
	public static void main(String[] args) {

		MemberHibernateDAO dao = new MemberHibernateDAO();

		// 新增
//		MemberVO memberVO1 = new MemberVO();
//		memberVO1.setM_name("newnewn");
//		memberVO1.setM_pwd("president");
//		memberVO1.setM_mobile("0955959888");
//		memberVO1.setM_email("kk.jj@yahoo.com");
//		memberVO1.setM_bday(java.sql.Date.valueOf("1981-11-17"));
//		memberVO1.setM_addr("Taipei,Taiwan,ROC.");
//		memberVO1.setM_pic("D:/userimages/00000.jpg");
//		memberVO1.setM_safety_q("Whats the name of my best classmate in elementary school?");
//		memberVO1.setM_safety_a("Queen");
//		memberVO1.setM_status(new Integer(2));
//		dao.insert(memberVO1);

		// 修改
//		MemberVO memberVO2 = new MemberVO();
//		memberVO2.setM_no(new Integer(1002));
//		memberVO2.setM_name("king12");
//		memberVO2.setM_pwd("president");
//		memberVO2.setM_mobile("0955959888");
//		memberVO2.setM_email("kk.jj@yahoo.com");
//		memberVO2.setM_bday(java.sql.Date.valueOf("1981-11-17"));
//		memberVO2.setM_addr("Taipei,Taiwan,ROC.");
//		memberVO2.setM_pic("D:/userimages/00000.jpg");
//		memberVO2.setM_safety_q("Whats the name of my best classmate in elementary school?");
//		memberVO2.setM_safety_a("Queen");
//		memberVO2.setM_status(new Integer(2));
//		dao.update(memberVO2);

		// 刪除
//		dao.delete(1001);

		// 查詢
//		MemberVO memberVO3 = dao.findByPrimaryKey(1004);
//		System.out.print(memberVO3.getM_no() + ",");
//		System.out.print(memberVO3.getM_name() + ",");
//		System.out.print(memberVO3.getM_pwd() + ",");
//		System.out.print(memberVO3.getM_mobile() + ",");
//		System.out.print(memberVO3.getM_email() + ",");
//		System.out.print(memberVO3.getM_bday() + ",");
//		System.out.println(memberVO3.getM_addr());
//		System.out.println(memberVO3.getM_pic());
//		System.out.println(memberVO3.getM_safety_q());
//		System.out.println(memberVO3.getM_safety_a());
//		System.out.println(memberVO3.getM_status());
//		System.out.println("---------------------");

		// 查詢
//		List<MemberVO> list = dao.getAll();
//		for (MemberVO aMember : list) {
//			System.out.print(aMember.getM_id() + ",");
//			System.out.print(aMember.getM_no() + ",");
//			System.out.print(aMember.getM_name() + ",");
//			System.out.print(aMember.getM_pwd() + ",");
//			System.out.print(aMember.getM_mobile() + ",");
//			System.out.print(aMember.getM_email() + ",");
//			System.out.print(aMember.getM_bday() + ",");
//			System.out.println(aMember.getM_addr() + ",");
//			System.out.println(aMember.getM_pic() + ",");
//			System.out.println(aMember.getM_safety_q() + ",");
//			System.out.println(aMember.getM_safety_a() + ",");
//			System.out.println(aMember.getM_status());
//			
//			System.out.println("------------------");
//		}
        
//        MemberVO memberVO4 = dao.findInformation(1001);
//        System.out.println(memberVO4.getM_id() + ",");
//		System.out.println(memberVO4.getM_no() + ",");
//		System.out.println(memberVO4.getM_name() + ",");
//		System.out.println(memberVO4.getM_pwd() + ",");
//		System.out.println(memberVO4.getM_mobile() + ",");
//		System.out.println(memberVO4.getM_email() + ",");
//		System.out.println(memberVO4.getM_bday() + ",");
//		System.out.println(memberVO4.getM_addr() + ",");
//		System.out.println(memberVO4.getM_pic() + ",");
//		System.out.println(memberVO4.getM_safety_q() + ",");
//		System.out.println(memberVO4.getM_safety_a() + ",");
//		System.out.println(memberVO4.getM_status());
        
		
		MemberVO memberVO5 = dao.findInformationByM_id("bbb");
        System.out.println(memberVO5.getM_id() + ",");
		System.out.println(memberVO5.getM_no() + ",");
		System.out.println(memberVO5.getM_name() + ",");
		System.out.println(memberVO5.getM_pwd() + ",");
		System.out.println(memberVO5.getM_mobile() + ",");
		System.out.println(memberVO5.getM_email() + ",");
		System.out.println(memberVO5.getM_bday() + ",");
		System.out.println(memberVO5.getM_addr() + ",");
		System.out.println(memberVO5.getM_pic() + ",");
		System.out.println(memberVO5.getM_safety_q() + ",");
		System.out.println(memberVO5.getM_safety_a() + ",");
		System.out.println(memberVO5.getM_status());
	}
}
