package rg.model;

import hibernate.util.HibernateUtil;

import java.util.*;
import java.sql.*;

import member.model.MemberVO;

import org.hibernate.Query;
import org.hibernate.Session;

import discussion.model.DiscussionVO;

public class RgHibernateDAO implements RgDAO_interface {
	private static final String GET_ALL_STMT = "FROM RgVO order by u_id";

	@Override
	public void insert(RgVO rgVO) {

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(rgVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}	

	}

	@Override
	public void update(RgVO rgVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(rgVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer u_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			DiscussionVO discussionVO = new DiscussionVO();
			discussionVO.setD_no(u_id);
			session.delete(discussionVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

	}

	@Override
	public RgVO findByPrimaryKey(Integer u_id) {
		RgVO rgVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			rgVO = (RgVO) session.get(RgVO.class, u_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return rgVO;
	}

	@Override
	public List<RgVO> getAll() {
		List<RgVO> list = new ArrayList<RgVO>();
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

		RgHibernateDAO dao = new RgHibernateDAO();

	//-------------------------------------------------------	
		RgVO rgVO1 = new RgVO();
		rgVO1.setP_no(1);
		rgVO1.setR_or_g("r");

		rgVO1.setRgs_date(java.sql.Date.valueOf("2013-02-21"));
		rgVO1.setRge_date(java.sql.Date.valueOf("2013-4-30"));
		
		dao.insert(rgVO1);

	//----------------------------------------	
//		RgVO rgVO2 = new RgVO();
//		rgVO2.setU_id(new Integer(2));
//		rgVO2.setP_no(2);
//		rgVO2.setR_or_g("r");
//
//		rgVO2.setRgs_date(java.sql.Date.valueOf("2013-02-21"));
//		rgVO2.setRge_date(java.sql.Date.valueOf("2013-4-30"));
//		dao.update(rgVO2);

//--------------------------------------------
//		dao.delete(1);
//-----------------------------------------------
		
//		RgVO rgVO3 = dao.findByPrimaryKey(2);
//		System.out.print(rgVO3.getU_id() + ",");
//		System.out.print(rgVO3.getP_no() + ",");
//		System.out.print(rgVO3.getR_or_g() + ",");
//
//		System.out.print(rgVO3.getRgs_date() + ",");
//		System.out.print(rgVO3.getRge_date() + ",");
//		
//		System.out.println("---------------------");
//--------------------------------
		
//		List<RgVO> list = dao.getAll();
//		for (RgVO aRng : list) {
//			System.out.print(aRng.getU_id() + ",");
//			System.out.print(aRng.getP_no() + ",");
//			System.out.print(aRng.getR_or_g() + ",");
//
//			System.out.print(aRng.getRgs_date() + ",");
//			System.out.print(aRng.getRge_date() + ",");
//			
//			
//			System.out.println();
//		}
	}
}